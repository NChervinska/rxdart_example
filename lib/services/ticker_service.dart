import 'package:injectable/injectable.dart';
import 'package:rxdart_example/api/api_client.dart';
import 'package:rxdart_example/api/models/people.dart';
import 'package:rxdart_example/api/models/ticker_dto.dart';

import 'base_service.dart';

@injectable
class TickerService extends BaseService {
  final ApiClient _apiClient;

  TickerService(this._apiClient);

  Future<List<TickerDto>> getTickers() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getTickers();
    });
  }

  Future<People> getPeople(String query) async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getPeople(query);
    });
  }
}
