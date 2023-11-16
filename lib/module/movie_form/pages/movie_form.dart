import 'package:auto_route/auto_route.dart';
import 'package:briix_test/core/style/app_colors.dart';
import 'package:briix_test/main.dart';
import 'package:briix_test/module/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../widgets/custom_text_form_field.dart';

@RoutePage()
class MovieFormScreen extends StatefulWidget {
  const MovieFormScreen({super.key, @PathParam('movieId') this.movieId});
  final String? movieId;

  @override
  State<MovieFormScreen> createState() => _MovieFormScreenState();
}

class _MovieFormScreenState extends State<MovieFormScreen> {
  var controller = getIt.get<HomeController>();

  @override
  void initState() {
    if (widget.movieId != "new") {
      controller.getData(widget.movieId);
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.clearForm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        actions: [
          widget.movieId != "new"
              ? TextButton(
                  onPressed: () {
                    controller.deleteMovie(context, widget.movieId ?? "");
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ))
              : const SizedBox(),
          TextButton(
              onPressed: () {
                if (widget.movieId == "new") {
                  controller.addMovie(context);
                } else {
                  controller.editMovie(context, widget.movieId ?? "");
                }
              },
              child: const Text(
                "Save",
                style: TextStyle(color: AppColors.secondaryColor),
              ))
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Observer(builder: (context) {
            return Column(
              children: [
                CustomTextFormField(
                  controller: controller.titleTxt,
                  label: "Title",
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  controller: controller.directorTxt,
                  label: "Director",
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextFormField(
                  controller: controller.summaryTxt,
                  label: "Summary",
                  maxLine: 3,
                ),
                const SizedBox(
                  height: 16,
                ),
                Wrap(
                  children: List.generate(
                      controller.allGenres.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: InputChip(
                                selectedColor: AppColors.secondaryColor,
                                disabledColor: Colors.grey[700],
                                selected: controller.allGenres[index]
                                    ["selected"],
                                onPressed: () {
                                  controller.selectGenre(index);
                                },
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                label:
                                    Text(controller.allGenres[index]["name"])),
                          )),
                )
              ],
            );
          })),
    );
  }
}
