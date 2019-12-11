import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';

class ProfileScreen extends StatefulWidget{

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<ProfileScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}