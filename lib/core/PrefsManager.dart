// ignore_for_file: file_names

import 'package:islami_c15/core/resources/AppConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/SuraModel.dart';

class PrefsManager{
  static late SharedPreferences prefs;

  static init()async{
    prefs = await SharedPreferences.getInstance();
  }
  static saveRecentlySurasList(List<SuraModel> recently){
    List<String> recentlyStringlist = recently.map((sura) => sura.suraNameEn).toList();
    prefs.setStringList("recently", recentlyStringlist);
  }

  static List<SuraModel> getRecentlySurasList(){
      List<String> recentlyStringList = prefs.getStringList("recently")??[];
      List<SuraModel> suras = [];
      for(String name in recentlyStringList){
        SuraModel suraModel = surasList.firstWhere((sura) => sura.suraNameEn==name);
        suras.insert(0, suraModel);
      }
      return suras;
  }
}