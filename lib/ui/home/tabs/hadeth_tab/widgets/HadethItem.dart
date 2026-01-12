// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';
import 'package:islami_c15/model/HadithModel.dart';
import 'package:islami_c15/ui/hadeth_details/screen/hadeth_details_screen.dart';

// ignore: must_be_immutable
class HadethItem extends StatelessWidget {
  HadithModel hadithModel;
  HadethItem(this.hadithModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: hadithModel);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: ColorManager.navBarColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(11),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Image.asset(AssetManager.leftHadithCorner)),
                        Expanded(
                          flex: 2,
                          child: Text(
                            hadithModel.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: ColorManager.background),
                          ),
                        ),
                        Expanded(
                            child: Image.asset(AssetManager.rightHadithCorner)),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(AssetManager.hadeithCardBack),
                          Text(
                            hadithModel.content,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            maxLines: 13,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: ColorManager.background),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              AssetManager.hadeithMosque,
              width: double.infinity,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}
