import 'package:flutter/material.dart';
import 'package:projeto_getx_desempenho/model/estado.dart';


class ItemCard extends StatelessWidget {
  final Estado estado;

  const ItemCard(this.estado);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 4, color: Colors.white),
      ), 
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(estado.nome, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text(
            'Cidades: ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
            Text((){
              String texto = '';
              List<String> cidades = estado.cidades; 
              for(int i = 0; i < cidades.length; i++){
                texto += cidades[i];
                if(i < cidades.length - 1){
                  texto += ', ';
                }
              }
              return texto;
            }(), style: TextStyle(color: Colors.white, fontSize: 12,), overflow: TextOverflow.ellipsis,maxLines: 6,),
          ],
        ),
    );
  }
}