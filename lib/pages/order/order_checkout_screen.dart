import 'package:daily_wash/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_wash/models/order_checkout.dart';
import 'package:daily_wash/widgets/order/order_checkout_main.dart';
import 'package:daily_wash/providers/picker_provider.dart';
import 'package:provider/provider.dart';


class OrderCheckoutScreen extends StatefulWidget{


  final List<OrderCheckout> orderCheckouts;
  OrderCheckoutScreen({this.orderCheckouts});

  @override
  _OrderCheckoutScreenState createState() => _OrderCheckoutScreenState();
}
class _OrderCheckoutScreenState extends State<OrderCheckoutScreen>{

  int orderCount = 0;

  @override
  initState(){
    super.initState();
    countCheckout();
  }

  countCheckout(){
    for (OrderCheckout oc in widget.orderCheckouts){
      for (OrderDetail od in oc.orderDetails){
        orderCount += od.quantity;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(right: sizeHorizontal * 3),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(sizeHorizontal * 2),
                    width: 50,
                    height: 50,
                    child: Image.asset('res/icons/basket.png'),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      padding: EdgeInsets.all(sizeHorizontal * 1),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: dailyRed
                      ),
                      child: Text(orderCount.toString(), style: h6(Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        centerTitle: true,
        title: Text('Pesan Laundry'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => PickerProvider(),
        child: OrderCheckoutMain(orderCheckouts: widget.orderCheckouts,),
      ),
    );
  }
}