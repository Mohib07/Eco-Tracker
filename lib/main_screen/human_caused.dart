import 'package:flutter/material.dart';
import 'package:nasa_space_app/home_screen.dart';
import 'package:nasa_space_app/human_causes/ch4_page.dart';
import 'package:nasa_space_app/human_causes/co2_page.dart';
import 'package:nasa_space_app/human_causes/hfc_page.dart';
import 'package:nasa_space_app/human_causes/n20_page.dart';
import 'package:nasa_space_app/human_causes/sf6_page.dart';
import 'package:nasa_space_app/main_screen/main_screen.dart';

class HumanCaused extends StatefulWidget {
  const HumanCaused({super.key});

  @override
  State<HumanCaused> createState() => _HumanCausedState();
}

class _HumanCausedState extends State<HumanCaused> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHeaderUI(context),
              const Spacer(),
              CustomStartButton(
                label: "Carbon di oxide",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CO2Page2(),
                      ));
                },
              ),
              //
              const SizedBox(height: 40),

              CustomStartButton(
                label: "Methane",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CH4Page2(),
                      ));
                },
              ),
              //
              const SizedBox(height: 40),

              CustomStartButton(
                label: "Nitrous Oxide",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const N2OPage2(),
                      ));
                },
              ),
              //
              const SizedBox(height: 40),

              CustomStartButton(
                label: "CFCs and HFCs ",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HFCPage(),
                      ));
                },
              ),
              //
              const SizedBox(height: 40),
              CustomStartButton(
                label: "Sulfur Hexafluoride ",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SF6Page(),
                      ));
                },
              ),
              const Spacer(flex: 2),
            ],
          ),
          //
        ),
      ),
    );
  }

  Widget _buildHeaderUI(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: whiteColor)),
        const SizedBox(width: 90),
        const Text(
          "Human Caused",
          style: TextStyle(fontSize: 24, color: whiteColor),
        ),
      ],
    );
  }
}
