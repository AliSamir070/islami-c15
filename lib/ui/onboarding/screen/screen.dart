import 'package:flutter/material.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';
import 'package:islami_c15/ui/onboarding/widget/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:islami_c15/model/onboarding_model/onboardingmodel.dart';



class IntroScreen extends StatefulWidget {
  static const String routeNames = "intro";

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController pagecontroller = PageController();
  int currentPageIndex = 0;

  final List<Intro> introList = [
    Intro(
      image: AssetManager.screen1,
      title: 'Welcome To Islami App',
      description: '',
    ),
    Intro(
      image: AssetManager.screen2,
      title: 'Welcome To Islami',
      description: 'We are very excited to have you in our community',
    ),
    Intro(
      image: AssetManager.screen3,
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    Intro(
      image: AssetManager.screen4,
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    Intro(
      image: AssetManager.screen5,
      title: 'Holy Quran Radio',
      description: 'You can listen to the Holy Quran Radio through the app for free',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body:  Column(
        children: [
          // PageView
          Expanded(
            child: PageView.builder(
              controller: pagecontroller,
              itemCount: introList.length,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) => WidgetIntro(intro: introList[index]),
            ),
          ),

          SizedBox(height: 24),

          // Row: Skip | Indicator | Next
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip Button
                GestureDetector(
                  onTap: () {
                    pagecontroller.previousPage (duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child:  Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.navBarColor,
                    ),
                  ),
                ),

                // Smooth Page Indicator
                SmoothPageIndicator(
                  controller: pagecontroller,
                  count: introList.length,
                  effect: SlideEffect(
                    activeDotColor: ColorManager.navBarColor,
                    dotHeight: 10,
                    dotColor:Color(0xff707070),
                    dotWidth: 10,

                  ),

                ),

                // Next / Done Button
                GestureDetector(
                  onTap: () {
                    if (currentPageIndex == introList.length - 1) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      pagecontroller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    currentPageIndex == introList.length - 1 ? "Done" : "Next",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.navBarColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
