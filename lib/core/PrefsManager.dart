import 'package:islami_c15/core/resources/AppConstants.dart';
import 'package:islami_c15/core/resources/StringsManager.dart';
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

  static setobBoardingFlag(bool flag){
    print("\nonBoardingFlag setted: $flag");
    prefs.setBool(StringsManager.onBoadringFlag, flag);
  }

  static getonBoardingFlag(){

    bool? flag= prefs.getBool(StringsManager.onBoadringFlag);
    print("onBoardingFlag: ${flag }");
    return flag;

  }
}