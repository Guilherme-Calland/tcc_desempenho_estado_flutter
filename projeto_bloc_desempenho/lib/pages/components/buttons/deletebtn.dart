import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/bloc/event.dart';
import 'package:projeto_bloc_desempenho/data/dados.dart';
import '../../../main.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class DeleteBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => bloc.add(DeleteItemEvent()),
      onLongPress: ()async{
        // bool finished = false;
        // Desempenho.listaDesempenhos.clear();
        // do{
        //   _itemController.deleteOne();
        //   await Desempenho.wait();
        //   if(_itemController.itemList.isEmpty){
        //     finished = true;
        //   }
        // }while(!finished);
        // await Desempenho.mostrarMediaDesempenho();
      },
      icon: Icons.delete,
      color: deleteColor,
    );
  }
}
