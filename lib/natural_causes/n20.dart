import 'package:flutter/material.dart';
import 'package:nasa_space_app/natural_causes/co2.dart';

class N2OPage extends StatefulWidget {
  const N2OPage({super.key});

  @override
  State<N2OPage> createState() => _N2OPageState();
}

class _N2OPageState extends State<N2OPage> {
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
                const CO2Impact(txt: "N2O"),
                const SizedBox(height: 12),
                Text(
                  "Nitrous Oxide",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 30),
                const InfoBubble(
                  text:
                      "A naturally occurring gas produced by soil and ocean bacteria.",
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
                        NeonButton(text: "Soil processes "),
                        SizedBox(height: 30),
                        NeonButton(text: "biological activity."),
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
                      "Contributes to the natural greenhouse effect.	Plays a role in the depletion of the ozone layer.",
                ),
                const SizedBox(height: 30),
                Text(
                  "Solutions",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                const InfoBubble(
                  text:
                      "The focus is primarily on managing human-caused emissions to minimize overall levels of N₂O in the atmosphere",
                ),
                const SizedBox(height: 30),
                Text(
                  "Statistics",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                Center(child: Image.asset("images/Picture2.png")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
