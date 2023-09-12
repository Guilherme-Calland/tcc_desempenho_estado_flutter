import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function() onTap;
  final Function()? onLongPress;
  final IconData icon;
  final Color color;
  final Function()? onDoubleTap;

  const MyButton({
    required this.onTap,
    this.onLongPress,
    required this.icon,
    required this.color,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
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