// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';

import '../../../../../model/SuraModel.dart';
import '../../../../sura_details/screen/suradetails_sceen.dart';

class RecentlyQuranWidget extends StatelessWidget {
  SuraModel sura;
  RecentlyQuranWidget(this.sura);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: sura);
      },
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.navBarColor,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 20, left: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    sura.suraNameEn,
                    style: TextStyle(
                        color: ColorManager.background,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    sura.suraNameAr,
                    style: TextStyle(
                        color: ColorManager.background,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${sura.versesNumber} Verses",
                    style: TextStyle(
                        color: ColorManager.background,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Image.asset(AssetManager.quranRecently)
          ],
        ),
      ),
    );
  }
}
