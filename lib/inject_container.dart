

import 'package:alice/alice.dart';
import 'package:base_code_flutter/data/repositories/remote/dio_client.dart';
import 'package:base_code_flutter/data/repositories/remote/repository.dart';
import 'package:get_it/get_it.dart';

final inject = GetIt.instance;

Future<void> init(String baseUrl) async {
  inject.registerLazySingleton(() => Alice());
  inject.registerLazySingleton(() => DioClient(baseUrl));
  inject.registerLazySingleton(() => inject<DioClient>().dio);

  inject.registerLazySingleton(() => MasterRepository());
}