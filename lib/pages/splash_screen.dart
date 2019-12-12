import 'dart:async';
import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    forInit();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              Center(child:
              Container(
                  height: 300,
                  width: 300,
                  margin: EdgeInsets.only(top:100),
                  alignment: Alignment.center,
                  child:
                  Image.asset('res/graphics/logo.jpg')
              ),
              ),
              Container(margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                child:
                Text("vantura.id 2019", style: TextStyle(fontSize: 12.0, color: Colors.black,),
                ),
              ),
            ],
          )
      ),
    );
  }

  forInit() async {
    // cek login
    //later
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('spToken');
//    print('app token : '+prefs.getString('spAppToken'));

    Timer(Duration(milliseconds: 1000), (){

      if (token == null || token == '') {
        Navigator.of(context).pushNamedAndRemoveUntil('Login', (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil('Home', (Route<dynamic> route) => false);
      }
    });

    //wait 3 seconds
    // await Future.delayed(const Duration(seconds: 3));
  }
}