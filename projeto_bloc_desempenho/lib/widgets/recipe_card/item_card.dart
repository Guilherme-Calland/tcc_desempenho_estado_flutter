import 'package:flutter/material.dart';

import '../../model/recipe.dart';
import '../../utils/image_paths.dart';
import 'components/base_ingredients.dart';
import 'components/measured_ingredients.dart';
import 'components/section.dart';
import 'components/section_label.dart';
import 'components/sections.dart';
import 'components/title.dart';


class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard(this.recipe);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RecipeSectionList(
          [
            RecipeTitle(             
              name: recipe.name ?? '',
              done: recipe.done,
            ),
            BaseIngredients(
              quantityIngredients: recipe.quantityIngredients ?? 0,
              baseIngredients: recipe.baseIngredients,
            ),
            MeasuredIngredients(recipe.measuredIngredients ?? []),
            Section(
              sectionLabel: SectionLabel(iconPath: MyImagePaths.howTo, text: 'Como preparar'),
              elementList: [recipe.howToPrepare ?? ''],
            ),
          ]
        ),
      ],
    );
  }
}



