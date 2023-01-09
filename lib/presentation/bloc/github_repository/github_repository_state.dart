import 'package:base_code_flutter/data/models/body/repository_body.dart';

class GithubRepositoryState {}

class InitialGithubRepositoryState extends GithubRepositoryState {}

class GithubRepositoryLoading extends GithubRepositoryState {}

class GithubRepositoryLoaded extends GithubRepositoryState {
  final ResponseRepositoryBody response;

  GithubRepositoryLoaded(this.response);
}

class GithubRepositoryNotLoaded extends GithubRepositoryState {
  GithubRepositoryNotLoaded(this.error);

  final String error;
}
