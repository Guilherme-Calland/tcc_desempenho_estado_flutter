import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/blocs/bloc/event.dart';
import 'package:projeto_bloc_desempenho/main.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class UpdateButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: (){
        Desempenho.reset();
        bloc.add(UpdateItemEvent());
      },
      onLongPress: ()async{
        Desempenho.reset();
        int i = 0;
        do{
          i++;
          bloc.add(UpdateItemEvent());
          await Desempenho.wait();
        }while(i < Desempenho.repeticoes);

        await Desempenho.mostrarMediaDesempenho();
      },
      color: editColor,
      icon: Icons.edit,
    );
  }
}


