import 'package:alice/alice.dart';
import 'package:base_code_flutter/data/constant/string_constant.dart';
import 'package:base_code_flutter/inject_container.dart';
import 'package:base_code_flutter/presentation/view/home/home_view.dart';
import 'package:base_code_flutter/utils/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get/get.dart';

void main() {
  BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await init(StringConstant.baseUrl);
    runApp(const MyApp());
  },
    blocObserver: GithubBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en_En', null);
    return GetMaterialApp(
      navigatorKey: inject<Alice>().getNavigatorKey(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const HomeView()),
      ],
    );
  }
}
