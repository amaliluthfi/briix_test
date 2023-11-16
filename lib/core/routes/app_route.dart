import 'package:auto_route/auto_route.dart';
import 'package:briix_test/core/routes/route_constant.dart';
import 'package:briix_test/module/home/pages/home.dart';
import 'package:briix_test/module/movie_form/pages/movie_form.dart';
import 'package:flutter/material.dart';
part 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: MyHomeRoute.page,
            path: RouteConstant.homeRoute,
            initial: true),
        AutoRoute(
            page: MovieFormRoute.page,
            path: "${RouteConstant.movieFormRoute}/:movieId")
      ];
}
