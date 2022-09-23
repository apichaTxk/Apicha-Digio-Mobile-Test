import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'recipes_info.dart';
import 'model/recipes_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ShowRecipesList(),
    );
  }
}

class ShowRecipesList extends StatefulWidget {
  const ShowRecipesList({Key? key}) : super(key: key);

  @override
  State<ShowRecipesList> createState() => _ShowRecipesListState();
}

class _ShowRecipesListState extends State<ShowRecipesList> {

  //SqliteManage oDB = SqliteManage();
  var click = [false,false,false,false,false,false,false,false,false,false,false];

  Future<List<Recipes>> recipesFuture = getRecipes();

  static Future<List<Recipes>> getRecipes() async{
    const url = "https://hf-android-app.s3-eu-west-1."
        "amazonaws.com/android-test/recipes.json";
    final response = await Http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Recipes>(Recipes.fromJson).toList();
  }

  // void InsertRecipesData() async{
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withAlpha(200),
        elevation: 0,
        centerTitle: true,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent,),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black54,
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black54,
            onPressed: (){},
          ),
        ],
        title: Text(
          "R E C I P E S",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Recipes>>(
          future: recipesFuture,
          builder: (context, snapshot){
            if(snapshot.hasData){
              final recipes = snapshot.data!;
              return buildRecipes(recipes);
            }else{
              return const Text('No user data.');
            }
          },
        ),
      ),
    );
  }
  Widget buildRecipes(List<Recipes> recipes) => ListView.builder(
    itemCount: recipes.length,
    itemBuilder: (context, index){
      final rec = recipes[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),

        child: Card(
          shadowColor: Colors.grey,
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          child: Container(
            height: 100,
            alignment: Alignment.center,

            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(rec.thumb),
              ),
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,5),
                child: Text(
                  rec.name,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              subtitle: Text(
                rec.headline,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Wrap(
                children: <Widget>[
                  IconButton(
                    icon: Icon((click[index] == true) ? Icons.star : Icons.star_border,
                      size: 33, color: Colors.grey,),
                    onPressed: (){
                      setState(() {
                        click[index] = !click[index];
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, size: 20 ,color: Colors.grey,),
                    onPressed: (){
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new RecipesInfo.getInfo(
                            rec.calories,
                            rec.carbos,
                            rec.description,
                            rec.difficulty,
                            rec.fats,
                            rec.headline,
                            rec.id,
                            rec.image,
                            rec.name,
                            rec.proteins,
                            rec.thumb,
                            rec.time,
                          ),
                        ),
                      ).then((value){
                        setState(() {});
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}