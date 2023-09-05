import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/blocs/bloc/event.dart';
import 'package:projeto_bloc_desempenho/main.dart';
import '../../../../styles.dart';
import '../../../../utils/performance.dart';
import '../../../../widgets/my_btn.dart';

class LoadButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () => bloc.add(ReadItemEvent()),
      onLongPress: ()async{
        int i = 0;
        Desempenho.listaDesempenhos.clear();
        do{
          i++;
          bloc.add(ReadItemEvent());
        }while(i > 100);
        await Desempenho.mostrarMediaDesempenho();
      },
      color: readColor,
      icon: Icons.list,
    );
  }
}


