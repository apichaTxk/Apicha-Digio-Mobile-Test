class Recipes{
  final String calories;
  final String carbos;
  final String description;
  final int difficulty;
  final String fats;
  final String headline;
  final String id;
  final String image;
  final String name;
  final String proteins;
  final String thumb;
  final String time;

  const Recipes({
    required this.calories,
    required this.carbos,
    required this.description,
    required this.difficulty,
    required this.fats,
    required this.headline,
    required this.id,
    required this.image,
    required this.name,
    required this.proteins,
    required this.thumb,
    required this.time,
  });

  static Recipes fromJson(json) => Recipes(
      calories: json['calories'],
      carbos: json['carbos'],
      description: json['description'],
      difficulty: json['difficulty'],
      fats: json['fats'],
      headline: json['headline'],
      id: json['id'],
      image: json['image'],
      name: json['name'],
      proteins: json['proteins'],
      thumb: json['thumb'],
      time: json['time']
  );
}