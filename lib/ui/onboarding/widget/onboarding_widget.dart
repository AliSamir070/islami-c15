import 'package:flutter/material.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import 'package:islami_c15/model/onboarding_model/onboardingmodel.dart';



class WidgetIntro extends StatelessWidget {
  final Intro intro;

  const WidgetIntro({super.key, required this.intro});

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 69.5),
              child: Image.asset(
                AssetManager.logo,
                width: 291,
                height: 171,
              ),
            ),
            SizedBox(height: 40),
            Image.asset(
              intro.image,
              height: 300,
              width: 320,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                intro.title,
                style: TextStyle(
                  color: ColorManager.navBarColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                intro.description,
                style: TextStyle(
                  color: ColorManager.navBarColor,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      );


  }
}
