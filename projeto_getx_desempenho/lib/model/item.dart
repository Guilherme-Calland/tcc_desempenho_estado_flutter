import 'dart:ui';

import 'citacao.dart';

class ItemModel{
  Color corCartao;
  Color corTextoAutor;
  Color corTextoFrase;
  Color corBorda;
  Citacao citacao;

  ItemModel({
    required this.corCartao,
    required this.corTextoAutor,
    required this.corTextoFrase,
    required this.corBorda,
    required this.citacao
  });
}