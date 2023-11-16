// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$titleTxtAtom =
      Atom(name: 'HomeControllerBase.titleTxt', context: context);

  @override
  TextEditingController get titleTxt {
    _$titleTxtAtom.reportRead();
    return super.titleTxt;
  }

  @override
  set titleTxt(TextEditingController value) {
    _$titleTxtAtom.reportWrite(value, super.titleTxt, () {
      super.titleTxt = value;
    });
  }

  late final _$directorTxtAtom =
      Atom(name: 'HomeControllerBase.directorTxt', context: context);

  @override
  TextEditingController get directorTxt {
    _$directorTxtAtom.reportRead();
    return super.directorTxt;
  }

  @override
  set directorTxt(TextEditingController value) {
    _$directorTxtAtom.reportWrite(value, super.directorTxt, () {
      super.directorTxt = value;
    });
  }

  late final _$summaryTxtAtom =
      Atom(name: 'HomeControllerBase.summaryTxt', context: context);

  @override
  TextEditingController get summaryTxt {
    _$summaryTxtAtom.reportRead();
    return super.summaryTxt;
  }

  @override
  set summaryTxt(TextEditingController value) {
    _$summaryTxtAtom.reportWrite(value, super.summaryTxt, () {
      super.summaryTxt = value;
    });
  }

  late final _$selectedGenresAtom =
      Atom(name: 'HomeControllerBase.selectedGenres', context: context);

  @override
  ObservableList<String> get selectedGenres {
    _$selectedGenresAtom.reportRead();
    return super.selectedGenres;
  }

  @override
  set selectedGenres(ObservableList<String> value) {
    _$selectedGenresAtom.reportWrite(value, super.selectedGenres, () {
      super.selectedGenres = value;
    });
  }

  late final _$allGenresAtom =
      Atom(name: 'HomeControllerBase.allGenres', context: context);

  @override
  ObservableList<ObservableMap<dynamic, dynamic>> get allGenres {
    _$allGenresAtom.reportRead();
    return super.allGenres;
  }

  @override
  set allGenres(ObservableList<ObservableMap<dynamic, dynamic>> value) {
    _$allGenresAtom.reportWrite(value, super.allGenres, () {
      super.allGenres = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$movieAtom =
      Atom(name: 'HomeControllerBase.movie', context: context);

  @override
  ObservableList<MovieModel> get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(ObservableList<MovieModel> value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  late final _$addMovieAsyncAction =
      AsyncAction('HomeControllerBase.addMovie', context: context);

  @override
  Future<void> addMovie(BuildContext context) {
    return _$addMovieAsyncAction.run(() => super.addMovie(context));
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void getMovie() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.getMovie');
    try {
      return super.getMovie();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic editMovie(BuildContext context, String id) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.editMovie');
    try {
      return super.editMovie(context, id);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteMovie(BuildContext context, String id) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.deleteMovie');
    try {
      return super.deleteMovie(context, id);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectGenre(dynamic index) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.selectGenre');
    try {
      return super.selectGenre(index);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getData(dynamic id) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.getData');
    try {
      return super.getData(id);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearForm() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.clearForm');
    try {
      return super.clearForm();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleTxt: ${titleTxt},
directorTxt: ${directorTxt},
summaryTxt: ${summaryTxt},
selectedGenres: ${selectedGenres},
allGenres: ${allGenres},
isLoading: ${isLoading},
movie: ${movie}
    ''';
  }
}
