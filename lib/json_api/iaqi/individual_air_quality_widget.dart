import 'package:flutter/material.dart';
import 'package:nasa_space_app/json_api/iaqi/iaqi_model.dart';
import 'package:nasa_space_app/json_api/iaqi/iaqi_service.dart';

class IndividualAirQualityWidget extends StatefulWidget {
  const IndividualAirQualityWidget({super.key});

  @override
  State<IndividualAirQualityWidget> createState() =>
      _IndividualAirQualityWidgetState();
}

class _IndividualAirQualityWidgetState
    extends State<IndividualAirQualityWidget> {
  late Future<IaqiData> futureIaqiData;

  @override
  void initState() {
    super.initState();
    futureIaqiData = IaqiService().fetchIaqiData("Beijing");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("Air Quality Levels"),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<IaqiData>(
        future: IaqiService().fetchIaqiData("shanghai"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final airQualityData = snapshot.data!;

            return BuildIaqiCards(airQualityData: airQualityData);
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}

class BuildIaqiCards extends StatelessWidget {
  const BuildIaqiCards({
    super.key,
    required this.airQualityData,
  });

  final IaqiData airQualityData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        width: double.infinity,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('images/Main_Theme.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 8,
          children: [
            AirQualityCard(
              pollutant: "CO2",
              level: airQualityData.co,
              maxLevel: 200, // Assuming max level
            ),
            AirQualityCard(
              pollutant: "NO2",
              level: airQualityData.no2,
              maxLevel: 200,
            ),
            AirQualityCard(
              pollutant: "NH3",
              level: airQualityData.nh3,
              maxLevel: 100,
            ),
            AirQualityCard(
              pollutant: "SO2",
              level: airQualityData.so2,
              maxLevel: 100,
            ),
            // AirQualityCard(
            //   pollutant: "Temperature",
            //   level: airQualityData.temperature,
            //   maxLevel: 100,
            //   unit: "C",
            // ),
            // AirQualityCard(
            //   pollutant: "Wind Speed",
            //   level: airQualityData.windSpeed,
            //   maxLevel: 100,
            //   unit: "m/s",
            // ),
          ],
        ),
      ),
    );
  }
}

class AirQualityCard extends StatelessWidget {
  final String pollutant;
  final double level;
  final double maxLevel;
  final String unit;

  const AirQualityCard({
    Key? key,
    required this.pollutant,
    required this.level,
    required this.maxLevel,
    this.unit = "PPM",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff0A072E),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Level of $pollutant",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          ProgressBar(
            value: level,
            maxValue: maxLevel,
          ),
          const SizedBox(height: 16),
          Text(
            "$level",
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            unit,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double value;
  final double maxValue;

  const ProgressBar({
    Key? key,
    required this.value,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = (value / maxValue).clamp(0, 1);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: Colors.blue[50],
        valueColor: AlwaysStoppedAnimation<Color>(
          progress > 0.5 ? Colors.purple : Colors.blue,
        ),
        minHeight: 8,
      ),
    );
  }
}
