
import 'package:base_code_flutter/data/repositories/remote/repository.dart';
import 'package:base_code_flutter/presentation/bloc/github_repository/github_repository_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GithubRepositoryCubit extends Cubit<GithubRepositoryState> {
  GithubRepositoryCubit(this.repository) : super(InitialGithubRepositoryState());

  final MasterRepository repository;

  fetchData(int page, String query) async {
    emit(InitialGithubRepositoryState());
    try {
      final response = await repository.getRepositoriesData(page, query);
      emit(GithubRepositoryLoaded(response));
    } catch(e) {
      emit(GithubRepositoryNotLoaded(e.toString()));
    }
  }
}