import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/widgets/my_btn.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';

class DeleteBtn extends StatelessWidget {

  final _itemController = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => _itemController.deleteItem(),
      onLongPress: ()async{
        bool finished = false;
        Desempenho.listaDesempenhos.clear();
        do{
          _itemController.deleteItem();
          await Desempenho.wait();
          if(_itemController.itemList.isEmpty){
            finished = true;
          }
        }while(!finished);
        await Desempenho.mostrarMediaDesempenho();
      },
      icon: Icons.delete,
      color: deleteColor,
    );
  }
}
