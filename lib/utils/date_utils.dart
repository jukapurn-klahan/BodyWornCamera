

import '../flutter_flow/flutter_flow_util.dart';

class ChangeDateUtils {
  static String formattimemin(Duration? time) {
    if (time == null) {
      return 'N/A';
    }

    String hour = time.inHours.toString().padLeft(2, '0');
    String minute = time.inMinutes.remainder(60).toString().padLeft(2, '0');

    return '$hour:$minute';
  }
  static String formatdayTime(DateTime? date) {
    if (date == null) {
      return '-';
    }
    const List<String> thaiMonths = ['ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.'];

    // ดึงค่า วัน เดือน ปี นาที และวินาที
    int day = date.day;
    int year = date.year + 543;
    String month = thaiMonths[date.month - 1];
    int hour = date.hour;
    int minute = date.minute;

    return '$day $month $year ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} น.';
  }
  int calculateDaysUntil(DateTime targetDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(targetDate.year, targetDate.month, targetDate.day);
    return target.difference(today).inDays;
  }

  String getDueMessage(DateTime targetDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(targetDate.year, targetDate.month, targetDate.day);
    final daysLeft = target.difference(today).inDays;

    if (daysLeft > 0) {
      return 'อีก $daysLeft วัน ถึงวันนัด';
    } else {
      return 'ครบกำหนด';
    }
  }

  static String formatAge(DateTime? birthDate) {
    DateTime currentDate = DateTime.now();
    // คำนวณความแตกต่างระหว่างวันที่ปัจจุบันกับวันเกิด
    int years = currentDate.year - birthDate!.year;
    int months = currentDate.month - birthDate!.month;
    int days = currentDate.day - birthDate.day;

    // ถ้าเดือนติดลบ หรือยังไม่ถึงวันเกิดในปีนี้ ให้ปรับให้ถูกต้อง
    if (months < 0) {
      years--;
      months += 12;
    }

    // ถ้าวันติดลบ ให้ยืมวันจากเดือนที่แล้ว
    if (days < 0) {
      final prevMonth = DateTime(currentDate.year, currentDate.month, 0);
      days += prevMonth.day;
      months--;
      if (months < 0) {
        years--;
        months += 12;
      }
    }

    // คืนค่าอายุในรูปแบบ "29 ปี 2 ด. 15 ว."
    return '$years ปี $months เดือน $days วัน';
  }

