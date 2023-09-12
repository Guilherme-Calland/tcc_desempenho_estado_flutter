import 'package:flutter/material.dart';
import 'package:projeto_mobx_desempenho/widgets/recipe_card/components/section.dart';
import '../../../utils/image_paths.dart';
import 'section_label.dart';

class BaseIngredients extends StatelessWidget {
  final int quantityIngredients;
  final List<String> baseIngredients;

  const BaseIngredients({
    required this.quantityIngredients,
    required this.baseIngredients
  });

  @override
  Widget build(BuildContext context) {
    return Section(
      sectionLabel: SectionLabel(
          text: 'Ingredientes ($quantityIngredients)',
          iconPath: MyImagePaths.ingredients,
      ), 
      elementList: baseIngredients
    );
  }
}



