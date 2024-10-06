import 'package:flutter/material.dart';
import 'package:nasa_space_app/home_screen.dart';
import 'package:nasa_space_app/json_api/iaqi/individual_air_quality_widget.dart';
import 'package:nasa_space_app/main_screen/categories.dart';

class MainScreen2 extends StatefulWidget {
  const MainScreen2({super.key});

  @override
  State<MainScreen2> createState() => _MainScreen2State();
}

class _MainScreen2State extends State<MainScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Human.png'),
                fit: BoxFit.cover,
              ),
            ),
            // Foreground content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text(
                  '',
                  style: TextStyle(fontSize: 48, color: Colors.white),
                ),
                //

                const Spacer(flex: 3),

                //
                const SizedBox(height: 30),
                CustomStartButton(
                  label: 'Air Quality Index',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  },
                ),
                const SizedBox(height: 40),

                CustomStartButton(
                  label: 'Emissions',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SourcesPage(),
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

//

class CustomStartButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  // Constructor to allow reusability with different labels and actions
  const CustomStartButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF6522BC), // Dark blue
              Color(0xff1d0937), // Purple
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.5),
              offset: const Offset(0, 3),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
