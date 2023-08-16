import 'package:flutter/material.dart';

class BaseIngredients extends StatelessWidget {
  final int quantityIngredients;
  final List<String> baseIngredients;

  const BaseIngredients({
    required this.quantityIngredients,
    required this.baseIngredients
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.receipt_rounded, color: Colors.white),
            SizedBox(width: 4,),
            Text('Ingredients ($quantityIngredients)', style: TextStyle(fontSize: 18),),
          ],
        ),
        SizedBox(height: 6), ...baseIngredients.map((ingr) => Text('* $ingr')).toList(),
      ],
    );
  }
}