import 'package:flutter/material.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import '../../../../core/resources/ColorManager.dart';
import '../../../../core/resources/StringsManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int numberDone = 0;
  int index = 0;
  double rotationAngle = 0;
  String currentWord = 'سبحان الله';

  List<String> tsabih = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر"
  ];

  void increasedCounter() {
    setState(() {
      numberDone++;
      rotationAngle += 0.10;
      if (numberDone == 31) {
        numberDone = 0;
        index++;
        if (index >= tsabih.length) {
          index = 0;
        }
        currentWord = tsabih[index];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetManager.sebhaBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            AssetManager.islami,
            fit: BoxFit.fitHeight,
            height: 130,
          ),
          const SizedBox(height: 21),
          const Text(
            StringsManager.tasbih,
            style: TextStyle(
              color: ColorManager.whiteColor,
              fontSize: 36.0,
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(
            AssetManager.sebhaUpperPart,
            height: 60,
            fit: BoxFit.fitHeight,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: increasedCounter,
                child: Transform.rotate(
                  angle: rotationAngle,
                  child: Image.asset(
                    AssetManager.sebha,
                    height: 340,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: increasedCounter,
                    child: Text(
                      currentWord,
                      style: const TextStyle(
                        color: ColorManager.whiteColor,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: increasedCounter,
                    child: Text(
                      numberDone.toString(),
                      style: const TextStyle(
                        color: ColorManager.whiteColor,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
