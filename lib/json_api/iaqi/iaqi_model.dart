class IaqiData {
  final double co;
  final double no2;
  final double nh3;
  final double so2;
  final int aqi; // AQI value
  final String location; // Location name
  final DateTime time; // Time field (ISO 8601)

  IaqiData({
    required this.co,
    required this.no2,
    required this.nh3,
    required this.so2,
    required this.aqi, // Initialize AQI
    required this.location, // Initialize Location
    required this.time, // Initialize Time
  });

  // Factory constructor to create an IaqiData instance from JSON data
  factory IaqiData.fromJson(Map<String, dynamic> json) {
    return IaqiData(
      co: json['iaqi']['co']?['v']?.toDouble() ?? 0.0,
      no2: json['iaqi']['no2']?['v']?.toDouble() ?? 0.0,
      nh3: json['iaqi']['nh3']?['v']?.toDouble() ?? 0.0,
      so2: json['iaqi']['so2']?['v']?.toDouble() ?? 0.0,
      aqi: json['aqi'] ?? 0, // Access AQI from the root level of the JSON
      location: json['city']['name'] ?? "Unknown Location",
      time: DateTime.parse(json['time']['s']),
    );
  }
}
