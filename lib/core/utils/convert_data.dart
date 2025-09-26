class ConvertData{

  String convertDateString(String dateStr) {
    // Извлекаем timestamp и смещение из строки с помощью регулярного выражения
    RegExp regExp = RegExp(r'/Date\((\d+)([+-]\d{4})\)/');
    Match? match = regExp.firstMatch(dateStr);

    if (match == null) {
      return '';
    }

    // Получаем timestamp в миллисекундах
    int milliseconds = int.parse(match.group(1)!);

    // Получаем смещение часового пояса
    String offsetStr = match.group(2)!;
    int offsetHours = int.parse(offsetStr.substring(0, 3));
    int offsetMinutes = int.parse(offsetStr.substring(3, 5));

    // Создаем DateTime объект из timestamp (UTC)
    DateTime utcTime = DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: true);

    // Применяем смещение часового пояса
    DateTime localTime = utcTime.add(Duration(hours: offsetHours, minutes: offsetMinutes));

    // Форматируем время в нужный формат
    String hours = localTime.hour.toString().padLeft(2, '0');
    String minutes = localTime.minute.toString().padLeft(2, '0');
    String seconds = localTime.second.toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds';
  }
  DateTime convertDate(String dateStr) {
    // Извлекаем timestamp и смещение из строки с помощью регулярного выражения
    RegExp regExp = RegExp(r'/Date\((\d+)([+-]\d{4})\)/');
    Match? match = regExp.firstMatch(dateStr);

    if (match == null) {
      return DateTime.now();
    }

    // Получаем timestamp в миллисекундах
    int milliseconds = int.parse(match.group(1)!);

    // Получаем смещение часового пояса
    String offsetStr = match.group(2)!;
    int offsetHours = int.parse(offsetStr.substring(0, 3));
    int offsetMinutes = int.parse(offsetStr.substring(3, 5));

    // Создаем DateTime объект из timestamp (UTC)
    DateTime utcTime = DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: true);

    // Применяем смещение часового пояса
    DateTime localTime = utcTime.add(Duration(hours: offsetHours, minutes: offsetMinutes));

    // Форматируем время в нужный формат
    String hours = localTime.hour.toString().padLeft(2, '0');
    String minutes = localTime.minute.toString().padLeft(2, '0');
    String seconds = localTime.second.toString().padLeft(2, '0');

    return localTime;
  }

}