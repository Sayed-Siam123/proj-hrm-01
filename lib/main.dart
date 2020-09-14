import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:hrm_app/helper/MainPage.dart';
import 'package:hrm_app/pages/Home.dart';
import 'package:hrm_app/pages/Login.dart';
import 'package:hrm_app/resources/SharedPrefer.dart';
import 'package:splashscreen/splashscreen.dart';

import 'ColorLibrary/HexColor.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // AppLanguage appLanguage = AppLanguage();
  // await appLanguage.fetchLocale();
  await GlobalConfiguration().loadFromAsset("config");
  print("base_url: ${GlobalConfiguration().getString('base_url1')}"); // need to use for api call

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
  ));  //to make top statusbar color transperent in app

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Color first_layer = HexColor("#014660");
  Color second_layer = HexColor("#FFFFFF");
  Color button_red = HexColor("#E8505B");
  Color word_hint = HexColor("#828282");
  Color nav_bar = HexColor("#EB5757");

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: first_layer,
        buttonColor: button_red,
        accentColor: second_layer,
        focusColor: nav_bar,
        hintColor: word_hint,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  SessionManager prefs = SessionManager();

  String userid = "";

  String loginStatus = '';


  String loginKey = "loginKey";
  String useridKey = "userid";
  String loginName = "loginName";
  String userDesignation = "userDesignation";
  String PresentStatus = "PresentStatus";
  String LateStatus = "LateStatus";
  String Intimes = "Intimes";
  String MonthPresent = "MonthPresent";
  String MonthAbesnt = "MonthAbesnt";
  String MonthLeave = "MonthLeave";
  String MonthLate = "MonthLate";

  void getLogin() async {
    Future<String> serverip = prefs.getData(loginKey);
    serverip.then((data) async {
      print('login status pabo');
      print("login status " + data.toString());

      setState(() {
        loginStatus = data.toString();
      });
      print(loginStatus.toString());

//      Future.delayed(const Duration(milliseconds: 1000), () {
//
//      });
    }, onError: (e) {
      print(e);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 50), () {
      getLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.white,
      seconds: 3,
      title: Text("HRM app"),
      navigateAfterSeconds: loginStatus == "false" || loginStatus == "null" ? LoginPage(status: true,) : MainPage(currentIndex: 0,),
      //title: new Text('IDENTIT',textScaleFactor: 2,),
      loadingText: Text("Loading"),
      photoSize: 150.0,
      loaderColor: Colors.black54,
    );
  }
}