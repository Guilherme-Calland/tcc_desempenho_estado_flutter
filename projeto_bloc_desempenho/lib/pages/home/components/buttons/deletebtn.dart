import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/bloc/event.dart';
import 'package:projeto_bloc_desempenho/data/dados.dart';
import '../../../../main.dart';
import '../../../../styles.dart';
import '../../../../utils/performance.dart';
import '../../../../widgets/my_btn.dart';

class DeleteBtn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => bloc.add(DeleteItemEvent()),
      onLongPress: ()async{
        Desempenho.listaDesempenhos.clear();
        int i = 0;
        do{
          i++;
          bloc.add(DeleteItemEvent());
          await Desempenho.wait();
        }while(i < 100);
        await Desempenho.mostrarMediaDesempenho();
      },
      icon: Icons.delete,
      color: deleteColor,
    );
  }
}
