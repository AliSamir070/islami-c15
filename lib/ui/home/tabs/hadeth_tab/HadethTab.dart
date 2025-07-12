import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';
import 'package:islami_c15/core/resources/ColorManager.dart';
import 'package:islami_c15/model/HadithModel.dart';
import 'package:islami_c15/ui/home/tabs/hadeth_tab/widgets/HadethItem.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  PageController controller = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAhadethFile();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: ColorManager.background,
          image: DecorationImage(
              alignment: Alignment.topCenter,
              image:AssetImage(AssetManager.hadethBack)
          )
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AssetManager.islamiLogo,height: 130,fit: BoxFit.fitHeight,),
          SizedBox(height: 50,),
          Expanded(
            child: ahadeth.isEmpty
                ?Center(child: CircularProgressIndicator(color: ColorManager.navBarColor,),)
                :PageView.builder(
              controller: controller,
                itemBuilder: (context, index) =>HadethItem(ahadeth[index]),
                itemCount: ahadeth.length,
            ),
          ),

        ],
      ),
    );
  }

  List<HadithModel> ahadeth = [];

  readAhadethFile()async{
    String data = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethText = data.split("#");

    for(int i=0;i<ahadethText.length;i++){
      List<String> hadethLines = ahadethText[i].trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      String content = hadethLines.join(" ");
      HadithModel hadithModel = HadithModel(title: title, content: content,number: i+1);
      ahadeth.add(hadithModel);
    }
    setState(() {

    });
  }
}
