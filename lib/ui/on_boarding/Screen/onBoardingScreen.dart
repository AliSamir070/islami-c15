import 'package:flutter/material.dart';
import 'package:islami_c15/core/PrefsManager.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';
import 'package:islami_c15/model/onBoardingModel.dart';
import 'package:islami_c15/ui/home/screen/home_screen.dart';
import 'package:islami_c15/ui/on_boarding/Widgets/onBoardingItem.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';

class onBoardingScreen extends StatefulWidget {
  static const String routeName = "onBoarding";

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override

  void initState() {
    currentPage = 0;
  }

  List<onBoardingModel> onBoardingpPges = [
    onBoardingModel(
        image: AssetManager.welcome, title: "Welcome To Islmi App", text: ""),
    onBoardingModel(
      image: AssetManager.kabba,
      title: "Welcome To Islmi App",
      text: "We Are Very Excited To Have You In Our Community",
    ),
    onBoardingModel(
        image: AssetManager.reading,
        title: "Reading the Quran",
        text: "Read, and your Lord is the Most Generous"),
    onBoardingModel(
        image: AssetManager.bearish,
        title: "bearish",
        text: "Praise the name of your Lord, the Most High"),
    onBoardingModel(
        image: AssetManager.radio,
        title: "Holy Quran Radio",
        text:
            "You can listen to the Holy Quran Radio through the application for free and easily")
  ];
  bool finished = false;
  late int currentPage;
  PageController onBoardingController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.background,
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: ColorManager.background,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        AssetManager.islamiLogo,
                        height: 130,
                        fit: BoxFit.fitHeight,
                      ),
                      Expanded(
                          child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        controller: onBoardingController,
                        onPageChanged: (value) {
                          currentPage = value;
                          print("\n currentPgae: ${currentPage}");
                          print("pageslength :${onBoardingpPges.length} ");
                          setState(() {});
                        },
                        itemCount: onBoardingpPges.length,
                        itemBuilder: (context, index) =>
                            onBoardingItem(data: onBoardingpPges[index]),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () =>
                                  onBoardingController.previousPage(
                                      duration: Duration(milliseconds: 150),
                                      curve: Curves.bounceIn),
                              child: Text(
                                "Previus",
                                style:
                                    TextStyle(color: ColorManager.navBarColor),
                              )),
                          TextButton(
                              onPressed: () => onBoardingController.nextPage(
                                  duration: Duration(milliseconds: 150),
                                  curve: Curves.bounceIn),
                              child: currentPage != onBoardingpPges.length - 1
                                  ? Text(
                                      "Next",
                                      style: TextStyle(
                                          color: ColorManager.navBarColor,
                                          fontSize: 16),
                                    )
                                  : TextButton(
                                      onPressed: () {
                                        PrefsManager.setobBoardingFlag(true);
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                HomeScreen.routeName);
                                      },
                                      child: Text(
                                        "Finish",
                                        style: TextStyle(
                                            color: ColorManager.navBarColor,
                                            fontSize: 16),
                                      ))),
                        ],
                      )
                    ]))));
  }
}
