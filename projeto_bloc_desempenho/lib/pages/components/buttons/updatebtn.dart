import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/bloc/event.dart';
import 'package:projeto_bloc_desempenho/main.dart';
import '../../../model/estado.dart';
import '../../../styles.dart';
import '../../../widgets/my_btn.dart';

class UpdateBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => bloc.add(UpdateItemEvent()),
      onLongPress: ()async{
        // Desempenho.listaDesempenhos.clear();
        // do{
        //   await Desempenho.wait();
        //   _itemController.updateOne();
        // }while((){
        //   bool containsNotUpdated = false;
        //   _itemController.itemList.cast<Estado>().forEach((element) {
        //     if(!element.nome.contains("(atualizado)")){
        //       containsNotUpdated = true;
        //     }
        //   });
        //   return containsNotUpdated;
        // }());
        // await Desempenho.mostrarMediaDesempenho();
      },
      color: editColor,
      icon: Icons.edit,
    );
  }
}


