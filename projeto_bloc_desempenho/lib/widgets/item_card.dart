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
            Text(item.estado.nome, style: TextStyle(color: item.corTextoAutor, fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text(
            'Cidades: ',
            style: TextStyle(
              color: item.corTextoFrase,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
            Text((){
              String texto = '';
              List<String> cidades = item.estado.cidades; 
              for(int i = 0; i < cidades.length; i++){
                texto += cidades[i];
                if(i < cidades.length - 1){
                  texto += ', ';
                }
              }
              return texto;
            }(), style: TextStyle(color: item.corTextoFrase, fontSize: 12,), overflow: TextOverflow.ellipsis,maxLines: 6,),
          ],
        ),
    );
  }
}