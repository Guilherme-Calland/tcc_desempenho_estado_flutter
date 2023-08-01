
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';
import '../../controllers/item_controller.dart';
import '../../model/item.dart';
import '../../widgets/item_card.dart';

class ItemList extends StatelessWidget {
  final _itemController = Get.find<ItemController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {

      ListView list = ListView.builder(
        itemCount: _itemController.itemList.value.length,
        itemBuilder: (context, index) {
          ItemModel item = _itemController.itemList[index];
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