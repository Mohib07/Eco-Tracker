import 'package:air_quality/air_quality.dart';
import 'package:flutter/material.dart';
import 'package:nasa_space_app/home_screen.dart';
import 'package:nasa_space_app/main.dart';

class AirQualityService {
  final AirQuality airQuality = AirQuality(key);

  Future<int> fetchAQIFromCityName(String cityName) async {
    try {
      // Fetch air quality data for a specific city
      var feedFromCity = await airQuality.feedFromCity(cityName);
      // Extract AQI as an int
      final int aqiValue = feedFromCity.airQualityIndex;

      return aqiValue; // Return AQI value
    } catch (e) {
      print('Error fetching AQI: $e');
      return -1; // Return -1 in case of error
    }
  }
}

class AirQualityWidget extends StatefulWidget {
  const AirQualityWidget({super.key});

  @override
  _AirQualityWidgetState createState() => _AirQualityWidgetState();
}

class _AirQualityWidgetState extends State<AirQualityWidget> {
  int aqiValue = 0;
  AirQualityService airQualityService = AirQualityService();

  final cityNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchAirQuality(cityNameController.text);
  }

  Future<void> _fetchAirQuality(String controller) async {
    // Fetch AQI for Munich (You can modify this to any city)
    final fetchedAQI = await airQualityService.fetchAQIFromCityName(controller);

    setState(() {
      aqiValue = fetchedAQI; // Update AQI value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: whiteColor,
          title: const Text('Air Quality'),
          backgroundColor: Colors.black),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: cityNameController,
                  onChanged: (value) {
                    setState(() {
                      _fetchAirQuality(value);
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter city name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              //
              const SizedBox(height: 30),
              Text(
                'Air Quality Index (AQI): $aqiValue',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: whiteColor),
              ),
              const SizedBox(height: 20),
              CircularProgressIndicator(
                value: aqiValue > 0
                    ? aqiValue / 500
                    : 0, // 500 as max AQI threshold
                backgroundColor: Colors.greenAccent,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                strokeWidth: 10,
              ),
              const SizedBox(height: 20),
              Text(
                aqiValue <= 50
                    ? 'Good'
                    : aqiValue <= 100
                        ? 'Moderate'
                        : 'Unhealthy',
                style: TextStyle(fontSize: 18, color: _getAQIColor(aqiValue)),
              ),
              //
              const SizedBox(height: 40),
              // TextFormField(
              //   controller: cityNameController,
              //   onChanged: (value) {
              //     setState(() {
              //       _fetchAirQuality(value);
              //     });
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to get AQI color
  Color _getAQIColor(int aqi) {
    if (aqi <= 50) return Colors.green;
    if (aqi <= 100) return Colors.yellow;
    if (aqi <= 150) return Colors.orange;
    if (aqi <= 200) return Colors.red;
    return Colors.purple;
  }
}
