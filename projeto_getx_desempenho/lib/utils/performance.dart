import 'package:flutter/material.dart';

class Desempenho{
  static int tempoSalvo = 0;
  static String rotuloSalvo = '';
  static List<int> listaDesempenhos = [];
  static int repeticoes = 100;

  static void salvarTempo(String rotulo){
    rotuloSalvo = rotulo;
    DateTime now = DateTime.now();
    String timeTxt = _medidaTempo(now);
    tempoSalvo = int.parse(timeTxt);
  }

  static void salvarDesempenho() {
    if(tempoSalvo != 0){
      DateTime now = DateTime.now();
      String nowTxt = _medidaTempo(now);
      int tempoAgora = int.parse(nowTxt);
      int desempenho = tempoAgora - tempoSalvo;
      if(desempenho > 0){
        debugPrint('${listaDesempenhos.length} -> $rotuloSalvo: $desempenho milissegundos');
        listaDesempenhos.add(desempenho);
      }
    }
  }

  static String _medidaTempo(DateTime now) => '${now.millisecond}';
  
  static int media(List<int> listaDesempenhos) {
    int soma = 0;
    listaDesempenhos.forEach((e){
      soma += e;
    });
    return (soma/listaDesempenhos.length).floor();
  }

  static Future<void> wait({int? milliseconds}) async {
    await Future.delayed(Duration(milliseconds: milliseconds ?? 100),);
  }
}