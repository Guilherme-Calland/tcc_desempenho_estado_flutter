import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/bloc/event.dart';
import 'package:projeto_bloc_desempenho/main.dart';
import '../../../styles.dart';
import '../../../widgets/my_btn.dart';

class LoadButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => bloc.add(ReadItemEvent()),
      onLongPress: ()async{
        // bool finished = false;
        // Desempenho.listaDesempenhos.clear();
        // do{
        //   _itemController.loadList();
        //   await Desempenho.wait();
        //   if(Desempenho.listaDesempenhos.length >= Desempenho.repeticoes){
        //     finished = true;
        //   }
        // }while(!finished);
        // await Desempenho.mostrarMediaDesempenho();
      },
      color: readColor,
      icon: Icons.list,
    );
  }
}


