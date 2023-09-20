import 'package:flutter/material.dart';
import 'package:projeto_mobx_desempenho/mobx/my_store.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class LoadButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: (){
        Desempenho.reset();
        myStore.readItems();
      },
      onLongPress: ()async{
        bool finished = false;
        Desempenho.listaDesempenhos.clear();
        do{
          myStore.readItems();
          await Desempenho.wait();
          if(Desempenho.listaDesempenhos.length >= Desempenho.repeticoes){
            finished = true;
          }
        }while(!finished);
        await Desempenho.mostrarMediaDesempenho();
      },
      color: readColor,
      icon: Icons.list,
    );
  }
}


