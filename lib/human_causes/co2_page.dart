import 'package:flutter/material.dart';
import 'package:nasa_space_app/natural_causes/co2.dart';

class CO2Page2 extends StatefulWidget {
  const CO2Page2({super.key});

  @override
  State<CO2Page2> createState() => _CO2Page2State();
}

class _CO2Page2State extends State<CO2Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/Untitled design.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            // Added SingleChildScrollView
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CO2Impact(txt: "CO2"),
                const SizedBox(height: 12),
                Text(
                  "Carbon di Oxide",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 30),
                const InfoBubble(
                  text:
                      "A major greenhouse gas emitted from human activities, especially through the burning of fossil fuels.",
                ),
                const SizedBox(height: 30),
                Text(
                  "Causes",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NeonButton(
                          text: "Burning of fossil fuels",
                        ),
                        SizedBox(height: 30),
                        NeonButton(text: "Deforestation"),
                        SizedBox(height: 30),
                        NeonButton(text: "Industrial processes "),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Effects",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                const InfoBubble(
                  text:
                      "Global warming and climate change. Ocean acidification. Sea level rise.",
                ),
                const SizedBox(height: 30),
                Text(
                  "Solutions",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                const InfoBubble(
                  text:
                      "Shift to renewable energy sources. Reforestation and afforestation. Carbon capture and storage (CCS).",
                ),
                const SizedBox(height: 30),
                Text(
                  "Statistics",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                Center(child: Image.asset("images/Rectangle 4245.png")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
