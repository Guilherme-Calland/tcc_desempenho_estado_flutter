import 'package:flutter/material.dart';
import 'package:projeto_provider_desempenho/model/recipe.dart';
import '../../../controllers/item_controller.dart';
import '../../../styles.dart';
import '../../../utils/performance.dart';
import '../../../widgets/my_btn.dart';

class UpdateButton extends StatelessWidget {

  const UpdateButton();

  @override
  Widget build(BuildContext context) {

    ItemController itemProvider = ItemController.getProvider(context);

    return MyButton(
      onTap: (){
        Desempenho.reset();
        itemProvider.updateItem();
      },
      onLongPress: ()async{
        Desempenho.reset();
        do{
          await Desempenho.wait();
          itemProvider.updateItem();
        }while((){
          bool containsNotUpdated = false;
          itemProvider.recipeList.cast<Recipe>().forEach((element) {
            if(!element.done && !containsNotUpdated){
              containsNotUpdated = true;
              element.done = true;
            }
          });
          return containsNotUpdated;
        }());
        await Desempenho.mostrarMediaDesempenho();
      },
      color: editColor,
      icon: Icons.edit,
    );
  }
}


