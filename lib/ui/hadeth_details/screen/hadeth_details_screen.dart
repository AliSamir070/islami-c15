import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';
import 'package:islami_c15/core/resources/StringsManager.dart';
import 'package:islami_c15/model/HadithModel.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "hadethdetails";
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel hadithModel = ModalRoute.of(context)!.settings.arguments as HadithModel;
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(
          Icons.arrow_back,
          color: ColorManager.navBarColor,
        )),
        title: Text("${StringsManager.hadeth} ${hadithModel.number}",style: TextStyle(
          color: ColorManager.navBarColor,
          fontWeight: FontWeight.w700,
          fontSize: 20
        ),),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
         Expanded(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 18),
             child: Column(children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Image.asset(AssetManager.leftCorner,height: 92,width: 92,),
                   Text(hadithModel.title,
                     textDirection: TextDirection.rtl,
                     textAlign: TextAlign.center,
                     style: TextStyle(
                         color: ColorManager.navBarColor,
                         fontWeight: FontWeight.w700,
                         fontSize: 24
                     ) ,),
                   Image.asset(AssetManager.rightCorner,height: 92,width: 92,),
                 ],
               ),
               SizedBox(height: 17,),
               Expanded(
                 child: SingleChildScrollView(
                   child: Text(hadithModel.content,
                     textDirection: TextDirection.rtl,
                     textAlign: TextAlign.center,
                     style:TextStyle(
                         color: ColorManager.navBarColor,
                         fontWeight: FontWeight.w700,
                         fontSize: 20
                     ) ,),
                 ),
               ),
             ],),
           ),
         ),
          Image.asset(AssetManager.mosque)
        ],
      ),
    );
  }
}
