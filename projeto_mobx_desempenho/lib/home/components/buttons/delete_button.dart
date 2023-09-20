import 'package:flutter/material.dart';
import 'package:projeto_mobx_desempenho/mobx/my_store.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class DeleteButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: () {
        Desempenho.reset();
        myStore.deleteItem();
      },
      onDoubleTap: (){
        myStore.recipeList.clear();
      },
      onLongPress: ()async{
        Desempenho.reset();
        int i = 0;
        do{
          i++;
          myStore.deleteItem();
          await Desempenho.wait();
        }while(i < Desempenho.repeticoes);
        await Desempenho.mostrarMediaDesempenho();
      },
      icon: Icons.delete,
      color: deleteColor,
    );
  }
}
