import 'package:flutter/material.dart';
//import 'package:appthuan/Screensss1/Welcome/welcome_screen.dart';
import 'package:appthuan/constants.dart';
//import 'package:appthuan/Writedata.dart';
import 'package:appthuan/pages/Chart1.dart';
import 'package:appthuan/pages/ReadData.dart';
//import 'package:appthuan/Readdata.dart';
import 'package:appthuan/pages/Read.dart';
import 'package:appthuan/pages/home1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'writedata.dart';
//import 'dbHelper/mongodb.dart';
import 'Login_Signup/Screensss1/Welcome/welcome_screen.dart';
import 'database_mongo/database.dart';

// import 'home1.dart';
// import 'Read.dart';
//============================================================mới ==============================================================
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
          //primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
            //  backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            //fillColor: red,
           // iconColor: kPrimaryColor,
           // prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const WelcomeScreen(),
    );
  }
}
