import 'package:flutter/material.dart';

class Desempenho{
  static int tempoSalvo = 0;
  static String rotuloSalvo = '';

  static void salvarTempo(String rotulo){
    rotuloSalvo = rotulo;
    DateTime now = DateTime.now();
    String timeTxt = _medidaTempo(now);
    tempoSalvo = int.parse(timeTxt);
  }

  static void mostrarDesempenho() {
    if(tempoSalvo != 0){
      DateTime now = DateTime.now();
      String nowTxt = _medidaTempo(now);
      int tempoAgora = int.parse(nowTxt);
      int desempenho = tempoAgora - tempoSalvo;
      debugPrint('$rotuloSalvo: $desempenho milissegundos');
    }
  }

  static String _medidaTempo(DateTime now) => '${now.millisecond}';
}