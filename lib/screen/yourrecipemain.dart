import 'dart:io';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onboarding_screen/constant.dart';
import 'package:onboarding_screen/model/RecipeMode.dart';
import 'package:onboarding_screen/model/addrecipemodel.dart';
import 'package:onboarding_screen/model/modeloperation.dart';
import 'package:onboarding_screen/screen/addrecipe.dart';
import 'package:onboarding_screen/screen/recipedetailexplore.dart';
import 'package:onboarding_screen/screen/testscreen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:onboarding_screen/screen/recipedetailmain.dart';

late Box box;

// ignore: camel_case_types
class yrlist extends StatefulWidget {
  @override
  State<yrlist> createState() => _yrlistState();
}

class _yrlistState extends State<yrlist> {
  int cardborder = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
          
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: const BoxDecoration(
            color: kgrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
             
              
            ),
          ),
          child: ValueListenableBuilder<Box<Add>>(
            valueListenable: Hive.box<Add>("addrec").listenable(),
            builder: (context, box, _) {
              if(box.values.isEmpty){
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
                                          color: kWhite,
                                          size: 30,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddRecipe()));
                                        },
                                      )
                                    ],
                                  ),
                                )),
                              ),
                            );}
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  
                  Expanded(
                      child: ListView.builder(
                          itemCount: box.values.length,
                          itemBuilder: ((context, index) {
                            Add currentrecipe = box.getAt(index)!;
        
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Recipedetail(recipe: currentrecipe)),
                              ),
                              child: RecipeCard(
                                recipe: currentrecipe,
                                index: index,
                              ),
                            );
                          })))
                ],
              );
            },
          ),
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: konBoardingtertiary,
    //   body: Container(
    //     margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    //     height: double.infinity,
    //     padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
    //     decoration: const BoxDecoration(
    //       color: kgrey,
    //       borderRadius: BorderRadius.only(
    //         topRight: Radius.circular(25),
    //         topLeft: Radius.circular(25),
    //       ),
    //     ),
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: <Widget>[
    //           const SizedBox(
    //             height: 5,
    //           ),

    //           // Consumer<ModelOperation>(
    //           //   builder: (context, ModelOperation data, child) {
    //           //     if (data.getRecipe.length != 0) {
    //           //       return ListView.builder(
    //           //         scrollDirection: Axis.vertical,
    //           //         physics: ScrollPhysics(),
    //           //         shrinkWrap: true,
    //           //         itemCount: data.getRecipe.length,
    //           //         itemBuilder: (BuildContext context, int index) {
    //           //           return Padding(
    //           //             padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
    //           //             child: GestureDetector(
    //           //               onTap: () => Navigator.push(
    //           //                 context,
    //           //                 MaterialPageRoute(
    //           //                   builder: (context) => Recipedetail(
    //           //                       recipeModel: data.getRecipe[index]),
    //           //                 ),
    //           //               ),
    //           //               child:
    //           //                   RecipeCard(recipeModel: data.getRecipe[index]),
    //           //             ),
    //           //           );
    //           //         },
    //           //       );
    //           //     } else {
    //           //       return Padding(
    //           //         padding: const EdgeInsets.all(20.0),
    //           //         child: Container(
    //           //           height: 100,
    //           //           decoration: BoxDecoration(
    //           //               color: Colors.black.withOpacity(0.3),
    //           //               borderRadius: BorderRadius.circular(20)),
    //           //           child: Center(
    //           //               child: Padding(
    //           //             padding: const EdgeInsets.all(8.0),
    //           //             child: Column(
    //           //               children: [
    //           //                 Text(
    //           //                   'No Items Added',
    //           //                   style: kcardbuttontexth2,
    //           //                 ),
    //           //                 SizedBox(
    //           //                   height: 5,
    //           //                 ),
    //           //                 Text(
    //           //                   'Add Items',
    //           //                   style: kcardbuttontexth1,
    //           //                 ),
    //           //                 SizedBox(
    //           //                   height: 5,
    //           //                 ),
    //           //                 GestureDetector(
    //           //                   child: Icon(
    //           //                     FontAwesomeIcons.solidSquarePlus,
    //           //                     color: konBoardingmain,
    //           //                     size: 30,
    //           //                   ),
    //           //                   onTap: () {
    //           //                     Navigator.push(
    //           //                         context,
    //           //                         MaterialPageRoute(
    //           //                             builder: (context) => AddRecipe()));
    //           //                   },
    //           //                 )
    //           //               ],
    //           //             ),
    //           //           )),
    //           //         ),
    //           //       );
    //           //     }
    //           //   },
    //           // ),
    //           const SizedBox(
    //             height: 5,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class RecipeCard extends StatefulWidget {
  Add recipe;
  int index;
  // final RecipeModel recipeModel;

  RecipeCard({required this.recipe, required this.index});

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
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            widget.recipe.imglink!, // this image doesn't exist
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: kgrey,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Text(
                                    'Enter correct Link OR check network connection',
                                    style: kcardbuttontexth2,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // child: Image(
                        //     width: 100,
                        //     height: 100,
                        //     Image.network(src)
                        //     // image: NetworkImage(widget.recipe.imglink!,

                        //     // ),

                        //     // image: AssetImage(widget.recipeModel.imgPath),
                        //     fit: BoxFit.cover),
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
                                  Text(widget.recipe.title!,
                                      style: kcardbuttontexth1),
                                ],
                              ),
                            ),
                            Container(
                              // color: Colors.red,
                              height: 18,

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
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
                                        widget.recipe.servings!.toString(),
                                        style: kcardbuttontexth2,
                                      ),
                                    ],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            widget.recipe.cookingtime!
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
                                  // SizedBox(
                                  //   width: 10,
                                  // ),
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
                                  GestureDetector(
                                    onTap: () {
                                      AudioPlayer().play(
                                          AssetSource('/audio/click.mp3'));
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return CustomDialog(
                                              title: "Delete",
                                              content:
                                                  "Are you sure to delete this recipe?.",
                                              positiveBtnText: "Done",
                                              negativeBtnText: "Cancel",
                                              positiveBtnPressed: () {
                                                widget.recipe.delete();
                                                Navigator.of(context).pop();
                                              },
                                            );
                                          });
                                    },
                                    child: CircleAvatar(
                                      maxRadius: 15,
                                      backgroundColor: kgrey,
                                      child: Icon(
                                        FontAwesomeIcons.trashCan,
                                        color: kWhite,
                                        size: 16,
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
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title, content, positiveBtnText, negativeBtnText;
  final GestureTapCallback positiveBtnPressed;

  CustomDialog({
    required this.title,
    required this.content,
    required this.positiveBtnText,
    required this.negativeBtnText,
    required this.positiveBtnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          SlideInUp(
            duration: Duration(milliseconds: 100),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  // Bottom rectangular box
                  // margin:
                  //     EdgeInsets.only(top: 40), // to push the box half way below circle
                  decoration: BoxDecoration(
                    color: kWhite.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.only(
                      top: 20, left: 20, right: 20), // spacing inside the box
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: konBoardingsecondary,
                        // Top Circle with icon
                        maxRadius: 20.0,
                        child: Icon(
                          Icons.delete,
                          color: kWhite,
                        ),
                      ),
                      Text(
                        title,
                        style: kcardbuttontexth1,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        content,
                        style: kcardbuttontexth2,
                        textAlign: TextAlign.center,
                      ),
                      ButtonBar(
                        buttonMinWidth: 100,
                        alignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            child: Text(
                              negativeBtnText,
                              style: TextStyle(fontFamily: font, fontSize: 15),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          FlatButton(
                            textColor: Colors.red,
                            child: Text(
                              positiveBtnText,
                              style: TextStyle(fontFamily: font, fontSize: 15),
                            ),
                            onPressed: positiveBtnPressed,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // CircleAvatar(
          //   // Top Circle with icon
          //   maxRadius: 40.0,
          //   child: Icon(Icons.delete),
          // ),
        ],
      ),
    );
  }
}
