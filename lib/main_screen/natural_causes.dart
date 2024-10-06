import 'package:flutter/material.dart';
import 'package:nasa_space_app/home_screen.dart';
import 'package:nasa_space_app/main_screen/main_screen.dart';
import 'package:nasa_space_app/natural_causes/ch4.dart';
import 'package:nasa_space_app/natural_causes/co2.dart';
import 'package:nasa_space_app/natural_causes/h20.dart';
import 'package:nasa_space_app/natural_causes/n20.dart';
import 'package:nasa_space_app/natural_causes/o3.dart';

class NaturalCauses extends StatefulWidget {
  const NaturalCauses({super.key});

  @override
  State<NaturalCauses> createState() => _NaturalCausesState();
}

class _NaturalCausesState extends State<NaturalCauses> {
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
                        builder: (context) => const CO2Page(),
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
                        builder: (context) => const CH4Page(),
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
                        builder: (context) => const N2OPage(),
                      ));
                },
              ),
              //
              const SizedBox(height: 40),

              CustomStartButton(
                label: "Ozone",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const O3Page(),
                      ));
                },
              ),
              //
              const SizedBox(height: 40),
              CustomStartButton(
                label: "Water Vapour",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const H2OPage(),
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
          "Natural Causes",
          style: TextStyle(fontSize: 24, color: whiteColor),
        ),
      ],
    );
  }
}
