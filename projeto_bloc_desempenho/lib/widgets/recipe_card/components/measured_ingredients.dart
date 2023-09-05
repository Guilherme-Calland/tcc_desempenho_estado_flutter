import 'package:flutter/material.dart';
import 'package:projeto_bloc_desempenho/widgets/recipe_card/components/section.dart';
import 'package:projeto_bloc_desempenho/widgets/recipe_card/components/section_label.dart';
import '../../../utils/image_paths.dart';

class MeasuredIngredients extends StatelessWidget {
  const MeasuredIngredients(this.measuredIngredients);

  final List<String> measuredIngredients;

  @override
  Widget build(BuildContext context) {
    return Section(
      sectionLabel: SectionLabel(
        iconPath: MyImagePaths.recipe,
        text: 'Medidas',
      ),
      elementList: measuredIngredients
    );
  }
}