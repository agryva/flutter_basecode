import 'package:base_code_flutter/data/models/body/repository_body.dart';
import 'package:base_code_flutter/data/repositories/remote/dio_master.dart';
import 'package:base_code_flutter/data/repositories/repository_impl.dart';
import 'package:base_code_flutter/utils/ExceptionsCustom.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MasterRepository extends RepositoryImpl with DioMaster {
  @override
  Future<ResponseRepositoryBody> getRepositoriesData(int page, String search) async {
    try {
      final response = await sendGetRequest('/search/repositories', queryParams: {
        "page": page,
        'q': search,
        'per_page': 10,
      });

      return ResponseRepositoryBody.fromJson(response.data);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw ExceptionsCustom("Something went wrong");
    }
  }

}
