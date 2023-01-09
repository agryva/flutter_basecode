

import 'package:base_code_flutter/data/repositories/local/local_repository.dart';
import 'package:base_code_flutter/data/repositories/remote/repository.dart';
import 'package:base_code_flutter/data/repositories/repository_impl.dart';

class MasterRepository extends RepositoryImpl {
  final RemoteRepository remoteRepository;
  final LocalRepository localRepository;

  MasterRepository(this.remoteRepository, this.localRepository);

  @override
  Future getRepositoriesData(int page, String search) {
    return remoteRepository.getRepositoriesData(page, search);
  }
}