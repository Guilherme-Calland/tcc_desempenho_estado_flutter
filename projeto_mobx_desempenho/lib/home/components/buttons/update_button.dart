import 'package:flutter/material.dart';
import 'package:projeto_mobx_desempenho/mobx/my_store.dart';
import 'package:projeto_mobx_desempenho/model/recipe.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class UpdateButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onTap: (){
        Desempenho.reset();
        myStore.updateItem();
      },
      onLongPress: ()async{
        Desempenho.reset();
        do{
          await Desempenho.wait();
          myStore.updateItem();
        }while((){
          bool updated = false;
          myStore.recipeList.cast<Recipe>().forEach((element) {
            if(!element.done && !updated){
              updated = true;
              element.done = true;
            }
          });
          return updated;
        }());
        await Desempenho.mostrarMediaDesempenho();
      },
      color: editColor,
      icon: Icons.edit,
    );
  }
}


