import 'package:flutter_test/flutter_test.dart';
import 'package:logging_flutter/product/product.dart';
import 'package:logging_flutter/product/product_view_model.dart';

void main() {
  test('Add and Remove Product', () {
    final productViewModel = ProductViewModel();

    final product1 = Product('Product 1');
    final product2 = Product('Product 2');

    productViewModel.addProduct(product1);
    productViewModel.addProduct(product2);

    expect(productViewModel.products.length, 2);
    expect(productViewModel.products.contains(product1), true);
    expect(productViewModel.products.contains(product2), true);

    productViewModel.removeProduct(product1);
    expect(productViewModel.products.length, 1);
    expect(productViewModel.products.contains(product1), false);
  });
}
