import 'package:flutter/material.dart';
import 'package:islami_c15/core/PrefsManager.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';
import 'package:islami_c15/ui/hadeth_details/screen/hadeth_details_screen.dart';
import 'package:islami_c15/ui/home/screen/home_screen.dart';
import 'package:islami_c15/ui/on_boarding/Screen/onBoardingScreen.dart';
import 'package:islami_c15/ui/sura_details/screen/suradetails_sceen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool ? onBoardingFlag=PrefsManager.getonBoardingFlag();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        navigationBarTheme: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(TextStyle(
            color: Colors.white
          ))
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: onBoardingFlag!=true ?onBoardingScreen.routeName:HomeScreen.routeName,
      routes: {
        onBoardingScreen.routeName:(_)=>onBoardingScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
        SuraDetailsScreen.routeName:(_)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName:(_)=>HadethDetailsScreen()
      },
    );
  }
}

