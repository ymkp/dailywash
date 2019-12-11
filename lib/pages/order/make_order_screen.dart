import 'package:flutter/material.dart';
import 'package:daily_wash/models/outlet_info_model.dart';
import 'package:daily_wash/widgets/order/make_order_main.dart';

class MakeOrderScreen extends StatefulWidget{

  final OutletInfo outletInfo;
  MakeOrderScreen({this.outletInfo});

  @override
  _MakeOrderScreenState createState() => _MakeOrderScreenState();
}

class _MakeOrderScreenState extends State<MakeOrderScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Laundry'),
        centerTitle: true,
      ),
      body: MakeOrderMain(outletInfo: widget.outletInfo,),
    );
  }
}