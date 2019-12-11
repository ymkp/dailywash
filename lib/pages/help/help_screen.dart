import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';

class HelpScreen extends StatefulWidget{

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HelpScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}