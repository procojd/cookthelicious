import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_screen/model/RecipeMode.dart';
import 'package:onboarding_screen/model/addrecipemodel.dart';
import 'package:onboarding_screen/screen/recipedetailexplore.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:onboarding_screen/constant.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Recipedetail extends StatefulWidget {
  // RecipeModel recipeModel;
  Add recipe;
  Recipedetail({required this.recipe});

  @override
  State<Recipedetail> createState() => _RecipedetailState();
}

class _RecipedetailState extends State<Recipedetail> {
  @override
  Widget build(BuildContext context) {
    String? title = widget.recipe.title;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          child: BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: SpeedDial(
              // icon: FontAwesomeIcons.utensils,
              animatedIcon: AnimatedIcons.menu_arrow,

              buttonSize: Size(
                80,
                50,
              ),
              overlayColor: konBoardingtertiary,
              overlayOpacity: 0.4,
              label: Text(
                'Order',
                style: kcardbuttontexth2,
              ),
              backgroundColor: konBoardingmain.withOpacity(0.3),

              children: [
                SpeedDialChild(
                  child: const Icon(
                    FontAwesomeIcons.s,
                    color: konBoardingmain,
                  ),
                  label: 'Swiggy',
                  labelStyle: kcardbuttontext,
                  labelBackgroundColor: konBoardingmain,
                  backgroundColor: konBoardingsecondary,
                  onTap: () {
                    /* Do someting */
                    _launchURL(title!);
                  },
                ),
                SpeedDialChild(
                  child: const Icon(
                    FontAwesomeIcons.z,
                    color: konBoardingmain,
                  ),
                  label: 'Zomato',
                  labelStyle: kcardbuttontext,
                  labelBackgroundColor: konBoardingmain,
                  backgroundColor: konBoardingsecondary,
                  onTap: () {
                    /* Do someting */
                    _launchURL1(title!);
                  },
                ),
              ],
            ),
            // child: FloatingActionButton.extended(
            //   extendedTextStyle: TextStyle(letterSpacing: 0),
            //   elevation: 0.3,
            //   backgroundColor: konBoardingtertiary.withOpacity(0.3),
            //   onPressed: () {
            //     _launchURL(title);
            //   },
            //   label: const Text(
            //     'Order Now',
            //     style: kcardbuttontexth3,
            //   ),

            // ),
          ),
        ),
      ),
      backgroundColor: konBoardingtertiary,
      body: SlidingUpPanel(
        backdropEnabled: true,
        color: konBoardingtertiary,
        minHeight: (size.height / 2),
        maxHeight: (size.height / 1.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          
        ),
        parallaxEnabled: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: widget.recipe.imglink!,
                 child: SizedBox(
                  width: double.infinity,
                  height: (size.height / 2) + 50,
                   child: Image.network(
                                    widget.recipe.imglink!, // this image doesn't exist
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: kgrey,
                                        
                                        child: Image.asset('assets/error.jpg',fit: BoxFit.cover,)
                                      );
                                    },
                                  ),
                 ),
                  // child: Image(
                  //     width: double.infinity,
                  //     height: (size.height / 2) + 50,
                  //     image: NetworkImage(widget.recipe.imglink!,),
                  //     fit: BoxFit.cover),
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
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                kBlack,
                konBoardingsecondary,
              ],
            ),
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
                  height: 28,
                ),
                Text(
                  widget.recipe.title!,
                  style: TextStyle(
                    color: kWhite,
                    fontFamily: font1,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kgrey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        FontAwesomeIcons.heartCircleCheck,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.recipe.calories!,
                        style: kcardbuttontexth2,
                        // style: _textTheme.caption,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.stopwatch,
                        color: kWhite,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.recipe.cookingtime!.toString() + '\'',
                        style: kcardbuttontexth2,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 2,
                        height: 30,
                        color: kWhite,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.recipe.servings!.toString() + ' Servings',
                        style: kcardbuttontexth2,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse(
                            'https://www.youtube.com/results?search_query=$title'),
                        builder: (context, followLink) {
                          return GestureDetector(
                            onTap: followLink,
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 1, 4, 1),
                                child: Row(children: [
                                  Icon(
                                    FontAwesomeIcons.youtube,
                                    color: kWhite,
                                    size: 20,
                                  ),
                                  Text(
                                    '  Watch',
                                    style: kcardbuttontexth2,
                                  ),
                                ]),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.white.withOpacity(0.3),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: konBoardingsecondary),
                          child: TabBar(
                            isScrollable: true,
                            indicatorColor: Colors.red,
                            tabs: [
                              Tab(
                                text: "Description".toUpperCase(),
                              ),
                              Tab(
                                text: "Ingredients".toUpperCase(),
                              ),
                              Tab(
                                text: "Preparation".toUpperCase(),
                              ),
                            ],
                            labelColor: kWhite,
                            indicator: DotIndicator(
                              color: konBoardingmain,
                              distanceFromCenter: 16,
                              radius: 3,
                              paintingStyle: PaintingStyle.fill,
                            ),
                            unselectedLabelColor: Colors.white.withOpacity(0.2),
                            labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                fontFamily: font1),
                            labelPadding: EdgeInsets.symmetric(
                              horizontal: 32,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              detailtab(
                                  content: widget.recipe.description!,
                                  ),
                              detailtab(
                                  content: widget.recipe.ingredient!,
                                  ),
                              detailtab(
                                  content: widget.recipe.procedure!,
                                  ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void launch(String url) {
    launch(url);
  }
}

_launchURL(String title) async {
  String url = 'https://www.google.com/search?query=swiggy+$title';

  if (await canLaunch(url)) {
    LinkTarget.blank;
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL1(String title) async {
  String url = 'https://www.google.com/search?query=zomato+$title';

  if (await canLaunch(url)) {
    LinkTarget.blank;
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class detailtab extends StatelessWidget {
  detailtab({required this.content});
  final String content;
 
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kgrey,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(15),
      child: FadingEdgeScrollView.fromSingleChildScrollView(
        child: SingleChildScrollView(
            controller: controller,
            child: FadeInUp(
              duration: Duration(milliseconds: 300),
              child: Text(
                content,
                style: kcardbuttontexth3,
              ),
            )),
      ),
    );
  }
}
