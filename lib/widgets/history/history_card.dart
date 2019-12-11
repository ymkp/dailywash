import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/models/history_order_model.dart';
import 'package:daily_wash/pages/order/order_detail_screen.dart';

class HistoryCard extends StatelessWidget{

  final HistoryOrder hom;

  HistoryCard({this.hom});

  final List<String> nameOfMonth = ['','Jan','Feb','Mar','Apr','Mei','Jun','Jul','Aug','Sep','Okt','Nov','Des'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailScreen(id: hom.id,orderId: hom.orderId,)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: sizeHorizontal * 90,
        child: Card(
          elevation: 3,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 7),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: sizeHorizontal * 10,
                  child: orderIcon(),
                ),
                Container(
                    width: sizeHorizontal * 57,
                    child:Column(
                      children: <Widget>[
                        Container(
                          width: sizeHorizontal * 57,
                          child: Text('Order No : '+hom.orderId, style: h5(Colors.black),),
                        ),
                        Container(
                          width: sizeHorizontal * 57,
                          child: Text(queueStatus(), style: t3(Colors.black),),
                        )
                      ],
                    )
                ),
                Container(
                  width: sizeHorizontal * 15,
                  child: renderDate(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  orderIcon(){
    if(hom.type == 'express'){
      return Image.asset('res/icons/service_express_small.png');
    }
    else if(hom.type == 'regular'){
      return Image.asset('res/icons/service_regular_small.png');

    }
    else if(hom.type == 'helm'){
      return Image.asset('res/icons/service_helm_small.png');

    }
    else if(hom.type == 'iron'){
      return Image.asset('res/icons/service_iron_small.png');

    }
    else if(hom.type == 'dry clean'){
      return Image.asset('res/icons/service_dry_clean_small.png');
    }
    else {
      return Image.asset('res/icons/service_regular_small.png');
    }
  }

  queueStatus(){
    if (hom.status == 0){
      return 'Dalam Antrian';
    }
    else if(hom.status == 1){
      return 'Dalam Proses';
    }
    else if(hom.status == 2){
      return 'Siap Diambil';
    }
    else if(hom.status == 3){
      return 'Selesai';
    }
  }

  renderDate(){
    return Column(
      children: <Widget>[
        Text(hom.date.substring(0,2)),
        Text(nameOfMonth[int.parse(hom.date.substring(3,5))])
      ],
    );
  }

}