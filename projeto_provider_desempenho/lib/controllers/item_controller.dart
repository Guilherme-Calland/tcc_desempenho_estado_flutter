import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/dados.dart';
import '../model/estado.dart';
import '../utils/performance.dart';

class ItemController extends ChangeNotifier{
  final List<Estado> itemList = [];

  static ItemController getProvider(BuildContext context) => Provider.of<ItemController>(context, listen: false);

  void createItem() {
    int index = Random().nextInt(Dados.estados.length);
    Estado estado = Estado.fromJson(Dados.estados[index]);
    itemList.add(estado);
    Desempenho.salvarTempo('desempenho criando');
    notifyListeners();
  }

  void readItems(){
    List<Estado> tempList = Dados.estados.map((e) => Estado.fromJson(e)).toList();
    itemList.clear();
    itemList.addAll(tempList);
    Desempenho.salvarTempo('desempenho carregando dados');
    notifyListeners();
  }

  void updateItem() {
    List<Estado> tempList = [];
    bool updatedOne = false;
    itemList.cast<Estado>().forEach((element) {
      if(!element.nome.contains("(atualizado)") && !updatedOne){
        updatedOne = true;
        element.nome += " (atualizado)";
        element.cidades = element.cidades.reversed.toList();
      }
      tempList.add(element);
    });
    itemList.clear();
    itemList.addAll(tempList);
    Desempenho.salvarTempo('desempenho atualizando');
    notifyListeners();
  }

  void deleteItem() {
    if(itemList.isNotEmpty){
      itemList.removeLast();
      Desempenho.salvarTempo('desempenho deletando');
      notifyListeners();
    }
  }

  int randomize(int num) => Random().nextInt(num);

}