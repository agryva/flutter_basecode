import 'package:base_code_flutter/inject_container.dart';
import 'package:base_code_flutter/presentation/bloc/github_repository/github_repository_cubit.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late GithubRepositoryCubit githubRepositoryCubit;

  @override
  void initState() {
    initBloc();
    super.initState();
  }

  void initBloc() {
    githubRepositoryCubit = GithubRepositoryCubit(inject());
    githubRepositoryCubit.fetchData(1, 'somecalendar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: const [
            Text('Test')
          ],
        ),
      ),
    );
  }
}
