
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_bloc_desempenho/bloc/bloc.dart';
import 'package:projeto_bloc_desempenho/bloc/state.dart';
import '../../model/item.dart';
import '../../widgets/item_card.dart';

class ItemList extends StatelessWidget {

  late final ItemBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      bloc: bloc,
      builder: (context, state){
        
      }
    );
    Obx(() {

      ListView list = ListView.builder(
        // ignore: invalid_use_of_protected_member
        itemCount: _itemController.itemList.value.length,
        itemBuilder: (context, index) {
          ItemModel item = _itemController.itemList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: ItemCard(item),
          );
        },
      );

      // Desempenho.salvarDesempenho();

      return list;
    });
  }


}