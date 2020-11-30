import 'package:flutter/cupertino.dart';

import 'cat.dart';

class AppStateModel extends ChangeNotifier {
  final List<Cat> cats = List.generate(100, (index) => Cat.random());
  Set<String> favedIds = Set();

  List<Cat> get favedCats {
    return cats.where((cat) => favedIds.contains(cat.id)).toList();
  }

  void addFavorite(Cat cat) {
    favedIds.add(cat.id);
    notifyListeners();
  }

  void removeFavorite(Cat cat) {
    favedIds.remove(cat.id);
    notifyListeners();
  }
}
