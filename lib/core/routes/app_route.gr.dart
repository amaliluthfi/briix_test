// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MovieFormRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MovieFormRouteArgs>(
          orElse: () =>
              MovieFormRouteArgs(movieId: pathParams.optString('movieId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MovieFormScreen(
          key: args.key,
          movieId: args.movieId,
        ),
      );
    },
    MyHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyHomePage(),
      );
    },
  };
}

/// generated route for
/// [MovieFormScreen]
class MovieFormRoute extends PageRouteInfo<MovieFormRouteArgs> {
  MovieFormRoute({
    Key? key,
    String? movieId,
    List<PageRouteInfo>? children,
  }) : super(
          MovieFormRoute.name,
          args: MovieFormRouteArgs(
            key: key,
            movieId: movieId,
          ),
          rawPathParams: {'movieId': movieId},
          initialChildren: children,
        );

  static const String name = 'MovieFormRoute';

  static const PageInfo<MovieFormRouteArgs> page =
      PageInfo<MovieFormRouteArgs>(name);
}

class MovieFormRouteArgs {
  const MovieFormRouteArgs({
    this.key,
    this.movieId,
  });

  final Key? key;

  final String? movieId;

  @override
  String toString() {
    return 'MovieFormRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [MyHomePage]
class MyHomeRoute extends PageRouteInfo<void> {
  const MyHomeRoute({List<PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
