extension CompareByDate on DateTime {
  bool compareToByDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
