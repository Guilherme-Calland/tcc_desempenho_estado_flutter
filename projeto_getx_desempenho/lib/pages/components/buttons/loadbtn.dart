import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../widgets/my_btn.dart';

class LoadButton extends StatelessWidget {

  final _itemController = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () async{
        _itemController.loadList();
      },
      onLongPress: ()async{
        bool finished = false;
        Desempenho.listaDesempenhos.clear();
        do{
          _itemController.loadList();
          await Desempenho.wait();
          if(Desempenho.listaDesempenhos.length >= Desempenho.repeticoes){
            finished = true;
          }
        }while(!finished);
        await Desempenho.mostrarMediaDesempenho();
      },
      color: readColor,
      icon: Icons.list,
    );
  }
}


