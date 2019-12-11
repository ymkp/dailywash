import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';

class CustomerHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Icon(Icons.person),
                ),
                Container(
                  width: sizeHorizontal * 65,
                  child: Text('Yochanan Maranatha Kristian Putra', style: h6(Colors.black),),
                )
              ],
            ),
          ),
          Container(
            child: Icon(Icons.notifications),
          )
        ],
      ),
    );
  }
}