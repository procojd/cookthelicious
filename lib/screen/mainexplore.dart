import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding_screen/constant.dart';
import 'package:onboarding_screen/model/traditon_model.dart';
import 'package:onboarding_screen/screen/suubexplore.dart';

class explore2 extends StatefulWidget {
  const explore2({Key? key}) : super(key: key);

  @override
  State<explore2> createState() => _explore2State();
}

class _explore2State extends State<explore2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: double.infinity,
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                kgrey,
                kBlack,
              ],
            ),
        // color: kgrey,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: Text('Type', style: kcardbuttontexth1),
              // color: Colors.amber,
            ),
          ),
          // type scroll here
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  typecard('Non-vegetarian','nonveg', 'assets/noveg.jpg'),
                  SizedBox(
                    width: 10,
                  ),
                  typecard('Vegetarian', 'vegi','assets/veg.jpg'),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          //text for tradition
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: Text('Tradition', style: kcardbuttontexth1),
              // color: Colors.amber,
            ),
          ),
          //tradition card
          Container(
            height: 400,
            padding: EdgeInsets.only(left: 32.0),
            child: Swiper(
              // autoplay: true,
              itemCount: characters.length,
              itemWidth: MediaQuery.of(context).size.width - 2 * 64,

              layout: SwiperLayout.STACK,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  activeSize: 15.0,
                  color: Colors.white24,
                  activeColor: konBoardingmain,
                ),
              ),
              itemBuilder: (context, index) {
                final character = characters[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context,a,b) => explore(character.image, character.name, character.game,'tradition'),
                      ),
                    );
                  },
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(height: 30.0),
                          Container(
                            height: 330,
                            width: 300,
                            child: Card(
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              color: konBoardingsecondary,
                              child: Container(
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                       konBoardingsecondary,
                                        konBoardingmain,
                                        
                                      ],
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28))),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 180.0),
                                      Container(
                                        height: 35,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 169, 11, 0),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Center(
                                          child: Text(
                                            characters[index].rating,
                                            style: rating,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 11.0),
                                      Text(
                                        characters[index].game,
                                        style: gameName,
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'More',
                                            style: charName,
                                            textAlign: TextAlign.left,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 20),
                                            child: Icon(FontAwesomeIcons.arrowRight,color: konBoardingmain,),
                                          ),
                                          
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(100),
                        elevation: 10,
                        child: CircleAvatar(
                          
                          backgroundImage: AssetImage(
                            characters[index].image,
                            
                            
                          ),
                          radius: 100.0,

                          //   Image.asset(
                          //   characters[index].image,
                          //   height: 320,
                          //   width: 280,
                          // )
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          //categories
          Container(),
          //categories scroll view
          Row(),
        ],
      )),
    );
  }
}

class typecard extends StatelessWidget {
  String title;
  String type;
  String image;
  typecard(this.title, this.type,this.image);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context,a,b) => explore(image, type, title,'type'),
                      ),
                    );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: kBlack, borderRadius: BorderRadius.all(Radius.circular(20))),
        height: 150,
        width: 200,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 180,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(19)),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 30,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontFamily: font1,
                          fontSize: 16,
                          color: konBoardingmain)),
                  Icon(
                    FontAwesomeIcons.arrowRight,
                    color: konBoardingmain,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
