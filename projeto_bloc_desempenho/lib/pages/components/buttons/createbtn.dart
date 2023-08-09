import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/bloc/event.dart';
import '../../../data/dados.dart';
import '../../../main.dart';
import '../../../model/estado.dart';
import '../../../styles.dart';
import '../../../widgets/my_btn.dart';

class CreateBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () async{
        int index = Random().nextInt(Dados.estados.length);
        Estado estado = Estado.fromJson(Dados.estados[index]);
        bloc.add(CreateItemEvent(item: estado));
      },
      onLongPress: ()async{
        // bool finished = false;
        // Desempenho.listaDesempenhos.clear();
        // do{
        //   _itemController.createOne();
        //   await Desempenho.wait();
        //   if(Desempenho.listaDesempenhos.length >= Desempenho.repeticoes){
        //     finished = true;
        //   }
        // }while(!finished);
        // await Desempenho.mostrarMediaDesempenho();
      },
      color: createColor,
      icon: Icons.add,
    );
  }
}


