import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'NewsApi.g.dart';

//region Description
@RestApi(baseUrl: "http://newsapi.org/v2")
abstract class NewsAPI {
  factory NewsAPI(Dio dio, {String baseUrl}) = _NewsAPI;

  @GET("/top-headlines?country=us&category=business&apiKey=3eb084ad893e42589d98635008b06cd8")
  Future<String> getExample();

  @GET("/top-headlines")
  Future<String> getTopHeadline(
      @Query("country") String country,
      @Query("category") String category,
      @Query("apiKey") String apiKey,
      @Query("pageSize") int pageSize,
      @Query("page") int page
      );

}
//endregion



