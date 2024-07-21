class Category {
  final String name;

  Category(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Category && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
