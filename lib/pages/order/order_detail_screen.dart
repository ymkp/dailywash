import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daily_wash/providers/order_detail_provider.dart';
import 'package:daily_wash/widgets/order/order_detail_main.dart';

class OrderDetailScreen extends StatelessWidget{

  final int id;
  final String orderId;
  OrderDetailScreen({this.id, this.orderId});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(orderId),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_) => OrderDetailProvider(orderId: orderId, id: id),
        child: OrderDetailMain(),
      ),
    );
  }
}