import 'package:flutter/material.dart';
import 'package:onboarding_screen/model/RecipeMode.dart';

class ModelOperation extends ChangeNotifier {
  final List<RecipeModel> _recipe = [];
  int index = 0;

  List<RecipeModel> get getRecipe {
    return _recipe;
  }

  // ModelOperation() {
  //   addNewRecipe(
  //       'Seazling sauce with white pasta',
  //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
  //       'nothing',
  //       22,
  //       3,
  //       '220',
  //       'hello',
  //       'https://www.seriouseats.com/thmb/GbW_6_JH2knqyCa-VbbOwwy_g5Y=/1500x1125/filters:fill(auto,1)/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__2021__02__20210204-quattro-formaggi-four-cheese-pasta-sauce-daniel-gritzer-7-598e2a8f8a5349d3aef56f683b1369b6.jpg');
  // }

  void addNewRecipe(
    String title,
    String description,
    String procedure,
    int cookingTime,
    int servings,
    String calories,
    String ingredients,
    String imgPath,
  ) {
    RecipeModel recipes = RecipeModel(
        title: title,
        description: description,
        procedure: procedure,
        cookingTime: cookingTime,
        servings: servings,
        calories: calories,
        imgPath: imgPath,
        ingredients: ingredients);

    _recipe.add(recipes);
    notifyListeners();
  }
}
