class Task {
  final String name;

  Task(this.name);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Task && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
