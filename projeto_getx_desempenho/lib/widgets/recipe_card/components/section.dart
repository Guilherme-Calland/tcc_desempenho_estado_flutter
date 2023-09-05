import 'package:flutter/material.dart';
import 'package:projeto_getx_desempenho/widgets/recipe_card/components/section_label.dart';

class Section extends StatelessWidget {
  final SectionLabel sectionLabel;
  final List<String> elementList;
  const Section({
    required this.sectionLabel,
    required this.elementList,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionLabel,
        SizedBox(height: 6), ...elementList.map((ingr) => Text('- $ingr', style: TextStyle(color: Colors.white,),)).toList(),
      ],
    );
  }
}