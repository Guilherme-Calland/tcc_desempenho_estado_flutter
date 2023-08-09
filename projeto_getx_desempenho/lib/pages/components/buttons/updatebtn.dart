import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import '../../../controllers/item_controller.dart';
import '../../../model/estado.dart';
import '../../../styles.dart';
import '../../../widgets/my_btn.dart';

class UpdateBtn extends StatelessWidget {

  final _itemController = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: (){
        _itemController.updateOne();
      },
      onLongPress: ()async{
        Desempenho.listaDesempenhos.clear();
        do{
          await Desempenho.wait();
          _itemController.updateOne();
        }while((){
          bool containsNotUpdated = false;
          _itemController.itemList.cast<Estado>().forEach((element) {
            if(!element.nome.contains("(atualizado)")){
              containsNotUpdated = true;
            }
          });
          return containsNotUpdated;
        }());
        await Desempenho.mostrarMediaDesempenho();
      },
      color: editColor,
      icon: Icons.edit,
    );
  }
}


