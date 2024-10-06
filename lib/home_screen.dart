import 'package:flutter/material.dart';
import 'package:nasa_space_app/json_api/iaqi/iaqi_model.dart';
import 'package:nasa_space_app/json_api/iaqi/iaqi_service.dart';
import 'package:nasa_space_app/other/aqi_indicator_widget.dart';

import 'json_api/iaqi/individual_air_quality_widget.dart';

const primaryColor = Color(0xff00093E);
const whiteColor = Colors.white;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Main_Theme.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                _buildHeaderUI(),
                FutureBuilder<IaqiData>(
                    future: IaqiService().fetchIaqiData("beijing"),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else if (snapshot.hasData) {
                        final airQualityData = snapshot.data!;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 0),
                            _buildMainCardWidget(airQualityData),
                            //
                            const SizedBox(height: 10),
                            const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Pollutants",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),

                            SizedBox(
                              height: 480,
                              child: BuildIaqiCards(
                                  airQualityData: airQualityData),
                            ),
                          ],
                        );
                      } else {
                        return const Center(child: Text("No data available"));
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainCardWidget(IaqiData airQualityData) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          width: double.infinity,
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
          child: Column(
            children: [
              const Text(
                "Air Quality Index",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              //
              const SizedBox(height: 10),
              Text(
                airQualityData.aqi.toString(),
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              //
              const SizedBox(height: 10),

              Text(
                airQualityData.location.toString(),
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              //
              const SizedBox(height: 5),

              Text(
                DateTime.parse(airQualityData.time.toString()).toString(),
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //

  Widget _buildHeaderUI() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Air Pollution Index",
            style: TextStyle(
              color: whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          //
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AirQualityWidget(),
                    ));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}

// Helper function to format time manually (without using a package)
String formatTimeManually(DateTime time) {
  String twoDigits(int n) =>
      n.toString().padLeft(2, '0'); // Pads number with zero if needed
  String hours =
      twoDigits(time.hour); // Convert hours to string, pad if necessary
  String minutes =
      twoDigits(time.minute); // Convert minutes to string, pad if necessary
  String seconds =
      twoDigits(time.second); // Convert seconds to string, pad if necessary

  return "$hours:$minutes:$seconds"; // Combine the formatted parts
}
