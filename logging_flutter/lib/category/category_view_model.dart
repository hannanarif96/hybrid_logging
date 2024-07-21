import 'package:flutter/material.dart';
import 'category.dart';

class CategoryViewModel extends ChangeNotifier {
  final List<Category> _categories = [];

  List<Category> get categories => _categories;

  void addCategory(Category category) {
    _categories.add(category);
    notifyListeners();
  }

  void removeCategory(Category category) {
    _categories.remove(category);
    notifyListeners();
  }
}
