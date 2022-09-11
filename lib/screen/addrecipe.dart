import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_screen/constant.dart';
import 'package:onboarding_screen/main.dart';
import 'package:onboarding_screen/model/RecipeMode.dart';
import 'package:onboarding_screen/model/addrecipemodel.dart';
import 'package:onboarding_screen/model/modeloperation.dart';

import 'package:provider/provider.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  @override
  Widget build(BuildContext context) {
    String title = "";
    String description = "";
    String procedure = "";
    String cookingTime = "";
    String servings = "";
    String calories = "";
    String ingredients = "";
    String imgPath = "";
    return Scaffold(
      // backgroundColor: konBoardingtertiary,
      backgroundColor: kgrey,
      // backgroundColor: Colors.white,

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              kBlack,
              konBoardingsecondary,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add Your Recipe Detail',
                  style: TextStyle(
                      fontFamily: font,
                      fontSize: 38,
                      color: konBoardingmain,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 30, 30, 30),
                          offset: Offset(2, 2),
                          blurRadius: 2.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          style: kcardbuttontexth2,
                          cursorColor: konBoardingmain,
                          maxLength: 30,
                          decoration: InputDecoration(
                            hoverColor: konBoardingmain,
                            filled: true,
                            fillColor: kgrey,
                            labelText: 'Title',
                            labelStyle: TextStyle(
                              color: konBoardingmain,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(30),
                            ),
                            hintText: 'Max length 30',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: kgrey),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(color: konBoardingmain),
                            // ),
                          ),
                          onChanged: (value) {
                            title = value;
                            print(title);
                          },
                        ),
                        // inputcard(
                        //     title,
                        //     30,
                        //     'Recipe title'),

                        // inputcard1(title, 200, 'Description'),
                        SizedBox(
                          height: 100,
                          child: TextField(
                            style: kcardbuttontexth2,
                            cursorColor: konBoardingmain,
                            maxLength: 200,
                            maxLines: null,
                            minLines: null,
                            expands: true,
                            decoration: InputDecoration(
                              hoverColor: konBoardingmain,
                              isDense: true,
                              filled: true,
                              fillColor: kgrey,
                              labelText: 'Description',
                              labelStyle: TextStyle(
                                color: konBoardingmain,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(30),
                              ),
                              hintText: 'Max length 200',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 75, 75, 75)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: kgrey),
                                borderRadius: new BorderRadius.circular(20),
                              ),
                              // enabledBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(color: konBoardingmain),
                              // ),
                            ),
                            onChanged: (value) {
                              description = value;
                              print(title);
                            },
                          ),
                        ),

                        // inputcard1(title, 2000, 'Procedure'),
                        SizedBox(
                          height: 100,
                          child: TextField(
                            style: kcardbuttontexth2,
                            cursorColor: konBoardingmain,
                            maxLength: 2000,
                            maxLines: null,
                            minLines: null,
                            expands: true,
                            decoration: InputDecoration(
                              hoverColor: konBoardingmain,
                              isDense: true,
                              filled: true,
                              fillColor: kgrey,
                              labelText: 'Procedure',
                              labelStyle: TextStyle(
                                color: konBoardingmain,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(30),
                              ),
                              hintText: 'Max length 2000',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 75, 75, 75)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: kgrey),
                                borderRadius: new BorderRadius.circular(20),
                              ),
                              // enabledBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(color: konBoardingmain),
                              // ),
                            ),
                            onChanged: (value) {
                              procedure = value;
                              print(title);
                            },
                          ),
                        ),
                        // inputcard(title, 100, ' Total Serving'),

                        TextField(
                          style: kcardbuttontexth2,
                           keyboardType: TextInputType.number,
                          cursorColor: konBoardingmain,
                          maxLength: 100,
                          decoration: InputDecoration(
                            hoverColor: konBoardingmain,
                            filled: true,
                            fillColor: kgrey,
                            labelText: 'Servings',
                            labelStyle: TextStyle(
                              color: konBoardingmain,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(30),
                            ),
                            hintText: 'Max length 100',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: kgrey),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(color: konBoardingmain),
                            // ),
                          ),
                          onChanged: (value) {
                            servings = value;
                            print(title);
                          },
                        ),

                        // inputcard(title, 3, 'Cooking Time in minutes'),
                        TextField(
                           keyboardType: TextInputType.number,
                          style: kcardbuttontexth2,
                          cursorColor: konBoardingmain,
                          maxLength: 3,
                          decoration: InputDecoration(
                            hoverColor: konBoardingmain,
                            filled: true,
                            fillColor: kgrey,
                            labelText: 'Cooking Time',
                            labelStyle: TextStyle(
                              color: konBoardingmain,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(30),
                            ),
                            hintText: 'Max length 3',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: kgrey),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(color: konBoardingmain),
                            // ),
                          ),
                          onChanged: (value) {
                            cookingTime = value;
                            print(title);
                          },
                        ),

                        TextField(
                          keyboardType: TextInputType.number,
                          style: kcardbuttontexth2,
                          cursorColor: konBoardingmain,
                          maxLength: 4,
                          decoration: InputDecoration(
                            hoverColor: konBoardingmain,
                            filled: true,
                            fillColor: kgrey,
                            labelText: 'Calories',
                            labelStyle: TextStyle(
                              color: konBoardingmain,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(30),
                            ),
                            hintText: 'Max length 4',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: kgrey),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(color: konBoardingmain),
                            // ),
                          ),
                          onChanged: (value) {
                            calories = value;
                            print(title);
                          },
                        ),

                        // inputcard1(ingredients, 1000, 'Ingredient'),
                        SizedBox(
                          height: 100,
                          child: TextField(
                            style: kcardbuttontexth2,
                            cursorColor: konBoardingmain,
                            maxLength: 1000,
                            maxLines: null,
                            minLines: null,
                            expands: true,
                            decoration: InputDecoration(
                              hoverColor: konBoardingmain,
                              isDense: true,
                              filled: true,
                              fillColor: kgrey,
                              labelText: 'Ingredients',
                              labelStyle: TextStyle(
                                color: konBoardingmain,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(30),
                              ),
                              hintText: 'Max length 1000',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 75, 75, 75)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: kgrey),
                                borderRadius: new BorderRadius.circular(20),
                              ),
                              // enabledBorder: UnderlineInputBorder(
                              //   borderSide: BorderSide(color: konBoardingmain),
                              // ),
                            ),
                            onChanged: (value) {
                              ingredients = value;
                              print(title);
                            },
                          ),
                        ),

                        // inputcard(imgPath, 1000, 'Image Link'),
                        TextField(
                          style: kcardbuttontexth2,
                          cursorColor: konBoardingmain,
                          maxLength: 1000,
                          decoration: InputDecoration(
                            hoverColor: konBoardingmain,
                            filled: true,
                            fillColor: kgrey,
                            labelText: 'Web Image Link',
                            labelStyle: TextStyle(
                              color: konBoardingmain,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(30),
                            ),
                            hintText: 'Max length 1000',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 75, 75, 75)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: kgrey),
                              borderRadius: new BorderRadius.circular(20),
                            ),
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(color: konBoardingmain),
                            // ),
                          ),
                          onChanged: (value) {
                            imgPath = value;
                            print(title);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            decoration: const BoxDecoration(
                                color: konBoardingsecondary,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 30, 30, 30),
                                    offset: Offset(2, 2),
                                    blurRadius: 2.0,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Center(
                                child: Text(
                              'Save Recipe',
                              style: TextStyle(
                                  fontFamily: font1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: konBoardingmain),
                            )),
                          ),
                          onTap: () {
                            // HapticFeedback.lightImpact();
                            box.add(
                              Add(
                                  title: title,
                                  description: description,
                                  procedure: procedure,
                                  calories: calories,
                                  servings: int.parse(servings),
                                  cookingtime: int.parse(cookingTime),
                                  ingredient: ingredients,
                                  imglink: imgPath),
                            );
                            
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class inputcard extends StatelessWidget {
//   inputcard(this.inputvalue, this.maxlength, this.topic);
//   int maxlength;
//   String topic;
//   String inputvalue;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       style: kcardbuttontexth2,
//       cursorColor: konBoardingmain,
//       maxLength: maxlength,
//       decoration: InputDecoration(
//         hoverColor: konBoardingmain,
//         filled: true,
//         fillColor: kgrey,
//         labelText: topic,
//         labelStyle: TextStyle(
//           color: konBoardingmain,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: new BorderSide(color: Colors.white),
//           borderRadius: new BorderRadius.circular(30),
//         ),
//         hintText: 'Max length $maxlength',
//         hintStyle: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
//         enabledBorder: UnderlineInputBorder(
//           borderSide: new BorderSide(color: kgrey),
//           borderRadius: new BorderRadius.circular(20),
//         ),
//         // enabledBorder: UnderlineInputBorder(
//         //   borderSide: BorderSide(color: konBoardingmain),
//         // ),
//       ),
//       onChanged: (value) {
//         inputvalue = value;
//         print(inputvalue);
//       },
//     );
//   }
// }

// class inputcard1 extends StatefulWidget {
//   inputcard1(this.inputvalue, this.maxlength, this.topic);
//   int maxlength;
//   String topic;
//   String inputvalue;

//   @override
//   State<inputcard1> createState() => _inputcard1State();
// }

// class _inputcard1State extends State<inputcard1> {
//   int index = 1;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: TextField(
//         keyboardType: TextInputType.multiline,
//         minLines: null,
//         maxLines: null,
//         expands: true,
//         style: kcardbuttontexth2,
//         cursorColor: konBoardingmain,
//         maxLength: widget.maxlength,
//         decoration: InputDecoration(
//           isDense: true,
//           hoverColor: konBoardingmain,

//           filled: true,
//           fillColor: kgrey,
//           labelText: widget.topic,
//           labelStyle: TextStyle(
//             color: konBoardingmain,
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: new BorderSide(color: Colors.white),
//             borderRadius: new BorderRadius.circular(30),
//           ),

//           hintText: 'Max length ${widget.maxlength}',
//           hintStyle: TextStyle(color: Color.fromARGB(255, 75, 75, 75)),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: new BorderSide(color: kgrey),
//             borderRadius: new BorderRadius.circular(20),
//           ),
//           // enabledBorder: UnderlineInputBorder(
//           //   borderSide: BorderSide(color: konBoardingmain),
//           // ),
//         ),
//         onChanged: (value) {
//           widget.inputvalue = value;
//           print(widget.inputvalue);
//         },
//       ),
//     );
//   }
// }
