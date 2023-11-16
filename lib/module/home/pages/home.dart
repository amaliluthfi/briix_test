import 'package:auto_route/auto_route.dart';
import 'package:briix_test/core/routes/route_constant.dart';
import 'package:briix_test/core/style/app_colors.dart';
import 'package:briix_test/main.dart';
import 'package:briix_test/module/home/controllers/home_controller.dart';
import 'package:briix_test/module/home/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../widgets/movie_card.dart';

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = getIt.get<HomeController>();

  @override
  void initState() {
    controller.getMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text("Briix Movie"),
      ),
      body: Observer(builder: (context) {
        return ListView.builder(
            itemCount: controller.movie.length,
            itemBuilder: (context, index) {
              MovieModel item = controller.movie[index];
              return GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).pushNamed(
                        "${RouteConstant.movieFormRoute}/${item.id}");
                  },
                  child: MovieCard(item: item));
            });
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        onPressed: () => AutoRouter.of(context)
            .pushNamed("${RouteConstant.movieFormRoute}/new"),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
