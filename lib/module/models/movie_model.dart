// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'movie_model.g.dart';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class MovieModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? director;
  @HiveField(3)
  String? summary;
  @HiveField(4)
  List<String>? genres;

  MovieModel({
    this.id,
    this.title,
    this.director,
    this.summary,
    this.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        director: json["director"],
        summary: json["summary"],
        genres: json["genres"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "director": director,
        "summary": summary,
        "genres": genres,
      };
}
