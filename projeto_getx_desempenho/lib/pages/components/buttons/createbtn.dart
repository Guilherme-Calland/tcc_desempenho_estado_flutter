import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projeto_getx_desempenho/data/dados.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../widgets/my_btn.dart';

class CreateBtn extends StatelessWidget {

  final _itemController = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () async{
        _itemController.createOne();
      },
      onLongPress: ()async{
        bool finished = false;
        do{
          _itemController.createOne();
          await Future.delayed(Duration(milliseconds: 100));
          if(Desempenho.listaDesempenhos.length >= Desempenho.repeticoes){
            finished = true;
            Desempenho.listaDesempenhos.clear();
          }
        }while(!finished);
      },
      color: createColor,
      icon: Icons.add,
    );
  }
}


