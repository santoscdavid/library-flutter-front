class Compare {
  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  int compareInt(bool ascending, int value1, int value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  int compareStringWithNull(bool ascending, dynamic value1, dynamic value2) =>
      ascending
          ? value1 == null
              ? 1
              : value2 == null
                  ? -1
                  : value1.compareTo(value2)
          : value1 == null
              ? -11
              : value2 == null
                  ? 1
                  : value2.compareTo(value1);

  String compareDates(DateTime date1, DateTime date2) {
    if (date1.compareTo(date2) < 0) {
      return "Sem atraso";
    }
    if (date1.compareTo(date2) > 0) {
      return "Com atraso";
    } else {
      return "";
    }
  }
}
