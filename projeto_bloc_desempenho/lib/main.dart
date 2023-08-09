import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/pages/home.dart';

void main() => runApp(DesempenhoGetxApp());

class DesempenhoGetxApp extends StatelessWidget {
  const DesempenhoGetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



