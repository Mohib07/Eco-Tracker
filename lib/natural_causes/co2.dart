// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

TextStyle getTextStyle() {
  return TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: Colors.blue, // Dark blue
    shadows: [
      Shadow(
        blurRadius: 4,
        color: Colors.purple.shade300,
        offset: const Offset(2, 2),
      ),
    ],
  );
}

class CO2Page extends StatefulWidget {
  const CO2Page({super.key});

  @override
  State<CO2Page> createState() => _CO2PageState();
}

class _CO2PageState extends State<CO2Page> {
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
                      "Naturally occurring gas that is a key component of the Earth's carbon cycle.",
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
                        NeonButton(text: "Volcanic Eruptions"),
                        SizedBox(height: 30),
                        NeonButton(text: "Volcanic Eruptions"),
                        SizedBox(height: 30),
                        NeonButton(text: "Volcanic Eruptions"),
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
                      "Global warming when CO₂ levels are too high.\nContribution to the natural greenhouse effect that keeps Earth habitable.",
                ),
                const SizedBox(height: 30),
                Text(
                  "Solutions",
                  style: getTextStyle(),
                ),
                const SizedBox(height: 10),
                const InfoBubble(
                  text:
                      "Although CO₂ is naturally occurring, human activities that exacerbate its levels can be mitigated through emission reductions and carbon sequestration.",
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

//
class CO2Impact extends StatelessWidget {
  final String txt;
  const CO2Impact({
    Key? key,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // CO2 Text with style
        Text(
          txt,
          style: getTextStyle(),
        ),
        const SizedBox(width: 8), // Space between CO2 and the icon+label
        const Row(
          children: [
            Icon(
              Icons.warning_amber_rounded, // Warning icon
              color: Colors.orange,
              size: 24,
            ),
            SizedBox(width: 4), // Space between icon and text
            Text(
              'Moderate impact',
              style: TextStyle(
                fontSize: 18,
                color: Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

//
class InfoBubble extends StatelessWidget {
  final String text;

  const InfoBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple[800]!, Colors.purple[300]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontFamily: 'Comic Sans MS', // Custom font style
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

//
// Reusable Neon Button Widget

class NeonButton extends StatelessWidget {
  final String text;
  final double fs;
  final double height;
  final double width;

  const NeonButton({
    super.key,
    required this.text,
    this.fs = 22,
    this.height = 60,
    this.width = 300,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height, // Setting fixed height here
      width: width,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: const LinearGradient(
            colors: [Colors.deepPurple, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.6),
              blurRadius: 10,
              spreadRadius: 3,
              offset: const Offset(-5, 5),
            ),
            BoxShadow(
              color: Colors.purpleAccent.withOpacity(0.6),
              blurRadius: 10,
              spreadRadius: 3,
              offset: const Offset(5, -5),
            ),
          ],
          border: Border.all(
            color: Colors.blueAccent.withOpacity(0.8),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily:
                  'Comic Sans MS', // Custom font style to match the example
              fontSize: fs,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
