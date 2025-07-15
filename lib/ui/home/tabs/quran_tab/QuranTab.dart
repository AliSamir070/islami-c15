import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c15/core/PrefsManager.dart';
import 'package:islami_c15/core/resources/AppConstants.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';
import 'package:islami_c15/core/resources/StringsManager.dart';
import 'package:islami_c15/ui/home/tabs/quran_tab/widgets/RecentlyQuranWidget.dart';
import 'package:islami_c15/ui/home/tabs/quran_tab/widgets/SuraWidget.dart';

import '../../../../model/SuraModel.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> recently = [];
  String searchText = "";
  List<SuraModel> filteredList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recently = PrefsManager.getRecentlySurasList().reversed.toList();
    filteredList = surasList;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        right: 20,
        left: 20
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AssetManager.quranBack),fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          Image.asset(AssetManager.islami,fit: BoxFit.fitHeight,height: 130,),
          SizedBox(height: 21,),
          TextField(
            onChanged: (value) {
              searchText = value;
              filteredList = searchSuraWithName();
              setState(() {

              });
            },
            style: TextStyle(
              color: ColorManager.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w700
            ),
            decoration: InputDecoration(
              hintText: StringsManager.suraName,
              hintStyle: TextStyle(
                  color: ColorManager.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 56,
                maxWidth: 56
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  left: 14,
                  right: 14
                ),
                child: SvgPicture.asset(
                    AssetManager.QuranSelectedIcon,
                  height: 28,
                  width: 28,
                  colorFilter: ColorFilter.mode(ColorManager.navBarColor,
                      BlendMode.srcIn
                  ) ,
                ),
              ),
              filled: true,
              fillColor: ColorManager.background.withOpacity(0.7),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorManager.navBarColor,
                  width: 1
                )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: ColorManager.navBarColor,
                      width: 1
                  )
              )
            ),
          ),
          SizedBox(height: 20,),
          searchText.isNotEmpty
              ? Container()
              :Align(
            alignment: Alignment.centerLeft,
            child: Text(StringsManager.mostRecently,style: TextStyle(
              color: ColorManager.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w700
            ),),
          ),
          searchText.isNotEmpty
              ? Container()
              :Expanded(
            flex: 2,
            child: recently.isEmpty
                ?Center(
                  child: Text("No Items Found yet",style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700
                              ),),
                )
                :ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => RecentlyQuranWidget(recently[index]),
                separatorBuilder: (context, index) => SizedBox(width: 10,),
                itemCount:recently.length
            ),
          ),
          SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(StringsManager.suraList,style: TextStyle(
                color: ColorManager.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w700
            ),),
          ),
          Expanded(
            flex: 4,
            child: ListView.separated(
                itemBuilder: (context, index) => SuraWidget(
                    filteredList[index],
                        (){
                      for(int i=0;i<recently.length;i++){
                        if(recently[i] == filteredList[index]){
                          recently.removeAt(i);
                        }
                      }
                      recently.insert(0, filteredList[index]);
                      PrefsManager.saveRecentlySurasList(recently);
                  setState(() {

                  });
                }),
                separatorBuilder:(context, index) => Divider() ,
                itemCount: filteredList.length
            ),
          )
        ],
      ),
    );
  }
  // سبحان الله 1-30
  // الحمد الله
  // الله اكبر
  // لا اله الا الله
  List<SuraModel> searchSuraWithName(){
    List<SuraModel> searchSuras = [];
    for(SuraModel sura in surasList){
      if(sura.suraNameEn.toLowerCase().contains(searchText.toLowerCase())
          || sura.suraNameAr.contains(searchText)){
        searchSuras.add(sura);
      }
    }
    return searchSuras;
  }
}
