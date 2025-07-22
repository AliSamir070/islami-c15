import 'package:flutter/cupertino.dart';
import 'package:islami_c15/model/onBoardingModel.dart';

import '../../../core/resources/ColorManager.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';

class onBoardingItem extends StatelessWidget {
  onBoardingModel data;

  onBoardingItem({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Spacer(),
          Image.asset(data.image),
          Spacer(),
          Text(
            data.title,
            style: TextStyle(color: ColorManager.navBarColor, fontSize: 20),
          ),
          Spacer(),
          Text(
            data.text,
            style: TextStyle(
              color: ColorManager.navBarColor,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer()
        ],
      ),
    );
  }
}
