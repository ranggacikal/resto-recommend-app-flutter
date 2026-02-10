import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    if (kDebugMode) {
      print('REQUEST');
      print('URL: ${request.url}');
      print('METHOD: ${request.method}');
      print('HEADERS: ${request.headers}');
    }
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) async {
    if (kDebugMode) {
      print('⬅️ RESPONSE');
      print('STATUS: ${response.statusCode}');
    }
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() async => true;

  @override
  FutureOr<bool> shouldInterceptResponse() async => true;

}