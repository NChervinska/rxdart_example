import 'dart:developer';

import 'package:flutter/foundation.dart';

abstract class BaseService {
  Future<T> makeErrorParsedCall<T>(AsyncValueGetter<T> callback) async {
    try {
      return await callback();
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
}
