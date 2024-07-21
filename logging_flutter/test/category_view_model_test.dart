import 'package:flutter_test/flutter_test.dart';
import 'package:logging_flutter/category/category.dart';
import 'package:logging_flutter/category/category_view_model.dart';

void main() {
  test('Add and Remove Category', () {
    final categoryViewModel = CategoryViewModel();

    final category1 = Category('Work');
    final category2 = Category('Personal');

    categoryViewModel.addCategory(category1);
    categoryViewModel.addCategory(category2);

    expect(categoryViewModel.categories.length, 2);
    expect(categoryViewModel.categories.contains(category1), true);
    expect(categoryViewModel.categories.contains(category2), true);

    categoryViewModel.removeCategory(category1);
    expect(categoryViewModel.categories.length, 1);
    expect(categoryViewModel.categories.contains(category1), false);
  });
}
