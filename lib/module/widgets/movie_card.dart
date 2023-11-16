import 'package:briix_test/core/style/app_colors.dart';
import 'package:briix_test/module/home/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.item,
  });

  final MovieModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              style: BorderStyle.solid, color: AppColors.secondaryColor)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title ?? "",
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              item.director ?? "",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
            const Divider(
              color: AppColors.secondaryColor,
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.end,
                children: List.generate(
                    item.genres?.length ?? 0,
                    (i) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Chip(
                              backgroundColor: AppColors.secondaryColor,
                              labelStyle: const TextStyle(color: Colors.white),
                              label: Text(
                                item.genres?[i] ?? "",
                              )),
                        )),
              ),
            )
          ]),
    );
  }
}
