import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/widgets/my_btn.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';

class DeleteBtn extends StatelessWidget {

  final _itemController = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => _itemController.deleteOne(),
      onLongPress: () => _itemController.deleteAll(),
      icon: Icons.delete,
      color: deleteColor,
    );
  }
}
