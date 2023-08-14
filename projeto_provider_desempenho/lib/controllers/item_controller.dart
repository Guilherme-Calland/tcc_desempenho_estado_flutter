import 'dart:math';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/data/dados.dart';
import 'package:projeto_getx_desempenho/model/estado.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';

class ItemController extends GetxController{
  final RxList itemList = [].obs;

  void createItem() {
    int index = Random().nextInt(Dados.estados.length);
    Estado estado = Estado.fromJson(Dados.estados[index]);
    Desempenho.salvarTempo('desempenho criando');
    itemList.add(estado);
  }

  void readItems(){
    List<Estado> tempList = Dados.estados.map((e) => Estado.fromJson(e)).toList();
    itemList.clear();
    Desempenho.salvarTempo('desempenho carregando dados');
    itemList.value = tempList;
  }

  void updateItem() {
    Desempenho.salvarTempo('desempenho atualizando');
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
    itemList.value = tempList;
  }

  void deleteItem() {
    if(itemList.isNotEmpty){
      Desempenho.salvarTempo('desempenho deletando');
      itemList.removeLast();
    }
  }

  int randomize(int num) => Random().nextInt(num);

}