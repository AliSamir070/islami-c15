import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import 'package:islami_c15/core/resources/StringsManager.dart';
import 'package:islami_c15/ui/home/tabs/hadeth_tab/HadethTab.dart';
import 'package:islami_c15/ui/home/tabs/quran_tab/QuranTab.dart';
import 'package:islami_c15/ui/home/tabs/radio_tab/RadioTab.dart';
import 'package:islami_c15/ui/home/tabs/sebha_tab/SebhaTab.dart';
import 'package:islami_c15/ui/home/tabs/time_tab/TimeTab.dart';
import '../../../core/resources/ColorManager.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.background,
      bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          backgroundColor: ColorManager.navBarColor,
          indicatorColor: ColorManager.background.withOpacity(0.6),
          selectedIndex:selectedIndex ,
          onDestinationSelected: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          destinations: [
            NavigationDestination(
                icon:SvgPicture.asset(
                  AssetManager.QuranIcon,
                ) ,
                label: StringsManager.quran,
                selectedIcon: SvgPicture.asset(
                    AssetManager.QuranSelectedIcon
                ),
            ),
            NavigationDestination(
                icon:SvgPicture.asset(
                  AssetManager.hadethIcon,
                ) ,
                label: StringsManager.hadeth,
                selectedIcon: SvgPicture.asset(
                    AssetManager.hadethSelectedIcon
                ),
            ),
            NavigationDestination(
                icon:SvgPicture.asset(
                  AssetManager.SebhaIcon,
                ) ,
                label: StringsManager.sebha,
                selectedIcon: SvgPicture.asset(
                    AssetManager.SebhaSelectedIcon
                ),
            ),
            NavigationDestination(
                icon:SvgPicture.asset(
                  AssetManager.radioIcon,
                ) ,
                label: StringsManager.radio,
                selectedIcon: SvgPicture.asset(
                    AssetManager.radioSelectedIcon
                ),
            ),
            NavigationDestination(
                icon:SvgPicture.asset(
                  AssetManager.TimeIcon,
                ) ,
                label: StringsManager.time,
                selectedIcon: SvgPicture.asset(
                    AssetManager.TimeSelectedIcon
                ),
            ),
          ]
      ),
      body: tabs[selectedIndex],
    );
  }
}
