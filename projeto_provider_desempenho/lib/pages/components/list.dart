
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/item_controller.dart';
import '../../model/estado.dart';
import '../../utils/performance.dart';
import '../../widgets/item_card.dart';

class ItemList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemController>(builder:(_, value, __) {

      ListView list = ListView.builder(
        // ignore: invalid_use_of_protected_member
        itemCount: value.itemList.length,
        itemBuilder: (context, index) {
          Estado item = value.itemList[index];
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