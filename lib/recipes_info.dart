import 'package:flutter/material.dart';

class RecipesInfo extends StatelessWidget {

  var calories;
  var carbos;
  var description;
  var difficulty;
  var fats;
  var headline;
  var id;
  var image;
  var name;
  var proteins;
  var thumb;
  var time;

  RecipesInfo.getInfo(
      String calories,
      String carbos,
      String description,
      int difficulty,
      String fats,
      String headline,
      String id,
      String image,
      String name,
      String proteins,
      String thumb,
      String time,)
  {
    this.calories = calories;
    this.carbos = carbos;
    this.description = description;
    this.difficulty = difficulty;
    this.fats = fats;
    this.headline = headline;
    this.id = id;
    this.image = image;
    this.name = name;
    this.proteins = proteins;
    this.thumb = thumb;
    this.time = time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildMainImage(),
          buildContant(),
        ],
      ),
    );
  }

  Widget buildMainImage() => Container(
    child: Image.network(
      image,
      width: double.infinity,
      height: 160,
      fit: BoxFit.cover,
    ),
  );

  Widget buildContant() => Padding(
    padding: const EdgeInsets.fromLTRB(0,30,0,0),
    child: Column(
      children: [
        const SizedBox(height: 8,),
        Text(
          name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.orange),
        ),
        const SizedBox(height: 8,),
        Text(
          headline,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black54),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,50,0,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              recipesInfoBar(carbos, 'Carbos', Colors.pink),
              recipesInfoBar(proteins, 'Proteins', Colors.purple),
              recipesInfoBar(fats, 'Fats', Colors.blue),
              recipesInfoBar(calories, 'Calories', Colors.green),
              recipesInfoBar(time, 'Time', Colors.brown),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16,),
              Text(
                description,
                style: TextStyle(fontSize: 16, height: 1.4),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Padding recipesInfoBar(String headT, String subT, Color colorT) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,15,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            headT,
            style: TextStyle(
              color: colorT,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            subT,
            style: TextStyle(
              color: colorT,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
