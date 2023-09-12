import 'package:flutter/material.dart';

class RecipeTitle extends StatelessWidget {
  const RecipeTitle({
    required this.name,
    required this.done
  });

  final String name;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            name,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        SizedBox(width: 4,),
        Icon(Icons.check, color: done ? Colors.white : Colors.transparent, size: 28)       
      ],
    );
  }
}