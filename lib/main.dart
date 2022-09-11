import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onboarding_screen/constant.dart';
import 'package:onboarding_screen/model/addrecipemodel.dart';
import 'package:onboarding_screen/model/modeloperation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homescreen.dart';
import 'onboarding_page.dart';

late Box box;

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 0); //if already shown -> 1 else 0
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter<Add>(AddAdapter());
  box = await Hive.openBox<Add>("addrec");
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(
      
        SystemUiMode.edgeToEdge); // Enable Edge-to-Edge on Android 10+
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      
      systemNavigationBarColor:
          kgrey, // Setting a transparent navigation bar color
      systemNavigationBarContrastEnforced: false, // Default
      // systemNavigationBarIconBrightness: Brightness.light , // This defines the color of the scrim
    ));

    return ChangeNotifierProvider<ModelOperation>(
      create: (context) => ModelOperation(),
      child: MaterialApp(
        title: 'cook the licious',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute:
            initScreen == 1 || initScreen == null ? 'onboard' : 'home',
        routes: {
          'home': (context) => HomeScreen(),
          'onboard': (context) => onBoardingPage(),
        },
      ),
    );
  }
}
