import 'package:flutter/material.dart';
import 'package:islami_c15/core/resources/AssetManager.dart';

class sebhaDetailsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SizedBox.expand(
          child: Stack(
            children: [
              Image.asset(AssetManager.sebhaBackground,
                fit: BoxFit.cover,),
            ],
          ),
        ),
      );
  }

}