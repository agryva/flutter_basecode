
import 'package:alice/alice.dart';
import 'package:base_code_flutter/inject_container.dart';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer2/dio_flutter_transformer2.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final String apiBaseUrl;

  DioClient(this.apiBaseUrl);

  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    Dio dio = Dio(options);
    dio.transformer = FlutterTransformer();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));
    dio.interceptors.add(inject<Alice>().getDioInterceptor());
    return dio;
  }
}