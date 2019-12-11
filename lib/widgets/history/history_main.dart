import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/models/history_order_model.dart';
import 'package:daily_wash/widgets/history/history_card.dart';

class HistoryMain extends StatefulWidget{

  @override
  _HistoryMainState createState()=> _HistoryMainState();
}

class _HistoryMainState extends State<HistoryMain>{

  List<HistoryOrder> hosFinished = [
    HistoryOrder(id: 0, status: 3, date: '11-11-2019',type: 'express',orderId: 'DJSH001'),
    HistoryOrder(id: 1, status: 3, date: '14-11-2019',type: 'helm',orderId: 'DJSH003'),
  ];

  List<HistoryOrder> hosOngoing = [
    HistoryOrder(id: 2, status: 0, date: '09-12-2019',type: 'regular',orderId: 'DJSH006'),
    HistoryOrder(id: 3, status: 2, date: '10-12-2019',type: 'iron',orderId: 'DJSH0055'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TabBarView(
      children: <Widget>[
        _ongoingPage(),
        _previousPage()
      ],
    );
  }

  _ongoingPage(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: sizeHorizontal * 4),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: hosOngoing.length,
          itemBuilder: (context, i){
          return HistoryCard(hom: hosOngoing[i],);
          }
      ),
    );
  }
  _previousPage(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: sizeHorizontal * 4),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: hosFinished.length,
          itemBuilder: (context, i){
            return HistoryCard(hom: hosFinished[i],);
          }
      ),
    );
  }
}