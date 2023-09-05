import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/page/home/home.dart';

void main() => runApp(DesempenhoGetxApp());

class DesempenhoGetxApp extends StatelessWidget {
  const DesempenhoGetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



