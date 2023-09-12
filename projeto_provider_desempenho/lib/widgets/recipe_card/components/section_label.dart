import 'package:flutter/material.dart';

import '../../../utils/svg_utils.dart';

class SectionLabel extends StatelessWidget {

  final String text;
  final String iconPath;

  const SectionLabel({
    required this.iconPath,
    required this.text
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgUtils.getSvgImage(iconPath, color: Colors.white, size: 24),
        SizedBox(width: 8,),
        Text(text, style: TextStyle(fontSize: 18, color: Colors.white), ),
      ],
    );
  }
}