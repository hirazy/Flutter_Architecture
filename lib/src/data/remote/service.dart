
import 'package:dio/dio.dart';
import 'package:flutter_map/src/data/model/weather.dart';
import 'package:retrofit/retrofit.dart';

import '../../constants.dart';


@RestApi(baseUrl: BASE_URL)
abstract class WeatherService {
  // factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<Weather>> getBreakingNewsArticles({
    @Query("apiKey") String apiKey,
    @Query("country") String country,
    @Query("category") String category,
    @Query("page") int page,
    @Query("pageSize") int pageSize,
  });
}
