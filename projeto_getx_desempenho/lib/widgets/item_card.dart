import 'package:flutter/material.dart';

import '../model/item.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;

  const ItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item.corCartao,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 4, color: item.corBorda),
      ), 
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.citacao.autor ?? '', style: TextStyle(color: item.corTextoAutor, fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text(item.citacao.frase ?? '', style: TextStyle(color: item.corTextoFrase, fontSize: 12),)
          ],
        ),
    );
  }
}