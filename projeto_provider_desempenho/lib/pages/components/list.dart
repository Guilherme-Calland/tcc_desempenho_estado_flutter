
import 'package:flutter/material.dart';
import 'package:projeto_provider_desempenho/widgets/recipe_card/item_card.dart';
import 'package:provider/provider.dart';
import '../../controllers/item_controller.dart';
import '../../model/recipe.dart';
import '../../utils/performance.dart';

class ItemList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemController>(builder:(_, value, __) {

      ListView list = ListView.builder(
        // ignore: invalid_use_of_protected_member
        itemCount: value.recipeList.length,
        itemBuilder: (context, index) {
          Recipe item = value.recipeList[index];
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