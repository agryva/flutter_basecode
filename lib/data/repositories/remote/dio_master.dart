import 'package:base_code_flutter/inject_container.dart';
import 'package:dio/dio.dart';

abstract class DioMaster {
  Dio get dio => inject<Dio>();

  sendGetRequest(String url, {dynamic queryParams}) async {
    final response = await dio.get(url, queryParameters: queryParams);
    return response;
  }
}
