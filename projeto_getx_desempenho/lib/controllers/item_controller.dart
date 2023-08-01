import 'dart:math';
import 'dart:ui';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:projeto_getx_desempenho/data/dados.dart';
import 'package:projeto_getx_desempenho/model/estado.dart';
import 'package:projeto_getx_desempenho/model/item.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';

class ItemController extends GetxController{
  RxList itemList = [].obs;

  void createOne() {
    ItemModel novoItem = createRandom();
    Desempenho.salvarTempo('Criando 1');
    itemList.add(novoItem);
  }

  int randomize(int num) => Random().nextInt(num);

  ItemModel createRandom(){
    int index = Random().nextInt(Dados.estados.length);
    Estado estado = Estado.fromJson(Dados.estados[index]);
    int maxCardCol = 100;
    int cardR = randomize(maxCardCol); 
    int cardG = randomize(maxCardCol);
    int cardB = randomize(maxCardCol);
    Color corCartao = Color.fromRGBO(cardR, cardG, cardB, 1); //RGB de 0 a 100
    int difTxtCol = maxCardCol + 55;
    int autorR = randomize(maxCardCol) + difTxtCol;
    int autorG = randomize(maxCardCol) + difTxtCol;
    int autorB = randomize(maxCardCol) + difTxtCol;
    Color corTextoAutor = Color.fromRGBO(autorR, autorG, autorB, 1); // RBG de 155 a 255
    int fraseR = randomize(maxCardCol) + difTxtCol;
    int fraseG = randomize(maxCardCol) + difTxtCol;
    int fraseB = randomize(maxCardCol) + difTxtCol;
    Color corTextoFrase = Color.fromRGBO(fraseR, fraseG, fraseB, 1);
    int maxBorderCol = 225;
    int borderR = randomize(maxBorderCol);
    int borderG = randomize(maxBorderCol);
    int borderB = randomize(maxBorderCol);
    Color corBorda = Color.fromRGBO(borderR, borderG, borderB, 1);

    ItemModel item = ItemModel(
      corCartao: corCartao,
      corTextoAutor: corTextoAutor,
      corTextoFrase: corTextoFrase,
      corBorda: corBorda,
      estado: estado,
    );
    return item;

  }

  void deleteAll() {
    Desempenho.salvarTempo('Excluindo ${itemList.length}');
    itemList.clear();
  }

  createMany(int quantity) {
    List<ItemModel> items = [];
    for(int i = 0; i < quantity; i++){
      ItemModel newItem = createRandom();
      items.add(newItem);
    }
    Desempenho.salvarTempo('Criando $quantity');
    itemList.value = items;
  }

  void deleteOne() {
    if(itemList.isNotEmpty){
      int index = randomize(itemList.length);
      Desempenho.salvarTempo('Excluindo 1');
      itemList.removeAt(index);
    }
  }
}