
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_mobx_desempenho/mobx/my_store.dart';
import 'package:projeto_mobx_desempenho/widgets/recipe_card/item_card.dart';
import '../../model/recipe.dart';
import '../../utils/performance.dart';

class ItemList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      ListView list = ListView.builder(
        // ignore: invalid_use_of_protected_member
        itemCount: myStore.recipeList.length,
        itemBuilder: (context, index) {
          Recipe item = myStore.recipeList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RecipeCard(item),
          );
        },
      );

      Desempenho.salvarDesempenho();

      return list;
    });
  }


}