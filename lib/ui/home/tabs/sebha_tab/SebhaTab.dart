import 'package:flutter/material.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  String currentDhikr = "سبحان الله";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 0.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      counter++;

      // Update dhikr text based on counter
      if (counter == 30) {
        currentDhikr = "الحمدلله";
      } else if (counter == 60) {
        currentDhikr = "الله اكبر";
      } else if (counter == 90) {
        currentDhikr = "سبحان الله";
        counter = 0; // Reset counter after completing full cycle
      }

      _controller.forward().then((_) => _controller.reverse());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(AssetManager.sebhaBack, fit: BoxFit.cover),
          ),

          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // ignore: deprecated_member_use
                    const Color(0xFF202020).withOpacity(0.7),
                    const Color(0xFF202020),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  transform: const GradientRotation(0.7),
                ),
              ),
            ),
          ),

          // Main content
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 33.0, left: 60, right: 60),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AssetManager.islamimousque),
                  const SizedBox(height: 20),
                  const Text(
                    "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 110),

                  // Interactive Sebha
                  GestureDetector(
                    onTap: _incrementCounter,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        // Sebha Body
                        RotationTransition(
                          turns: _rotationAnimation,
                          child: Image.asset(AssetManager.sebhabody),
                        ),

                        // Rotating Sebha Head
                        Positioned(
                          top: -75,
                          child: Image.asset(
                            AssetManager.SebhaHead,
                            height: 86,
                            width: 145,
                          ),
                        ),

                        // Dhikr Text
                        Positioned(
                          top: 90,
                          child: Text(
                            currentDhikr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        // Counter
                        Positioned(
                          top: 160,
                          child: Text(
                            "${counter % 30}", // Shows count within current dhikr (0-29)
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
