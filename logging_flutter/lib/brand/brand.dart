class Brand {
  final String name;

  Brand(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Brand && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
