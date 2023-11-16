import 'package:briix_test/core/hive/hive_adapter.dart';
import 'package:briix_test/core/routes/app_route.dart';
import 'package:briix_test/module/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveAdapters.init();
  getIt.registerSingleton<HomeController>(HomeController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Briix Movie',
      routerConfig: _appRouter.config(),
    );
  }
}
