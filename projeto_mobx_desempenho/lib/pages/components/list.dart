
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_mobx_desempenho/mobx/my_store.dart';
import '../../model/estado.dart';
import '../../utils/performance.dart';
import '../../widgets/item_card.dart';

class ItemList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      ListView list = ListView.builder(
        // ignore: invalid_use_of_protected_member
        itemCount: myStore.itemList.length,
        itemBuilder: (context, index) {
          Estado item = myStore.itemList[index];
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