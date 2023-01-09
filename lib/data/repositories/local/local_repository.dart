import 'package:base_code_flutter/data/repositories/repository_impl.dart';
import 'package:base_code_flutter/inject_container.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalRepository extends RepositoryImpl {

  FlutterSecureStorage get storage => inject<FlutterSecureStorage>();

  @override
  Future getRepositoriesData(int page, String search) {
    throw UnimplementedError();
  }

}