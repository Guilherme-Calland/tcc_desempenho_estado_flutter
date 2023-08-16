class Recipe{
  String? name;
  int? quantityIngredients;
  late List<String> baseIngredients;
  List<String>? measuredIngredients;
  String? howToPrepare;
  String? image;
  late bool done;


  Recipe({
    required this.name,
    required this.quantityIngredients,
    required this.baseIngredients,
    required this.measuredIngredients,
    required this.howToPrepare,
    required this.image,
    this.done = false
  });

  Recipe.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> baseIngr = json['ingredientesBase'];
    List<String> baseIngredientsList = [];
    baseIngr.forEach((key, value){
      baseIngredientsList.add(value);
    });

    name = json['receita'] as String?;
    quantityIngredients = int.parse(baseIngr['0']);
    baseIngredients = baseIngredientsList;
    measuredIngredients = ((json['ingredients'] as String?) ?? '').split(', ');
    howToPrepare = json['modoPreparo'];
    image = json['link_imagem'];
    done = false;
  }
}
