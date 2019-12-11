import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'tempat_duduk_model.dart';
import 'tempat_duduk_box.dart';

class TempatDudukScreen extends StatefulWidget{

  @override
  _TempatDudukScreenState createState() => _TempatDudukScreenState();
}

class _TempatDudukScreenState extends State<TempatDudukScreen>{

  List<TempatDuduk> tempatDuduks = [];
  List<TempatDudukBox> tempatDudukBoxes = [];
  bool isLoading = false;

  @override
  initState(){
    super.initState();
    getTempatDuduk();
  }

  getTempatDuduk() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get('http://media.sipaud.id/jsonmock/tempat_duduk');
    if(response.statusCode == 200){
      print(response.body);
      tempatDuduks = (json.decode(response.body)['seats'] as List).map((a) => TempatDuduk.fromJson(a)).toList();
      for(TempatDuduk t in tempatDuduks){
        tempatDudukBoxes.add(TempatDudukBox(
          tempatDuduk: t,
          )
        );
      }
    }else{
      print('wew');
    }
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempat DUduk'),
      ),
      body: SingleChildScrollView(
        child: (isLoading) ? Center(child: CircularProgressIndicator(),):Column(
          children: <Widget>[
            Text('ini tempat duduk'),
            Container(
              color: Colors.grey[200],
              height: sizeHorizontal * 100,
              width: sizeHorizontal * 100,
              child: Stack(
                children: tempatDudukBoxes,
              ),
            )
          ],
        ),
      ),
    );
  }
}