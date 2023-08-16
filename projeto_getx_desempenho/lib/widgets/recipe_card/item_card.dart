import 'package:flutter/material.dart';
import 'package:projeto_getx_desempenho/model/recipe.dart';

import 'components/base_ingredients.dart';
import 'components/sections.dart';
import 'components/title_image.dart';


class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard(this.recipe);

  @override
  Widget build(BuildContext context) {

    return RecipeSectionList(
      [
        TitleImage(
          name: recipe.name ?? '',
          imageUrl: recipe.image ?? '',
        ),
        BaseIngredients(
          quantityIngredients: recipe.quantityIngredients ?? 0,
          baseIngredients: recipe.baseIngredients,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
          ],
        )
      ]
    );
  }
}



