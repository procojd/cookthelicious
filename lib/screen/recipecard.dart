import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_screen/constant.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: <Widget>[
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 125,
                decoration: const BoxDecoration(
                    color: konBoardingtertiary,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 30, 30, 30),
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
                            image: NetworkImage(doc["imagelink"]),

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
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  // color: Colors.amber,
                                  child: Text(doc["title"], style: kcardbuttontexth1),
                                ),
                                Container(
                              alignment: Alignment.topLeft,
                              // color: Colors.amber,
                              child: Text(doc["description"], style: kcardbuttontexth2,overflow: TextOverflow.ellipsis,),
                            ),
                              ],
                            ),
                            
                            Container(
                              // color: Colors.red,
                              // height: 18,

                              child: Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.bowlFood,
                                    color: kWhite,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'servings : ',
                                    style: kcardbuttontexth2,
                                  ),
                                  Text(
                                    doc["serving"].toString(),
                                    style: kcardbuttontexth2,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  vegicon(icon: doc["type"])
                                
                                ],
                              ),
                            ),
                            
                            Container(
                              // color: Colors.brown,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 25,
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
                                            doc["cookingtime"].toString(),
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
                                    height: 25,
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
        SizedBox(
          height: 10,
        )
      ],
    ),
  );
}

class vegicon extends StatelessWidget {
String icon;
vegicon({required this.icon});
  @override
  Widget build(BuildContext context) {
    if(
      icon=="vegi"
    )
    {
      return const Icon(CupertinoIcons.dot_square ,color: Colors.green,size: 20,);
    }
    else
    return Icon(CupertinoIcons.dot_square ,color:Colors.red,size: 20,);
  }
}
