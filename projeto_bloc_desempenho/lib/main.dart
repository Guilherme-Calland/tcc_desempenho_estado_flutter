import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/home/home.dart';

import 'blocs/bloc/bloc.dart';

void main() => runApp(DesempenhoGetxApp());

final ItemBloc bloc = ItemBloc();

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



