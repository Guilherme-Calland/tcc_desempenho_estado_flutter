import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../widgets/my_btn.dart';

class CreateBtn extends StatelessWidget {
  CreateBtn({
    super.key,
  });

  final _itemController = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => _itemController.createOne(),
      onLongPress: () => _itemController.createMany(10000),
      color: createColor,
      icon: Icons.add,
    );
  }
}


