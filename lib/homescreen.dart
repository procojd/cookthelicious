import 'dart:math';
import 'dart:ui';
// import 'package:page_transition/page_transition.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/model/RecipeMode.dart';
import 'package:onboarding_screen/model/modeloperation.dart';
import 'package:onboarding_screen/screen/addrecipe.dart';
import 'package:onboarding_screen/screen/mainexplore.dart';
import 'package:onboarding_screen/screen/testscreen.dart';
import 'package:onboarding_screen/screen/yourrecipemain.dart';
import 'constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: konBoardingsecondary,
        elevation: 0,
      ),
      drawer: Stack(children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: const SizedBox.expand(),
        ),
        Drawer(
          backgroundColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Container(
            color: konBoardingsecondary.withOpacity(0.4),
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  // decoration: BoxDecoration(
                  //   color: kgrey,
                  // ),

                  child: Center(
                      child: Text(
                    'Settings',
                    style: TextStyle(
                        fontFamily: font,
                        fontSize: 40,
                        color: kWhite,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                Container(
                  height: 2,
                  color: kWhite.withOpacity(0.2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const Text(
                      'Profile',
                      style: kcardbuttontexth3,
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const Text(
                      'Close',
                      style: kcardbuttontexth3,
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      backgroundColor: kgrey,
      body: SafeArea(
        
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                konBoardingsecondary,
                konBoardingmain,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                // color: Colors.blueGrey,
                padding: EdgeInsets.all(10),
                // padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
                // height: 100.0,
                // color: Colors.amber,
                // color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, Chef',
                      style: TextStyle(
                          fontSize: 40,
                          color: konBoardingmain,
                          fontFamily: font1,
                          fontWeight: f2),
                    ),
                    Text(
                      'so what are you cooking today?',
                      style: TextStyle(
                          fontSize: 24,
                          color: konBoardingmain,
                          fontFamily: font1,
                          fontWeight: f1),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: konBoardingtertiary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  child: DefaultTabController(
                    
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: <Widget>[
                        // SizedBox(height: 20),
                        TabBar(
                          tabs: [
                            Tab(
                              text: "YOUR RECIPE",
                            ),
                            Tab(
                              text: "EXPLORE",
                            ),
                            // Tab(
                            //   text: "FAVOURITES",
                            // ),
                          ],
                          labelStyle: TextStyle(
                              fontSize: 12, fontFamily: font1, fontWeight: f1),
                          labelColor: konBoardingmain,
                          unselectedLabelColor: kWhite,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            
                              borderRadius: BorderRadius.circular(25),
                              color: kgrey),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          height: 30,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          decoration: const BoxDecoration(
                            color: kgrey,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Want to add your recipe?',
                                  style: kcardbuttontexth2),
                              GestureDetector(
                                child: Icon(
                                  FontAwesomeIcons.solidSquarePlus,
                                  color: kWhite,
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
                        ),
                        Expanded(
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              yrlist(),
                              // yourRecipe(),

                              explore2(),
                              // Container(),
                            ],
                          ),
                        ),
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
