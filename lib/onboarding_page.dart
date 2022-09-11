import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboarding_screen/constant.dart';
import 'homescreen.dart';
import 'package:animate_do/animate_do.dart';
import 'constant.dart';

class onBoardingPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      
      pages: [
        PageViewModel(
          title: 'WELCOME CHEF ',
          body: 'Good food is the key to happiness',
          image: buildImage('assets/1234.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          image: buildImage('assets/12.png'),
          title: ' Create, Explore and Cook',
          body: 'Create your own recipes and explore more recipes',
          decoration: buildDecoration(),
        ),
        // PageViewModel(
        //   image: buildImage1('assets/12.png'),
        //   title: '',
        //   body: 'Create your own recipes and explore more recipes',
          
        //   decoration: buildDecoration1(),
        // ),
      ],
      next: Icon(
        Icons.navigate_next,
        size: 40,
        color: konBoardingsecondary,
      ),
      done: Text(
        'Done',
        style: TextStyle(
            color: konBoardingsecondary,
            fontSize: 20,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.bold),
      ),
      onDone: () => goToHome(context),
      // showSkipButton: true,
      // skip: Text('Skip', style: TextStyle(color: Colors.red, fontSize: 20),), //by default, skip goes to the last page
      // onSkip: () => goToHome(context),
      dotsDecorator: getDotDecoration(),
      animationDuration: 100,
      globalBackgroundColor: konBoardingmain,
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
      color: Colors.grey,
      size: Size(10, 10),
      activeColor: konBoardingsecondary,
      activeSize: Size(10, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));

  void goToHome(BuildContext context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));

  PageDecoration buildDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          fontFamily: 'SF Pro Display',
          color: konBoardingsecondary,
        ),
        bodyTextStyle: TextStyle(
            fontSize: 20,
            color: konBoardingsecondary,
            fontFamily: 'SF Pro Display'),
        pageColor: konBoardingmain,
        imagePadding: EdgeInsets.all(0),
      );
  PageDecoration buildDecoration1() => const PageDecoration(
    bodyAlignment: Alignment.bottomCenter,
        titleTextStyle: TextStyle(
          
          fontSize: 10,
          fontWeight: FontWeight.bold,
          fontFamily: 'SF Pro Display',
          color: konBoardingsecondary,
        ),
        bodyTextStyle: TextStyle(
            fontSize: 20,
            color: konBoardingsecondary,
            fontFamily: 'SF Pro Display'),
        pageColor: konBoardingmain,
        // imagePadding: EdgeInsets.all(0),
      );
  Widget buildImage(String path) => Center(
        child: FadeIn(
          child: Image.asset(path),

          // infinite: true,
          duration: const Duration(seconds: 1),
        ),
      );
    Widget buildImage1(String path) => Center(
      
        // ignore: unnecessary_new
        child:  Container(
                  child: Center(
                      child: Column(
                          children : [
                            
                            
                            const Padding(padding: EdgeInsets.only(top: 100.0)),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Enter Name",
                                fillColor: konBoardingmain,
                                border: OutlineInputBorder(
                                  
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(color: konBoardingsecondary
                                  ),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if(val!.length==1) {
                                  return "Name cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              
                              style: const TextStyle(
                                fontFamily: font,
                              ),
                            ),
                          ]
                      )
                  ),)
        
      );

}
