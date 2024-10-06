import 'package:flutter/material.dart';
import 'package:nasa_space_app/natural_causes/co2.dart';

class HFCPage extends StatefulWidget {
  const HFCPage({super.key});

  @override
  State<HFCPage> createState() => _HFCPageState();
}

class _HFCPageState extends State<HFCPage> {
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
                const CO2Impact(txt: "CFC's"),
                const SizedBox(height: 12),
                Text(
                  "CFC's and HFC's",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 30),
                const InfoBubble(
                  text:
                      "Synthetic gases used in refrigeration, aerosols, and other industrial applications, responsible for ozone depletion.",
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
                          text: "Industrial production processes",
                          fs: 16,
                          height: 80,
                        ),
                        SizedBox(height: 30),

                        //
                        NeonButton(
                          text:
                              "Use in refrigerators, air conditioners, and aerosols.",
                          fs: 16,
                          height: 80,
                        ),
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
                      "Ozone layer depletion, leading to increased UV radiation. Significant greenhouse gas effect, especially HFCs.",
                ),
                const SizedBox(height: 30),
                Text(
                  "Solutions",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                const InfoBubble(
                  text:
                      "Phase-out CFCs and HFCs under international agreements like the Montreal Protocol. Switch to ozone-friendly refrigerants and technologies. Regulate and reduce HFC emissions.",
                ),
                const SizedBox(height: 30),
                // Text(
                //   "Statistics",
                //   style: getTextStyle(),
                // ),
                // const SizedBox(height: 10),
                // Center(child: Image.asset("images/no2.png")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
