import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart_example/api/models/api_error.dart';
import 'package:rxdart_example/exception/api_exception.dart';
import 'package:rxdart_example/resources/app_strings.dart';

abstract class BaseService {
  Future<T> makeErrorParsedCall<T>(AsyncValueGetter<T> callback) async {
    try {
      return await callback();
    } on DioError catch (exception) {
      throw await _getProccessedDioError(exception);
    } on ApiException {
      rethrow;
    } catch (exception, stackTrace) {
      log(
        AppStrings.errorString,
        name: 'BaseService Error',
        error: exception,
        stackTrace: stackTrace,
      );

      throw Exception(AppStrings.errorString);
    }
  }

  Future<ApiException> _getProccessedDioError(
    DioError exception,
  ) async {
    const unknownApiException = ApiException(
      message: AppStrings.errorString,
    );

    try {
      final response = exception.response?.data;
      if (response == null) {
        return unknownApiException;
      }
      final apiError = ApiError.fromJson(response);
      return ApiException(
        message: apiError.error,
      );
    } catch (_) {
      return unknownApiException;
    }
  }
}
