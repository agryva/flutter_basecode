import 'package:animate_do/animate_do.dart';
import 'package:base_code_flutter/inject_container.dart';
import 'package:base_code_flutter/presentation/bloc/github_repository/github_repository_cubit.dart';
import 'package:base_code_flutter/presentation/bloc/github_repository/github_repository_state.dart';
import 'package:base_code_flutter/presentation/component/empty_view.dart';
import 'package:base_code_flutter/presentation/component/loading_indicator.dart';
import 'package:base_code_flutter/presentation/view/home/component/repo_component.dart';
import 'package:base_code_flutter/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    githubRepositoryCubit.fetchData(1, 'some calendar');

    githubRepositoryCubit.stream.listen((state) {
      if (state is GithubRepositoryNotLoaded) {
        Helpers.showSnackBar(context,
            snackBarMode: SnackBarMode.error,
            content: state.error,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: BlocBuilder(
              bloc: githubRepositoryCubit,
              builder: (context, state) {

                if (state is GithubRepositoryLoaded) {
                  return ListView.builder(
                    itemCount: state.response.items?.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return FadeIn(
                        child: RepoComponent(
                          data: state.response.items![index],
                        ),
                      );
                    },
                  );
                }

                if (state is GithubRepositoryNotLoaded) {
                  return const EmptyView();
                }

                if (state is GithubRepositoryLoading) {
                  return const Center(child: LoadingIndicator());
                }

                return Container();
              },
            )
          ),
        ),
      ),
    );
  }
}
