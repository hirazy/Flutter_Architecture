import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

@RestApi(baseUrl : "https://api.themoviedb.org/3/")
class WeatherApiClient{

  // factory WeatherApiClient(Dio dio, {String baseUrl}) = _WeatherApiClient;
  //
  // @GET("movie/popular")
  // Future<MovieResult> getMoviePopular(@Query("api_key") String apiKey);
  //
  // @GET("movie/upcoming")
  // Future<MovieResult> getMovieUpComing(@Query("api_key") String apiKey);
  //
  // @GET("movie/{id}/credits")
  // Future<ResultCrew> getCrewMovie(@Path("id")String id, @Query("api_key") String apiKey);
}