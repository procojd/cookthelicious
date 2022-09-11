import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:onboarding_screen/constant.dart';
import 'package:onboarding_screen/model/RecipeMode.dart';
import 'package:onboarding_screen/model/modeloperation.dart';
import 'package:onboarding_screen/screen/addrecipe.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:onboarding_screen/screen/recipedetailmain.dart';

late Box box;

// ignore: camel_case_types
class yourRecipe extends StatefulWidget {
  @override
  State<yourRecipe> createState() => _yourRecipeState();
}

class _yourRecipeState extends State<yourRecipe> {
  int cardborder = 10;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: konBoardingtertiary,
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        decoration: const BoxDecoration(
          color: kgrey,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              Consumer<ModelOperation>(
                builder: (context, ModelOperation data, child) {
                  if (data.getRecipe.length != 0) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.getRecipe.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: GestureDetector(
                            // onTap: () => Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Recipedetail(
                            //         recipeModel: data.getRecipe[index]),
                            //   ),
                            // ),
                            child:
                                RecipeCard(recipeModel: data.getRecipe[index]),
                          ),
                        );
                      },
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'No Items Added',
                                style: kcardbuttontexth2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Add Items',
                                style: kcardbuttontexth1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.solidSquarePlus,
                                  color: konBoardingmain,
                                  size: 30,
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddRecipe()));
                                },
                              )
                            ],
                          ),
                        )),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeCard extends StatefulWidget {
  final RecipeModel recipeModel;

  RecipeCard({required this.recipeModel});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 120,
                decoration: const BoxDecoration(
                    color: konBoardingtertiary,
                    boxShadow: [
                      BoxShadow(
                        color: konBoardingtertiary,
                        offset: Offset(2, 2),
                        blurRadius: 2.0,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Image(
                            width: 100,
                            height: 100,
                            image: NetworkImage(widget.recipeModel.imgPath),

                            // image: AssetImage(widget.recipeModel.imgPath),
                            fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              // color: Colors.amber,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(widget.recipeModel.title,
                                      style: kcardbuttontexth1),
                                ],
                              ),
                            ),
                            Container(
                              // color: Colors.red,
                              height: 18,

                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.bowlFood,
                                    color: kWhite,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'servings : ',
                                    style: kcardbuttontexth2,
                                  ),
                                  Text(
                                    widget.recipeModel.servings.toString(),
                                    style: kcardbuttontexth2,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              // color: Colors.brown,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 28,
                                    decoration: const BoxDecoration(
                                        color: konBoardingmain,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.stopwatch,
                                            color: konBoardingsecondary,
                                            size: 20,
                                          ),
                                          Text(
                                            widget.recipeModel.cookingTime
                                                .toString(),
                                            style: kcardbuttontext,
                                          ),
                                          Text(
                                            'min',
                                            style: kcardbuttontext,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: konBoardingmain,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(2, 4, 2, 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            child: Text(
                                              'Cook Now',
                                              style: kcardbuttontext,
                                            ),
                                            // onTap: () async {
                                            //   String url =
                                            //       "https://www.google.com";
                                            //   // ignore: deprecated_member_use
                                            //   var urllaunchable = await canLaunch(
                                            //       url); //canLaunch is from url_launcher package
                                            //   if (urllaunchable) {
                                            //     // ignore: deprecated_member_use
                                            //     await launch(
                                            //         url); //launch is from url_launcher package to launch URL
                                            //   } else {
                                            //     print("URL can't be launched.");
                                            //   }

                                            // },
                                          ),
                                          Icon(
                                            FontAwesomeIcons.arrowRight,
                                            color: konBoardingsecondary,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
