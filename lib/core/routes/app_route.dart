import 'package:auto_route/auto_route.dart';
import 'package:briix_test/module/pages/home.dart';
import 'package:briix_test/module/pages/movie_form.dart';
import 'package:flutter/material.dart';
part 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MyHomeRoute.page, path: "/", initial: true),
        AutoRoute(page: MovieFormRoute.page, path: "/movie_form/:movieId")
      ];
}
