import 'package:flutter/material.dart';
import 'package:nasa_space_app/main_screen/human_caused.dart';
import 'package:nasa_space_app/main_screen/main_screen.dart';
import 'package:nasa_space_app/main_screen/natural_causes.dart';

class SourcesPage extends StatefulWidget {
  const SourcesPage({super.key});

  @override
  State<SourcesPage> createState() => _SourcesPageState();
}

class _SourcesPageState extends State<SourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Main_Theme.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            // Foreground content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Sources of Greenhouse Gases',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                //

                const Spacer(flex: 3),

                //
                const SizedBox(height: 30),
                CustomStartButton(
                  label: 'Human Caused',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HumanCaused(),
                        ));
                  },
                ),
                const SizedBox(height: 40),

                CustomStartButton(
                  label: 'Natural Sources',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NaturalCauses(),
                        ));
                  },
                ),
                const SizedBox(height: 120),

                const Spacer(flex: 4),
              ],
            )),
      ),
    );
  }
}
