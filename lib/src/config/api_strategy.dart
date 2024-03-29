import 'package:dio/dio.dart';

class ApiStrategy{

  static late ApiStrategy _instance;

  static final String baseUrl = "";

  static const int connectTimeOut = 10 * 1000;
  static const int receiveTimeout = 15 * 1000;

  late Dio _client;

  static ApiStrategy getInstance(){
    if(_instance == null){
      _instance = ApiStrategy._internal();
    }

    return _instance;
  }

  ApiStrategy._internal(){
   if(_client == null){
      BaseOptions options = BaseOptions();
      options.connectTimeout = connectTimeOut;
      options.receiveTimeout = receiveTimeout;
      options.baseUrl = baseUrl;
      _client = Dio(options);
      _client.interceptors.add(LogInterceptor(
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        request: true
      ));
   }
  }

  Dio get client => _client;

  static const String GET = "get";
  static const String POST = "post";

  static String getBaseUrl(){
    return baseUrl;
  }

  void get(String url, Function callBack, {
    Map<String, String>? params, Function? errorCallBack,
    CancelToken? token
  }) async{
    _request(url,
        callBack,
        method: GET,
        params: params,
      errorCallBack: errorCallBack,
      token: token
    );
  }


  //post请求
  void post(
      String url,
      Function callBack, {
        Map<String, String>? params,
        Function? errorCallBack,
        CancelToken? token,
      }) async {
    _request(
      url,
      callBack,
      method: POST,
      params: params,
      errorCallBack: errorCallBack,
      token: token,
    );
  }

  //post请求
  void postUpload(
      String url,
      Function callBack,
      ProgressCallback progressCallBack, {
        FormData? formData,
        Function? errorCallBack,
        CancelToken? token,
      }) async {
    _request(
      url,
      callBack,
      method: POST,
      formData: formData,
      errorCallBack: errorCallBack,
      progressCallBack: progressCallBack,
      token: token,
    );
  }

  void _request(
      String url,
      Function callBack, {
        String? method,
        Map<String, String>? params,
        FormData? formData,
        Function? errorCallBack,
        ProgressCallback? progressCallBack,
        CancelToken? token,
      }) async {
    if (params != null && params.isNotEmpty) {
      print("<net> params :" + params.toString());
    }

    String errorMsg = "";
    int statusCode;
    try {
      Response response;
      if (method == GET) {
        //组合GET请求的参数
        if (params != null && params.isNotEmpty) {
          response = await _client.get(
            url,
            queryParameters: params,
            cancelToken: token,
          );
        } else {
          response = await _client.get(
            url,
            cancelToken: token,
          );
        }
      } else {
        if (params != null && params.isNotEmpty) {
          response = await _client.post(
            url,
            data: formData ?? new FormData.fromMap(params),
            onSendProgress: progressCallBack,
            cancelToken: token,
          );
        } else {
          response = await _client.post(
            url,
            cancelToken: token,
          );
        }
      }

      statusCode = response.statusCode!;

      //处理错误部分
      if (statusCode < 0) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack!, errorMsg);
        return;
      }

      if (callBack != null) {
        callBack(response.data);
      }
    } catch (e) {
      _handError(errorCallBack!, e.toString());
    }
  }

  //处理异常
  static void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("<net> errorMsg :" + errorMsg);
  }

}