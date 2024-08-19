class Product {
  final String name;

  Product(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Product && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
