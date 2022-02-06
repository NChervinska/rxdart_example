import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class BaseService {
  Future<T> makeErrorParsedCall<T>(AsyncValueGetter<T> callback) async {
    try {
      return await callback();
    } on DioError catch (exception) {
      throw await _getProccessedDioError(exception);
    } on Exception {
      rethrow;
    } catch (exception, stackTrace) {
      log(
        'BaseService Error',
        name: 'BaseService Error',
        error: exception,
        stackTrace: stackTrace,
      );

      throw Exception(exception);
    }
  }

  Future<Exception> _getProccessedDioError(
    DioError exception,
  ) async {
    final unknownApiException = Exception([exception.message]);

    try {
      final response = exception.response?.data;
      if (response == null) {
        return unknownApiException;
      }
      return Exception([response['error']]);
    } catch (_) {
      return unknownApiException;
    }
  }
}
