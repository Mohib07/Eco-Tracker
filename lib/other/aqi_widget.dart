import 'package:flutter/material.dart';
import 'package:nasa_space_app/other/aqi_indicator_widget.dart';
import 'package:nasa_space_app/model.dart';

class MultipleCityAQI extends StatefulWidget {
  const MultipleCityAQI({super.key});

  @override
  _MultipleCityAQIState createState() => _MultipleCityAQIState();
}

class _MultipleCityAQIState extends State<MultipleCityAQI> {
  final AirQualityService airQualityService = AirQualityService();
  final List<String> cities = [
    "london",
    "newyork",
    "seoul",
    "guangzhou",
    "tokyo",
    "shanghai",
    "paris",
    "hongkong",
    "Beijing"
  ];

  List<CityAQI> cityAQIData = [];

  @override
  void initState() {
    super.initState();
    _fetchMultipleCityAQI();
  }

  // Fetch AQI data for multiple cities
  Future<void> _fetchMultipleCityAQI() async {
    List<CityAQI> fetchedData = [];
    for (String city in cities) {
      int aqiValue = await airQualityService.fetchAQIFromCityName(city);
      fetchedData.add(CityAQI(city: city, aqi: aqiValue));
    }

    setState(() {
      cityAQIData = fetchedData; // Update the list of city AQI data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiple City AQI'), actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AirQualityWidget(),
                  ));
            },
            icon: const Icon(Icons.search))
      ]),
      body: cityAQIData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: cityAQIData.length,
              itemBuilder: (context, index) {
                CityAQI cityAQI = cityAQIData[index];
                return CityAQICard(cityAQI: cityAQI);
              },
            ),
    );
  }
}

// Widget to display each city's AQI in a card
class CityAQICard extends StatelessWidget {
  final CityAQI cityAQI;

  const CityAQICard({super.key, required this.cityAQI});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 6,
      color: _getAQIColor(cityAQI.aqi),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${cityAQI.city.toUpperCase()} AQI:',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              '${cityAQI.aqi}',
              style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              _getAQIDescription(cityAQI.aqi),
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            //
          ],
        ),
      ),
    );
  }

  // Helper function to get AQI color
  Color _getAQIColor(int aqi) {
    if (aqi <= 50) return Colors.greenAccent;
    if (aqi <= 100) return Colors.yellowAccent;
    if (aqi <= 150) return Colors.orangeAccent;
    if (aqi <= 200) return Colors.redAccent;
    return Colors.purpleAccent;
  }

  // Helper function to get AQI description
  String _getAQIDescription(int aqi) {
    if (aqi <= 50) return 'Good';
    if (aqi <= 100) return 'Moderate';
    if (aqi <= 150) return 'Unhealthy for Sensitive Groups';
    if (aqi <= 200) return 'Unhealthy';
    return 'Very Unhealthy';
  }
}
