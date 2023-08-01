import 'package:flutter/material.dart';
import '../styles.dart';

class MyButton extends StatelessWidget {

  final Function() onTap;
  final IconData icon;
  final Color color;

  const MyButton({
    required this.onTap,
    required this.icon,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color
        ),
        child: Icon(icon, color: Colors.white,),
      ),
      
    );
  }
}