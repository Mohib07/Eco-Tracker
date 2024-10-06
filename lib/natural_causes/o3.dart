import 'package:flutter/material.dart';
import 'package:nasa_space_app/natural_causes/co2.dart';

class O3Page extends StatefulWidget {
  const O3Page({super.key});

  @override
  State<O3Page> createState() => _O3PageState();
}

class _O3PageState extends State<O3Page> {
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
                const CO2Impact(txt: "O3"),
                const SizedBox(height: 12),
                Text(
                  "Ozone",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 30),
                const InfoBubble(
                  text:
                      "Naturally occurring in the stratosphere, where it protects the Earth from harmful UV radiation.",
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
                          text:
                              "production from Interaction sunlight with oxygen",
                          fs: 16,
                          height: 100,
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
                      "Ozone in the stratosphere protects life by filtering UV rays. Ground-level (tropospheric) ozone, often human-caused, can contribute to warming and health problems.",
                ),
                const SizedBox(height: 30),
                Text(
                  "Solutions",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                const InfoBubble(
                  text:
                      "Protect the ozone layer by reducing emissions of ozone-depleting substances.",
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
