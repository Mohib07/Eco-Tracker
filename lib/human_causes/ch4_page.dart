import 'package:flutter/material.dart';
import 'package:nasa_space_app/natural_causes/co2.dart';

class CH4Page2 extends StatefulWidget {
  const CH4Page2({super.key});

  @override
  State<CH4Page2> createState() => _CH4Page2State();
}

class _CH4Page2State extends State<CH4Page2> {
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
                const CO2Impact(txt: "CH4"),
                const SizedBox(height: 12),
                Text(
                  "Methane",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 30),
                const InfoBubble(
                  text:
                      "A potent greenhouse gas with a shorter atmospheric lifetime but stronger heat-trapping capability than CO₂.",
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
                        NeonButton(text: "Livestock farming"),
                        SizedBox(height: 30),
                        NeonButton(text: "Landfills"),
                        SizedBox(height: 30),
                        NeonButton(text: "Natural gas"),
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
                      "Accelerates short-term global warming. Disrupts ecosystems and weather patterns.",
                ),
                const SizedBox(height: 30),
                Text(
                  "Solutions",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                const InfoBubble(
                  text:
                      "Reduce livestock methane emissions with improved farming techniques. Capture methane from landfills for energy use. Prevent methane leaks during natural gas production and distribution. ",
                ),
                const SizedBox(height: 30),
                Text(
                  "Statistics",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                Center(child: Image.asset("images/Picture1.png")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
