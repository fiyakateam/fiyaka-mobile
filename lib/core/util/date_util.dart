class DateUtil {
  static String dateToHumanString(DateTime date) {
    if (date == null) {
      return '';
    }
    final monthStringList = <String>[
      'Ocak',
      'Şubat',
      'Mart',
      'Nisan',
      'Mayis',
      'Haziran',
      'Temmuz',
      'Agustos',
      'Eylul',
      'Ekim',
      'Kasim',
      'Aralik',
    ];
    final monthString = monthStringList[date.month - 1];

    return '${date.day} $monthString ${date.year}';
  }
}
