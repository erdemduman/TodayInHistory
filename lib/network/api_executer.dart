import 'package:flutter/material.dart';

class ApiExecuter {
  void execute<T>(
      {@required Future<T> Function([Map<String, dynamic>?])? action,
      Map<String, dynamic>? param,
      Function(T)? onSuccess,
      Function(Exception)? onFail}) async {
    try {
      var result = await action!(param);
      onSuccess!(result);
    } catch (error) {
      onFail!(error as Exception);
    }
  }
}

class ApiException implements Exception {
  int? statusCode;
  ApiException({this.statusCode});
}

enum ApiError { INTERNAL_SERVER_ERROR, NO_CONNECTION }
