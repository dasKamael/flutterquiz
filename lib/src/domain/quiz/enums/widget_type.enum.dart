enum WidgetType {
  text,
  code;

  const WidgetType();

  factory WidgetType.fromString(String value) {
    switch (value) {
      case 'text':
        return WidgetType.text;
      case 'code':
        return WidgetType.code;
      default:
        return WidgetType.text;
    }
  }
}
