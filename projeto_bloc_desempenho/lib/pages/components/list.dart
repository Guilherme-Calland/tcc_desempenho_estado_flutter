
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_bloc_desempenho/bloc/event.dart';
import 'package:projeto_bloc_desempenho/utils/performance.dart';
import 'package:projeto_bloc_desempenho/widgets/item_card.dart';
import '../../bloc/bloc.dart';
import '../../bloc/state.dart';
import '../../main.dart';
import '../../model/estado.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      bloc: bloc,
      builder: ((context, state){
        if(state is ItemInitialState){
          return SizedBox();
        }else{
          final itemList = state.itemList;
          ListView list = ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index){
              Estado item = itemList[index];
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ItemCard(item),
              );
            },
          );

          Desempenho.salvarDesempenho();

          return list;

        }
      }),
    );
  }


}