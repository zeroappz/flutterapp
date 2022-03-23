class WeatherReport {
  late String date; // later the value should be assigned
  late String day;
  late String icon;
  late String description;
  late String status;
  late String degree;
  late String min;
  late String max;
  late String night;
  late String humidity;

  // Constructor
  WeatherReport(Map<String, dynamic> json) {
    date = json['date'] ?? '';
    day = json['day'] ?? '';
    icon = json['icon'] ?? '';
    description = json['description'] ?? '';
    status = json['status'] ?? '';
    degree = json['degree'] ?? '';
    min = json['min'] ?? '';
    max = json['max'] ?? '';
    night = json['night'] ?? '';
    humidity = json['humidity'] ?? '';
  }
}
