// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/api_client.dart' as _i4;
import '../bloc/main_page_cubit.dart' as _i6;
import '../services/ticker_service.dart' as _i5;
import 'modules/api_module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.lazySingleton<_i3.Dio>(() => apiModule.dio());
  gh.lazySingleton<_i4.ApiClient>(() => apiModule.apiClient(get<_i3.Dio>()));
  gh.factory<_i5.TickerService>(() => _i5.TickerService(get<_i4.ApiClient>()));
  gh.factory<_i6.MainPageCubit>(
      () => _i6.MainPageCubit(get<_i5.TickerService>()));
  return get;
}

class _$ApiModule extends _i7.ApiModule {}
