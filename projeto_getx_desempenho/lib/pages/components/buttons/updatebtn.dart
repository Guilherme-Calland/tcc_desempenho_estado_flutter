import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../widgets/my_btn.dart';

class UpdateBtn extends StatelessWidget {

  final _itemController = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () async{
        bool finished = false;
        if(Desempenho.listaDesempenhos.length < Desempenho.repeticoes){
          return;
        }

        do{
          _itemController.updateOne();
          await Future.delayed(Duration(milliseconds: 100));
          if(Desempenho.listaDesempenhos.length >= Desempenho.repeticoes){
            finished = true;
            Desempenho.listaDesempenhos.clear();
          }
        }while(!finished);
      },
      color: editColor,
      icon: Icons.edit,
    );
  }
}


