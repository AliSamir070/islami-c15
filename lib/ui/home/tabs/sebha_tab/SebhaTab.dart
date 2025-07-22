import 'package:flutter/material.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  @override
  List<String> Azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا الله الا الله"
  ];
  int counter = 0;
  int index = 0;
  double angel=0;

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (counter == 30) {
          setState(() {
            if (index == 3) {
              index = 0;
            } else {
              index++;
            }
            counter = 1;
           angel=12;
          });
        } else {
          setState(() {
            counter++;
            angel+=12;
          });
        }
        print("counter: $counter");
        print("angel: $angel");
      },
      child: Stack(children: [
        Container(
          padding: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetManager.SebhaBackgroudn))),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  ColorManager.blackColor,
                  ColorManager.blackColor.withOpacity(0.7)
                ]),
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    AssetManager.islamiLogo,
                    height: 130,
                    fit: BoxFit.fitHeight,
                  ),
                  Spacer(),
                  Expanded(
                      child: Image.asset(
                    AssetManager.SenhaHand,
                    fit: BoxFit.fitHeight,
                  )),
                  Expanded(
                      flex: 4,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateZ(angel),
                            child: Image.asset(
                              AssetManager.SebhaBody,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Azkar[index],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 36),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "$counter",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 36),
                              ),
                            ],
                          )
                        ],
                      )),
                  Spacer()
                ])),
      ]),
    );
  }
}
