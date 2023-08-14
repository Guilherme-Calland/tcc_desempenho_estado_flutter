class Estado{
  String nome = '';
  List<String> cidades = [];

  Estado({
    required this.nome,
    required this.cidades,
  });

  Estado.fromJson(Map<String, dynamic> estado) {
    nome = estado['nome'];
    cidades = estado['cidades'];
  }
}