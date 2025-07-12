import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';
import 'package:islami_c15/model/SuraModel.dart';
import 'package:islami_c15/ui/sura_details/screen/suradetails_sceen.dart';

class SuraWidget extends StatelessWidget {
  SuraModel suraModel;
  SuraWidget(this.suraModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,arguments: suraModel);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AssetManager.quranNumber),
              Text(suraModel.suraNumber.toString(),style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700
              ),)
            ],
          ),
          SizedBox(width: 24,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suraModel.suraNameEn,style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),),
                Text("${suraModel.versesNumber} Verses",style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),),
              ],
            ),
          ),
          Text(suraModel.suraNameAr,style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700
          ),)
        ],
      ),
    );
  }
}
