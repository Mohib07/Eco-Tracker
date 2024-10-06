import 'package:flutter/material.dart';
import 'package:nasa_space_app/natural_causes/co2.dart';

class SF6Page extends StatefulWidget {
  const SF6Page({super.key});

  @override
  State<SF6Page> createState() => _SF6PageState();
}

class _SF6PageState extends State<SF6Page> {
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
                const CO2Impact(txt: "SF6"),
                const SizedBox(height: 12),
                Text(
                  "Sulfur Hexafluoride ",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 30),
                const InfoBubble(
                  text:
                      "An extremely potent and long-lived greenhouse gas used in industrial applications.",
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
                          text: "Magnesium and aluminum production",
                          fs: 16,
                          height: 80,
                        ),
                        SizedBox(height: 30),

                        //
                        NeonButton(
                          text:
                              "Electrical insulation in power plants and electrical grids.",
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
                      "•	Contributes to long-term global warming. One of the most potent greenhouse gases with a long atmospheric lifetime.",
                ),
                const SizedBox(height: 30),
                Text(
                  "Solutions",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                const InfoBubble(
                  text:
                      "Substitute with alternative insulating materials. Improve recycling and management of SF₆ in industries. Reduce SF₆ usage and emissions in electrical systems.",
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
