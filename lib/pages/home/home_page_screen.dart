import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/widgets/home/home_nearest_outlet.dart';
import 'package:daily_wash/widgets/home/customer_header.dart';
import 'package:daily_wash/widgets/home/promo_carousel.dart';
import 'package:daily_wash/widgets/home/services_container.dart';

class HomePageScreen extends StatefulWidget{

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: dailyWhite,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 35,top: 45),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomerHeader(),
              PromoCarousel(),
              ServicesContainer(),
              HomeNearestOutlet(),
            ],
          ),
        ),
      ),
    );
  }
}