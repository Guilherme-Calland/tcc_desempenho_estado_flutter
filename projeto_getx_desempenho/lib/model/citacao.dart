class Citacao{
  int? id;
  String? autor;
  String? frase;

  Citacao({
    required this.id,
    required this.autor,
    required this.frase,
  });

  Citacao.fromJson(Map<String, dynamic> json){
    id = (json['id'] as int?) ?? 0;
    autor = (json['autor'] as String? ?? '');
    frase = (json['frase'] as String?) ?? '';
  }
}