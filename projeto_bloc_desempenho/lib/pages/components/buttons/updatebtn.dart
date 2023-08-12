import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/bloc/event.dart';
import 'package:projeto_bloc_desempenho/main.dart';
import '../../../model/estado.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class UpdateBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => bloc.add(UpdateItemEvent()),
      onLongPress: ()async{
        Desempenho.listaDesempenhos.clear();
        int i = 0;
        do{
          i++;
          bloc.add(UpdateItemEvent());
          await Desempenho.wait();
        }while((){
          return i < 100;
        }());
        await Desempenho.mostrarMediaDesempenho();
      },
      color: editColor,
      icon: Icons.edit,
    );
  }
}


