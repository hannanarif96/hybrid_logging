import 'package:flutter/material.dart';
import 'brand.dart';

class BrandViewModel extends ChangeNotifier {
  final List<Brand> _brands = [];

  List<Brand> get brands => _brands;

  void addBrand(Brand brand) {
    _brands.add(brand);
    notifyListeners();
  }

  void removeBrand(Brand brand) {
    _brands.remove(brand);
    notifyListeners();
  }
}
