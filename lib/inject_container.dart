

import 'package:alice/alice.dart';
import 'package:base_code_flutter/data/repositories/local/local_repository.dart';
import 'package:base_code_flutter/data/repositories/master_repository.dart';
import 'package:base_code_flutter/data/repositories/remote/dio_client.dart';
import 'package:base_code_flutter/data/repositories/remote/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final inject = GetIt.instance;

Future<void> init(String baseUrl) async {
  //Repository
  inject.registerLazySingleton(() => const FlutterSecureStorage());
  inject.registerLazySingleton(() => Alice());
  inject.registerLazySingleton(() => DioClient(baseUrl));
  inject.registerLazySingleton(() => inject<DioClient>().dio);
  inject.registerLazySingleton(() => MasterRepository(
    RemoteRepository(),
    LocalRepository(),
  ));

  inject.registerLazySingleton(() => RemoteRepository());


}