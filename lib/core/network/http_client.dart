import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:restorecommendapps/core/network/logging_interceptor.dart';

final httpClient = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);
