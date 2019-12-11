import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/widgets/inbox/inbox_main.dart';

class InboxScreen extends StatefulWidget{

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<InboxScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Kotak Masuk'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: InboxMain(),
      ),
    );
  }
}