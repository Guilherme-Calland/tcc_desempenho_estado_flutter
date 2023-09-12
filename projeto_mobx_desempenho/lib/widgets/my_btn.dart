import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function() onTap;
  final Function()? onLongPress;
  final Function()? onDoubleTap;
  final IconData icon;
  final Color color;

  const MyButton({
    required this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    required this.icon,
    required this.color,
    
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