
import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:law/Screens/authentication/login.dart';
import 'package:law/Screens/drawer_screen.dart';
import 'package:law/Screens/home.dart';
import 'package:law/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const SCREEN_ID = "/splash_screen";


  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext contnext) {
   loadString("accesstoken");



    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/splash_img.png",alignment: Alignment.center,fit: BoxFit.fill,width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height ,),
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/lawlogo.png"),
          )
        ],

    
      ),
    );
  }
  Future<void> loadString(String key) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString("accesstoken"));
    if(prefs.getString("accesstoken") != null && prefs.getString("accesstoken")!.isNotEmpty){
      Timer(

          Duration(milliseconds:1500 ), () =>
      //   Navigator.push(
      // context,
      // CupertinoPageRoute(builder: (context) =>    LoginScreen())),

      Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) =>

            DrawerScreen(place: Home_Screen(),),
      )
      ));
    }else{
      Timer(

          Duration(milliseconds:1500 ), () =>
      //   Navigator.push(
      // context,
      // CupertinoPageRoute(builder: (context) =>    LoginScreen())),
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) =>

            LoginScreen()),
      )
      );
    }

  }
 
}