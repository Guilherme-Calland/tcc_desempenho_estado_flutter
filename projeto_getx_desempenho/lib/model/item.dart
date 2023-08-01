import 'dart:ui';
import 'estado.dart';

class ItemModel{
  Color corCartao;
  Color corTextoAutor;
  Color corTextoFrase;
  Color corBorda;
  Estado estado;

  ItemModel({
    required this.corCartao,
    required this.corTextoAutor,
    required this.corTextoFrase,
    required this.corBorda,
    required this.estado
  });
}