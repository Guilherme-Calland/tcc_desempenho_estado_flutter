
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/model/estado.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import '../../controllers/item_controller.dart';
import '../../widgets/item_card.dart';

class ItemList extends StatelessWidget {
  final _itemController = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {

      ListView list = ListView.builder(
        // ignore: invalid_use_of_protected_member
        itemCount: _itemController.itemList.value.length,
        itemBuilder: (context, index) {
          Estado item = _itemController.itemList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ItemCard(item),
          );
        },
      );

      Desempenho.salvarDesempenho();

      return list;
    });
  }


}