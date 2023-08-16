import 'package:flutter/material.dart';
import '../../my_image.dart';

class TitleImage extends StatelessWidget {
  final String name;
  final String imageUrl;

  const TitleImage({
    required this.name, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Text(name, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
          SizedBox(height: 8,),
          MyImage(imageUrl: imageUrl),
      ],
    );
  }
}