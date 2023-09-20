
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_getx_desempenho/model/recipe.dart';
import 'package:projeto_getx_desempenho/utils/performance.dart';

import '../../controllers/item_controller.dart';
import '../../widgets/recipe_card/item_card.dart';

class ItemList extends StatelessWidget {

  const ItemList();

  @override
  Widget build(BuildContext context) {
    final recipeController = Get.find<RecipeController>();

    return Obx(() {
      ListView list = ListView.builder(
        // ignore: invalid_use_of_protected_member
        itemCount: recipeController.recipeList.value.length,
        itemBuilder: (context, index) {
          Recipe recipe = recipeController.recipeList[index];
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RecipeCard(recipe),
          );
        },
      );

      Desempenho.salvarDesempenho();

      return list;
    });
  }


}