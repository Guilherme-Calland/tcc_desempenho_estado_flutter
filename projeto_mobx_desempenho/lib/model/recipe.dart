class Recipe{
  String? name;
  int? quantityIngredients;
  late List<String> baseIngredients;
  List<String>? measuredIngredients;
  String? howToPrepare;
  late bool done;


  Recipe({
    required this.name,
    required this.quantityIngredients,
    required this.baseIngredients,
    required this.measuredIngredients,
    required this.howToPrepare,
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
    baseIngredients = baseIngredientsList..removeAt(0);
    measuredIngredients = ((json['ingredientes'] as String?) ?? '').split(', ');
    howToPrepare = json['modoPreparo'] as String?;
    done = false;
  }
}
