import 'package:flutter/material.dart';
import 'package:nasa_space_app/natural_causes/co2.dart';

class CH4Page extends StatefulWidget {
  const CH4Page({super.key});

  @override
  State<CH4Page> createState() => _CH4PageState();
}

class _CH4PageState extends State<CH4Page> {
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
                      "A potent greenhouse gas produced naturally and through human activities.",
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
                        NeonButton(text: "Microbes"),
                        SizedBox(height: 30),
                        NeonButton(text: "Termites"),
                        SizedBox(height: 30),
                        NeonButton(text: "Oceans"),
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
                      "Traps more heat than CO₂ but for a shorter time. Contributes to climate change.",
                ),
                const SizedBox(height: 30),
                Text(
                  "Solutions",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                const InfoBubble(
                  text:
                      "Natural methane emissions can be difficult to manage, but controlling human-contributed methane can help reduce the overall impact.",
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
