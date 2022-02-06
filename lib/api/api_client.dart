import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:rxdart_example/api/api_constants.dart';
import 'package:rxdart_example/api/models/ticker_dto.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    String baseUrl,
  }) = _ApiClient;

  @GET('/ticker')
  Future<List<TickerDto>> getTickers();
}
