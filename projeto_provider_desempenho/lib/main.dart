import 'package:flutter/material.dart';
import 'package:projeto_provider_desempenho/pages/home.dart';
import 'package:provider/provider.dart';

import 'controllers/item_controller.dart';

void main() => runApp(DesempenhoGetxApp());

class DesempenhoGetxApp extends StatelessWidget {
  const DesempenhoGetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<ItemController>(
        create: (_) => ItemController(),
        child: HomePage(),
      )
    );
  }
}



