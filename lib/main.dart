import 'package:flutter/material.dart';
import 'package:daily_wash/pages/splash_screen.dart';
import 'package:daily_wash/pages/home_page_main.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/pages/login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Daily Wash Laundromat',
      theme: ThemeData(
        fontFamily: 'SFPro',
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          textTheme: TextTheme(
            title: TextStyle(color: Colors.black,fontFamily: 'SFProBold')
          ),
          elevation: 0,
          color: dailyWhite,
        )
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        'Login' : (BuildContext context) => LoginScreen(),
        'Home' : (BuildContext context) => HomePageMain(),
      },
    );
  }
}