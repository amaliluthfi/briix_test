import 'package:briix_test/core/style/app_colors.dart';
import 'package:briix_test/module/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final Box<MovieModel> movieBox = Hive.box<MovieModel>("movieBox");

  @observable
  TextEditingController titleTxt = TextEditingController();

  @observable
  TextEditingController directorTxt = TextEditingController();

  @observable
  TextEditingController summaryTxt = TextEditingController();

  @observable
  ObservableList<String> selectedGenres = ObservableList.of([]);

  @observable
  ObservableList<ObservableMap> allGenres = ObservableList.of([
    ObservableMap.of({"name": "Drama", "selected": false}),
    ObservableMap.of({"name": "Action", "selected": false}),
    ObservableMap.of({"name": "Animation", "selected": false}),
    ObservableMap.of({"name": "Sci-Fi", "selected": false}),
    ObservableMap.of({"name": "Horror", "selected": false})
  ]);

  @observable
  bool isLoading = false;

  @observable
  ObservableList<MovieModel> movie = ObservableList.of([]);

  @action
  void getMovie() {
    movie = ObservableList.of(movieBox.values);
  }

  @action
  Future<void> addMovie(BuildContext context) async {
    if (directorTxt.text == "" ||
        titleTxt.text == "" ||
        summaryTxt.text == "" ||
        selectedGenres.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              icon: Icon(
                Icons.warning_rounded,
                color: Colors.red,
                size: 50,
              ),
              title: Text("Warning"),
              content: Text(
                "All field are required!",
                textAlign: TextAlign.center,
              ),
            );
          });
    } else {
      MovieModel item = MovieModel(
          title: titleTxt.text,
          director: directorTxt.text,
          summary: summaryTxt.text,
          genres: selectedGenres.toList(),
          id: const Uuid().v1());
      movie.add(item);
      await movieBox.add(item);

      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              icon: Icon(
                Icons.check_circle_rounded,
                color: AppColors.secondaryColor,
                size: 50,
              ),
              title: Text("Success!"),
              content: Text(
                "Add movie success!",
                textAlign: TextAlign.center,
              ),
            );
          });

      titleTxt.clear();
      summaryTxt.clear();
      directorTxt.clear();
      selectedGenres.clear();
      allGenres.forEach((element) {
        element["selected"] = false;
      });
    }
  }

  @action
  editMovie(BuildContext context, String id) {
    if (directorTxt.text == "" ||
        titleTxt.text == "" ||
        summaryTxt.text == "" ||
        selectedGenres.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              icon: Icon(
                Icons.warning_rounded,
                color: Colors.red,
                size: 50,
              ),
              title: Text("Warning"),
              content: Text(
                "All field are required!",
                textAlign: TextAlign.center,
              ),
            );
          });
    } else {
      var indBox =
          movieBox.values.toList().indexWhere((element) => element.id == id);
      var indMovie = movie.indexWhere((element) => element.id == id);
      if (indMovie > 0) {
        movie[indMovie] = MovieModel(
            title: titleTxt.text,
            director: directorTxt.text,
            summary: summaryTxt.text,
            genres: selectedGenres.toList(),
            id: id);
      }

      if (indBox > 0) {
        movieBox.putAt(
            indBox,
            MovieModel(
                title: titleTxt.text,
                director: directorTxt.text,
                summary: summaryTxt.text,
                genres: selectedGenres.toList(),
                id: id));
      }

      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              icon: Icon(
                Icons.check_circle_rounded,
                color: AppColors.secondaryColor,
                size: 50,
              ),
              title: Text("Success!"),
              content: Text(
                "Update movie success!",
                textAlign: TextAlign.center,
              ),
            );
          });

      titleTxt.clear();
      summaryTxt.clear();
      directorTxt.clear();
      selectedGenres.clear();
      allGenres.forEach((element) {
        element["selected"] = false;
      });
    }
  }

  @action
  deleteMovie(BuildContext context, String id) {
    int indMovie = movie.indexWhere((element) => element.id == id);
    int indBox =
        movieBox.values.toList().indexWhere((element) => element.id == id);

    print("in index $indMovie");
    if (indMovie > 0) {
      movie.removeAt(indMovie);
    }
    if (indBox > 0) {
      movieBox.deleteAt(indBox);
    }

    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            icon: Icon(
              Icons.check_circle_rounded,
              color: AppColors.secondaryColor,
              size: 50,
            ),
            title: Text("Success!"),
            content: Text(
              "Delete movie success!",
              textAlign: TextAlign.center,
            ),
          );
        });

    titleTxt.clear();
    summaryTxt.clear();
    directorTxt.clear();
    selectedGenres.clear();
    allGenres.forEach((element) {
      element["selected"] = false;
    });
  }

  @action
  void selectGenre(index) {
    if (selectedGenres.contains(allGenres[index]["name"])) {
      selectedGenres.remove(allGenres[index]["name"]);
      allGenres[index]["selected"] = false;
    } else {
      allGenres[index]["selected"] = true;
      selectedGenres.add(allGenres[index]["name"]);
    }
  }

  @action
  void getData(id) {
    var item = movieBox.values.where((element) => element.id == id);
    if (item.isNotEmpty) {
      titleTxt.text = item.first.title ?? "";
      directorTxt.text = item.first.director ?? "";
      summaryTxt.text = item.first.summary ?? "";
      selectedGenres = ObservableList.of(item.first.genres ?? []);
      allGenres.forEach((element) {
        selectedGenres.forEach((el) {
          if (element["name"] == el) {
            element["selected"] = true;
          }
        });
      });
    }
  }
}
