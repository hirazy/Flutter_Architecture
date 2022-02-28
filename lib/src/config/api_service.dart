class ApiService{

  factory ApiService() => _getInstance();

  static ApiService get instance => _getInstance();
  static late ApiService _instance;

  static final int requestSucceed = 0;
  static final int requestFailed = 1;

  ApiService._internal() {
    ///初始化
  }

  static ApiService _getInstance() {
    _instance ??= ApiService._internal();
    return _instance;
  }





}