class DropdownItem {
  final String text;

  DropdownItem(this.text);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DropdownItem && other.text == text;
  }

  @override
  int get hashCode => text.hashCode;
}
