import 'dart:io';

import 'package:dio/dio.dart';

import 'log_help.dart';

Map<String, String> catchDioError(dynamic err) {
  logger.d(err);
  if (err is DioError) {
    if (err.error is SocketException) {
      logger.e(err.error.message);
      return {'errorMessage': 'Server Down'};
    } else {
      logger.e(err.response);
      return {'errorMessage': err.response.data['message']};
    }
  } else {
    logger.e(err);
    return {'errorMessage': 'An unknown error occurred, contact the team.'};
  }
}