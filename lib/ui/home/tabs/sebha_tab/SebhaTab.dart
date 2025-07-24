import 'dart:ui_web';
import 'package:islami_c15/core/resources/AssetManager.dart';

import 'package:flutter/material.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
        top: 30,
        right: 20,
        left: 20
    ),
    width: double.infinity,
    decoration: const BoxDecoration(
    image: DecorationImage(image: AssetImage(AssetManager.sebhaBackground),fit: BoxFit.fill),
    ),
    );
  }
}
