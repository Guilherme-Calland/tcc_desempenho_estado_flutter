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
      onTap: (){
        _itemController.updateOne();
      },
      onLongPress: ()async{
        // for(int i = 0; i < _itemController.itemList.length; i ++){
        //   await Future.delayed(Duration(milliseconds: 100));
        //   _itemController.updateOne();
        // }
      },
      color: editColor,
      icon: Icons.edit,
    );
  }
}


