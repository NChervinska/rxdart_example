import 'package:injectable/injectable.dart';
import 'package:rxdart_example/api/api_client.dart';
import 'package:rxdart_example/api/models/ticker.dart';

import 'base_service.dart';

@injectable
class TickerService extends BaseService {
  final ApiClient _apiClient;

  TickerService(this._apiClient);

  Future<List<Ticker>> getTickers() async {
    return await makeErrorParsedCall(() async {
      return await _apiClient.getTickers();
    });
  }
}
