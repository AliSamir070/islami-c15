import 'package:flutter/material.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';
import 'dart:math' as math;

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle = 0;
  int counter = 30;
  int zekrIndex = 0;

   List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
     "لا إاله إلا الله"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              AssetManager.sebhaback,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 30),
              Center(
                child: Image.asset(
                  AssetManager.logo,
                  height: 177,
                  width: 291,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                style: TextStyle(
                  color: ColorManager.whiteColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.only(left: 60),
                child: Image.asset(
                  AssetManager.Mask,
                  height: 86,
                  width: 73,
                ),
              ),
              Transform.rotate(
                angle: angle,
                transformHitTests: true,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      angle += math.pi / 6;
                      counter++;
                      if(counter==33){
                        zekrIndex=(zekrIndex+1)% azkar.length;;
                        counter=0;
                      }
                    });
                  },
                  child: Image.asset(
                    AssetManager.sebhabody,
                    width: 350,
                    height: 350,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 505,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                azkar[zekrIndex],
                style: TextStyle(
                  color: ColorManager.whiteColor,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 580,
              left: 170,
            ),
            child: Text(
              "$counter",
              style: TextStyle(
                color: ColorManager.whiteColor,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
