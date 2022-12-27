


import 'dart:convert';
import 'package:dio/dio.dart';
import '../nertwork_config.dart';

// setting up base url connections and Auth headers
connect() {
  BaseOptions options = BaseOptions(
      baseUrl: NetworkConfig.BASE_URL,
      connectTimeout: 100000,
      receiveTimeout: 30000,
      responseType: ResponseType.plain);
  Dio dio = Dio(options);
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        print(options.uri.path);
        print(options.data.toString());
          options.headers['Authorization'] = "Basic ${NetworkConfig.AUTH}";
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        return handler.next(response);
      },
      onError: (DioError e, handler) async {
        print("status code: ${e.message}");
        print("status message: ${e.error}");
        print(e.type);
        print(e.response?.statusCode);
        print(e.response?.data.runtimeType);
        print("${e.response?.data.toString()}");
        try {
          if ((e.response?.statusCode == 401 &&
              jsonDecode(e.response?.data)['message'] != null &&
              jsonDecode(e.response?.data)['message'] ==
                  "Given token not valid for any token type")) {
          }
        } on DioError catch (e) {
          return handler.next(e);
        }
        return handler.next(e);
      },
    ),
  );
  return dio;
}

