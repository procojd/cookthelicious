import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_screen/constant.dart';
import 'package:onboarding_screen/screen/recipecard.dart';
import 'package:onboarding_screen/screen/recipedetailexplore.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class explore extends StatelessWidget {
  String image;
  String search;
  String tradition;
  String title;
  explore(this.image, this.tradition, this.title, this.search);
  @override
  Widget build(BuildContext context) {
    String query = tradition;
    // query = tradition;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: konBoardingtertiary,
        body: SlidingUpPanel(
          backdropEnabled: true,
          color: konBoardingtertiary,
          minHeight: (size.height / 1.8),
          maxHeight: (size.height / 1.2),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: image,
                    child: Image(
                        width: double.infinity,
                        height: (size.height / 2) + 50,
                        image: AssetImage(image),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      CupertinoIcons.back,
                      color: kWhite,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          panel: Container(
            decoration: BoxDecoration(
              color: kgrey,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                          color: kWhite.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: font1,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: konBoardingmain),
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.amber,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("Recipes")
                                  .snapshots()
                                  .asBroadcastStream(),

                              // stream: (query != "")
                              //     ? FirebaseFirestore.instance
                              //         .collection('Recipes')
                              //         .where('title', isGreaterThanOrEqualTo: 'sushi')
                              //         .snapshots()
                              //     : FirebaseFirestore.instance
                              //         .collection('Recipes')
                              //         .snapshots(),

                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                              
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  // snapshot.data!.docs.
                                  if (snapshot.data!.docs
                                      .where((QueryDocumentSnapshot<Object?>
                                              element) =>
                                          element[search]
                                              .toString()
                                              .toLowerCase()
                                              .contains(query.toLowerCase()))
                                      .isNotEmpty) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: SlideInUp(
                                        duration: Duration(milliseconds: 100),
                                        child: ListView(children: [
                                          ...snapshot.data!.docs
                                              .where((QueryDocumentSnapshot<
                                                          Object?>
                                                      element) =>
                                                  element[search]
                                                      .toString()
                                                      .toLowerCase()
                                                      .contains(
                                                          query.toLowerCase()))
                                              .map((QueryDocumentSnapshot<
                                                          Object?>
                                                      note) =>
                                                  noteCard(() {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              recipedetail2(
                                                                  note)),
                                                    );
                                                  }, note))
                                              .toList()
                                        ]),
                                      ),
                                    );

                                    // return GridView(
                                    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    //         crossAxisCount: 2),
                                    //     children: snapshot.data!.docs.map(
                                    //       (note) => noteCard((){},note)
                                    //     ).toList());
                                  }
                                
                                return nodatacard();
                              },
                            ),
                          ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class nodatacard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideInRight(
      duration: Duration(milliseconds: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: kBlack.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.solidFileLines,
                  color: konBoardingmain,
                  size: 30,
                ),
                Center(
                    child: Text(
                  'We will adding them soooon...',
                  style: kcardbuttontexth2,
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
