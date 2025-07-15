import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';
import 'package:islami_c15/model/SuraModel.dart';

import '../../../core/resources/AssetManager.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_details";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if(sura.isEmpty){
      loadFile(suraModel.suraNumber);
    }// future non blocking
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(suraModel.suraNameEn,style: TextStyle(
          color: ColorManager.navBarColor,
          fontWeight: FontWeight.w700,
          fontSize: 20
        ),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(
          Icons.arrow_back,
          color: ColorManager.navBarColor,
        )),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AssetManager.leftCorner,height: 92,width: 92,),
                      Text(suraModel.suraNameAr,style: TextStyle(
                          color: ColorManager.navBarColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 24
                      ),),
                      Image.asset(AssetManager.rightCorner,height: 92,width: 92,),
                    ],),
                  Expanded(
                    child: sura.isNotEmpty?SingleChildScrollView(
                      child: Text(sura,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorManager.navBarColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                        :Center(child: CircularProgressIndicator(color: ColorManager.navBarColor,)),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(AssetManager.mosque)
        ],
      ),
    );
  }

  add(int n1 , int n2){
    return n1 + n2;
  }

  String sura = "";

  loadFile(int suraNumber)async{
    // blocking code
    add(1, 5);
    String suraVerses = await rootBundle.loadString("assets/files/$suraNumber.txt"); // non blocking
    List<String> lines = suraVerses.split("\n");
    for(int i=0;i<lines.length;i++){
      sura+=lines[i];
      sura+="(${(i+1)})";
    }
    setState(() {

    });

  }
}
