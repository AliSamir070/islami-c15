// ignore_for_file: camel_case_types, file_names, prefer_const_constructors

import 'package:flutter/material.dart';

import '../home/screen/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = "OnBoarding";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    introComponent(
      title: "Welcome To Islmi App",
      description: "",
      imagePath: "assets/images/onboarding_images/Frame 4.png",
    ),
    introComponent(
      title: "Welcome To Islmi",
      description: "We Are Very Excited To Have You In Our Community",
      imagePath: "assets/images/onboarding_images/Frame 3.png",
    ),
    introComponent(
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
      imagePath:
          "assets/images/onboarding_images/1eee3505289310e0cfc11dd67dced3869db67b05.png",
    ),
    introComponent(
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
      imagePath:
          "assets/images/onboarding_images/8cdade62b49226d698fe69b38c30a1796aebd4e9.png",
    ),
    introComponent(
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
      imagePath:
          "assets/images/onboarding_images/996f704874c03b402094268c72e156e63f8425e9.png",
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // انتقل إلى HomeScreen عند الضغط على Finish
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child:
                    Image.asset("assets/images/onboarding_images/Group 31.png"),
              ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) => _pages[index],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 🔷 زر Back
                if (_currentPage > 0)
                  TextButton(
                    onPressed: _previousPage,
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Color(0xffE2BE7F), fontSize: 18),
                    ),
                  )
                else
                  const SizedBox(width: 60),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 12 : 8,
                      height: _currentPage == index ? 12 : 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? const Color(0xffE2BE7F)
                            : Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),

                // 🔷 زر Next / Finish
                TextButton(
                  onPressed: _nextPage,
                  child: Text(
                    _currentPage == _pages.length - 1 ? "Finish" : "Next",
                    style: const TextStyle(
                      color: Color(0xffE2BE7F),
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class introComponent extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const introComponent({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath, height: 300),
        const SizedBox(height: 30),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xffE2BE7F),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xffE2BE7F),
            ),
          ),
        ),
      ],
    );
  }
}
