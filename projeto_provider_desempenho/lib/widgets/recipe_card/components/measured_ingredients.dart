import 'package:flutter/material.dart';
import '../../../utils/image_paths.dart';
import 'section.dart';
import 'section_label.dart';

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