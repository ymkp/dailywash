import 'package:flutter/material.dart';
import 'package:daily_wash/models/nearest_outlet_model.dart';
import 'package:daily_wash/widgets/outlet/nearest_outlet_box.dart';
import 'package:daily_wash/constants/theme.dart';

class OutletsMain extends StatelessWidget{

  final List<NearestOutlet> outlets;
  OutletsMain({this.outlets});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: (outlets.isNotEmpty)?ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: outlets.length,
          itemBuilder: (context, i){
          return NearestOutletBox(outlet: outlets[i],);
          }
      ):Text('Outlet Tidak Ditemukan', style: h5(Colors.black),),
    );
  }
}