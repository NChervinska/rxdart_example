import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rxdart_example/api/api_constants.dart';
import 'package:rxdart_example/models/people.dart';
import 'package:rxdart_example/models/ticker.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/ticker')
  Future<List<Ticker>> getTickers();

  @GET('/search')
  Future<People> getPeople(
    @Query('q') String query, {
    @Query('c') String q = ApiConstants.filter,
    @Query('limit') int limit = 25,
  });
}