  static int getAge(DateTime birthday) {
    final now = DateTime.now();

    int years = now.year - birthday.year;
    int months = now.month - birthday.month;
    int days = now.day - birthday.day;
    if (days < 0) {
      months--;
      final previousMonth = DateTime(now.year, now.month, 0).day;
      days += previousMonth;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    return years;
  }

  static int getAgeM(DateTime birthday) {
    final now = DateTime.now();

    int years = now.year - birthday.year;
    int months = now.month - birthday.month;
    int days = now.day - birthday.day;
    if (days < 0) {
      months--;
      final previousMonth = DateTime(now.year, now.month, 0).day;
      days += previousMonth;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    return months;
  }

  static int getAgeD(DateTime birthday) {
    final now = DateTime.now();

    int years = now.year - birthday.year;
    int months = now.month - birthday.month;
    int days = now.day - birthday.day;
    if (days < 0) {
      months--;
      final previousMonth = DateTime(now.year, now.month, 0).day;
      days += previousMonth;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    return days;
  }

  static String getAgeInYearsAndDays(DateTime birthday) {
    final now = DateTime.now();

    int years = now.year - birthday.year;
    int months = now.month - birthday.month;
    int days = now.day - birthday.day;
    if (days < 0) {
      months--;
      final previousMonth = DateTime(now.year, now.month, 1).subtract(Duration(days: 1)).day;
      days += previousMonth;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    return '$years ปี $months เดือน $days วัน';
  }

  static DateTime getBirthdayFromAge(int age) {
    final now = DateTime.now();

    int birthYear = now.year - age;
    DateTime birthdayThisYear = DateTime(birthYear, now.month, now.day);

    if (birthdayThisYear.isAfter(now)) {
      birthdayThisYear = DateTime(birthYear - 1, now.month, now.day);
    }

    return birthdayThisYear;
  }

  static String formatday(DateTime? date) {
    if (date == null) {
      return 'N/A';
    }
    const List<String> thaiMonths = [
      'มกราคม',
      'กุมภาพันธ์',
      'มีนาคม',
      'เมษายน',
      'พฤษภาคม',
      'มิถุนายน',
      'กรกฎาคม',
      'สิงหาคม',
      'กันยายน',
      'ตุลาคม',
      'พฤศจิกายน',
      'ธันวาคม',
    ];
    int day = date.day;
    int year = date.year + 543;

    String month = thaiMonths[date.month - 1];

    return '$day $month $year';
  }

  static String getThaiMonth(int month) {
    const months = [
      '',
      'มกราคม',
      'กุมภาพันธ์',
      'มีนาคม',
      'เมษายน',
      'พฤษภาคม',
      'มิถุนายน',
      'กรกฎาคม',
      'สิงหาคม',
      'กันยายน',
      'ตุลาคม',
      'พฤศจิกายน',
      'ธันวาคม',
    ];
    return months[month];
  }

  static String getThaiMonthOnly(DateTime? date) {
    if (date == null) {
      return 'N/A';
    }
    const List<String> thaiMonths = [
      'มกราคม',
      'กุมภาพันธ์',
      'มีนาคม',
      'เมษายน',
      'พฤษภาคม',
      'มิถุนายน',
      'กรกฎาคม',
      'สิงหาคม',
      'กันยายน',
      'ตุลาคม',
      'พฤศจิกายน',
      'ธันวาคม',
    ];
    return thaiMonths[date.month - 1];
  }

  static String getBuddhistYearOnly(DateTime? date) {
    if (date == null) {
      return 'N/A';
    }
    return '${date.year + 543}';
  }

  static String formatminiday(DateTime? date) {
    if (date == null) {
      return 'N/A';
    }
    const List<String> thaiMonths = ['ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.'];
    int day = date.day;
    int year = date.year + 543;

    String month = thaiMonths[date.month - 1];

    return '$day $month $year';
  }
 static String formatThaiDate(String inputDate) {
  try {
    // แปลง String เป็น DateTime
    final DateTime date = DateTime.parse(inputDate);

    // รายชื่อเดือนภาษาไทย
    const List<String> thaiMonths = [
      'มกราคม',
      'กุมภาพันธ์',
      'มีนาคม',
      'เมษายน',
      'พฤษภาคม',
      'มิถุนายน',
      'กรกฎาคม',
      'สิงหาคม',
      'กันยายน',
      'ตุลาคม',
      'พฤศจิกายน',
      'ธันวาคม',
    ];

    // ดึงวัน, เดือน, และปีไทย
    final int day = date.day;
    final String month = thaiMonths[date.month - 1]; // แปลงเลขเดือนเป็นชื่อเดือน
    final int thaiYear = date.year + 543; // คำนวณปีพุทธศักราช

    // สร้างรูปแบบวันที่ในภาษาไทย
    return '$day $month $thaiYear';
  } catch (e) {
    return 'รูปแบบวันที่ไม่ถูกต้อง';
  }
}

  // static String formatThaidate(DateTime? date) {
  //   if (date == null) {
  //     return 'N/A';
  //   }
  //   const List<String> thaiMonths = [
  //     'มกราคม',
  //     'กุมภาพันธ์',
  //     'มีนาคม',
  //     'เมษายน',
  //     'พฤษภาคม',
  //     'มิถุนายน',
  //     'กรกฎาคม',
  //     'สิงหาคม',
  //     'กันยายน',
  //     'ตุลาคม',
  //     'พฤศจิกายน',
  //     'ธันวาคม',
  //   ];

  //   const List<String> thaiDays = ['จันทร์', 'อังคาร', 'พุธ', 'พฤหัสบดี', 'ศุกร์', 'เสาร์', 'อาทิตย์'];
  //   int day = date.day;
  //   int year = date.year + 543;
  //   String month = thaiMonths[date.month - 1];
  //   String dayOfWeek = thaiDays[date.weekday - 1];

  //   return '$day $month $year : $dayOfWeek';
  // }

  static String formatThaiDateShort4(DateTime? date) {
    if (date == null) {
      return '';
    }

    return '${DateFormat('dd').format(date ?? DateTime.now())}/${DateFormat('MM').format(date ?? DateTime.now())}/${int.tryParse(DateFormat('yyyy').format(date ?? DateTime.now()))! + 543}';
  }

  static String formattime(Duration? time) {
    if (time == null || time == Duration.zero) {
      return '00:00';
    }

    final hour = time.inHours.toString().padLeft(2, '0');
    final minute = time.inMinutes.remainder(60).toString().padLeft(2, '0');
    final second = time.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$hour:$minute';
  }

  static String formatDateTime(DateTime? dt) {
    if (dt == null) {
      return 'N/A';
    }

    String day = dt.day.toString().padLeft(2, '0');
    int year = dt.year + 543;
    String thaiYear = year.toString().substring(2);
    String month = dt.month.toString().padLeft(2, '0');
    String hour = dt.hour.toString().padLeft(2, '0');
    String minute = dt.minute.toString().padLeft(2, '0');

    return '$day/$month/$thaiYear - $hour:$minute น.';
  }

  static String getCurrentTimeStr() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  static String getThaiCurrentDate(String xToday) {
    // Split the input date string into year, month, and day
    List<String> dateParts = xToday.split("-");
    String year = dateParts[0];
    String month = dateParts[1];
    String day = dateParts[2];

    // Convert the date parts into a DateTime object
    DateTime dateTime = DateTime(int.parse(year), int.parse(month), int.parse(day));

    // Adjust the year to the Thai Buddhist calendar year by adding 543
    int buddhistYear = dateTime.year + 543;

    // Get the last two digits of the Buddhist year
    String thaiYear = buddhistYear.toString().substring(2);

    // Return the formatted string YYMMDD
    return '$thaiYear$month$day';
  }

  static String getCurrentDateStr() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd').format(now);
  }

  // static String formatThaiDate(DateTime? datetime, String format) {
  //   if (datetime == null) return '-';
  //   final formatDate = format.replaceAll('yyyy', '${datetime!.year + 543}');
  //   final date = DateFormat(formatDate, 'th').format(datetime);
  //   return date;
  // }

  /// Returns the current time as a string in the format HH:MM:SS.
}

String getCurrentTimeStr2() {
  DateTime now = DateTime.now();
  return DateFormat('HH:mm:ss').format(now);
}

String getCurrentTimeStrFromNow(DateTime now) {
 return DateFormat('HH:mm:ss').format(now);
}

String getCurrentTimeStrEHP() {
  return DateFormat('HH.mm.ss').format(DateTime.now());
}String getCurrentTimeStr(DateTime now) {
  return DateFormat('HH:mm:ss').format(now);
}

String getENCurrentDate2(String xToday) {
  // Split the input date string into year, month, and day
  List<String> dateParts = xToday.split("-");
  String year = dateParts[0];
  String month = dateParts[1];
  String day = dateParts[2];

  // Extract the last two digits of the year
  String yth = year.substring(2) + month + day;

  return yth;
}

String convertDateString(String date) {
  List<String> parts = date.split("-");
  String year = parts[0];
  String month = parts[1];
  String day = parts[2];
  String yth = year + month + day;

  return yth;
}

String formatDuration(Duration? duration) {
  if (duration == null) return '';
  int hours = duration.inHours % 24; // to handle cases where hours > 24
  int minutes = duration.inMinutes % 60;
  int seconds = duration.inSeconds % 60;
  return '${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(seconds)}';
}

String _twoDigits(int number) {
  return number.toString().padLeft(2, '0');
}

DateTime extractDateOnly(DateTime dateTime) {
  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

convertDate(DateTime date, bool isFullDate) {
  String dateFormat = '';
  if (isFullDate) {
    dateFormat = DateFormat('dd MMMM ${date.year + 543}').format(date);
  } else {
    dateFormat = DateFormat('yyyy-MM-dd').format(date);
  }
  return dateFormat;
}

dynamic convertToBuddhistYear(String date, bool? isConvertDate) {
  // Split the input date into components
  List<String> parts = date.split('-');
  int year = int.parse(parts[0]);
  String month = parts[1];
  String day = parts[2];
  String hour = parts[3];
  String minute = parts[4];
  String second = parts[5];

  // Convert Gregorian year to Buddhist year
  int buddhistYear = year + 543;

  // Format the Buddhist year into the desired format
  if (isConvertDate == null) {
    return '$buddhistYear-$month-$day';
  } else {
    return DateTime(buddhistYear, int.parse(month), int.parse(day), int.parse(hour), int.parse(minute), int.parse(second));
  }
}

DateTime convertToDateTime(String thaiDate) {
  int yearBE = int.parse(thaiDate.substring(0, 4));
  int month = int.parse(thaiDate.substring(4, 6));
  int day = int.parse(thaiDate.substring(6, 8));

  int yearAD = yearBE - 543;

  DateTime gregorianDate = DateTime(yearAD, month, day);
  return gregorianDate;
}

String getThai2DigitYear(String date) {
  List<String> dateParts = date.split("-");
  int year = int.parse(dateParts[0]);
  year += 543; // Convert AD to BE
  return year.toString().substring(2);
}

DateTime concatDateTime(DateTime? dateTime, Duration? time) {
  String timeString = '00:00:00.000';
  if (time != null) {
    final inHours = '${time.inHours}'.padLeft(2, '0');
    final inMinutes = '${(time.inMinutes % 60)}'.padLeft(2, '0');
    final inSeconds = '${(time.inSeconds % 60)}'.padLeft(2, '0');
    final inMilliseconds = '${time.inMilliseconds % 1000}'.padRight(12, '0');
    timeString = '${inHours}:${inMinutes}:${inSeconds}.${inMilliseconds}';
  }
  String dateString = DateFormat('yyyy-MM-dd').format(dateTime ?? DateTime.now());
  DateTime formattedDateTime = DateTime.parse('$dateString $timeString');
  return formattedDateTime;
}
