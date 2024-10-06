import 'package:flutter/material.dart';
import 'package:nasa_space_app/natural_causes/co2.dart';

class H2OPage extends StatefulWidget {
  const H2OPage({super.key});

  @override
  State<H2OPage> createState() => _H2OPageState();
}

class _H2OPageState extends State<H2OPage> {
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
                const CO2Impact(txt: "H2O"),
                const SizedBox(height: 12),
                Text(
                  "Water Vapour",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 30),
                const InfoBubble(
                  text:
                      "The most abundant natural greenhouse gas, amplifying the warming effects of other greenhouse gases.",
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
                          text: "Evaporation from oceans, lakes, rivers.",
                          fs: 18,
                          height: 80,
                        ),
                        SizedBox(height: 30),
                        NeonButton(
                          text: "Transpiration from plants.",
                          fs: 18,
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
                      "Enhances the natural greenhouse effect, leading to additional warming.	Water vapor increases in response to higher global temperatures, creating a feedback loop.",
                ),
                const SizedBox(height: 30),
                Text(
                  "Solutions",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                const InfoBubble(
                  text:
                      "Reducing overall global warming can limit the water vapor feedback effect.",
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
