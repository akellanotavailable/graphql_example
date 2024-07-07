extension DateTimeFormats on DateTime {
  String toFormattedString() {
    return '$day.${month < 10 ? '0$month' : month}.$year ${hour < 10 ? '0$hour' : hour}:${minute < 10 ? '0$minute' : minute}';
  }
}
