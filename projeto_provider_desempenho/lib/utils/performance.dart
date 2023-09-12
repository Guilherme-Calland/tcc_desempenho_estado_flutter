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
        debugPrint('${listaDesempenhos.length} -> $rotuloSalvo: $desempenho microssegundos');
        listaDesempenhos.add(desempenho);
      }
    }
  }

  static void reset(){
    tempoSalvo = 0;
    rotuloSalvo = '';
    listaDesempenhos.clear();
  }

  static String _medidaTempo(DateTime now){
    String timeInMilliseconds = '${now.millisecond}';
    String timeInMicroseconds = '${now.microsecond}';
    while(_notInCorrectFormat(timeInMicroseconds)){
      timeInMicroseconds = '0$timeInMicroseconds';
    }
    return '$timeInMilliseconds$timeInMicroseconds';
  }

  static bool _notInCorrectFormat(String timeInMicroseconds) => timeInMicroseconds.length < 3;

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

  static Future<void> mostrarMediaDesempenho() async{
    debugPrint('aguarde...');
    await wait(milliseconds: 500);
    int mediaDesempenho = media(Desempenho.listaDesempenhos);
    debugPrint('média $rotuloSalvo: $mediaDesempenho microssegundos');
  }
}