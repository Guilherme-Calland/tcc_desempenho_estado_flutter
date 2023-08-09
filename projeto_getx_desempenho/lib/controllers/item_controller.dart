import 'dart:math';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/data/dados.dart';
import 'package:projeto_getx_desempenho/model/estado.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';

class ItemController extends GetxController{
  final RxList itemList = [].obs;

  void createOne() {
    Estado novoEstado = createRandom();
    Desempenho.salvarTempo('desempenho criando');
    itemList.add(novoEstado);
  }

  int randomize(int num) => Random().nextInt(num);

  Estado createRandom(){
    int index = Random().nextInt(Dados.estados.length);
    Estado estado = Estado.fromJson(Dados.estados[index]);
    return estado;
  }

  void loadList(){
    List<Estado> tempList = Dados.estados.map((e) => Estado.fromJson(e)).toList();
    itemList.clear();
    Desempenho.salvarTempo('desempenho carregando dados, tamanho lista: ${Dados.estados.length}');
    itemList.value = tempList;
  }

  void updateOne() {
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

  void deleteOne() {
    if(itemList.isNotEmpty){
      Desempenho.salvarTempo('desempenho deletando');
      itemList.removeLast();
    }
  }
}