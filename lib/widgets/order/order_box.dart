import 'package:flutter/material.dart';
import 'package:daily_wash/widgets/order/order_card.dart';
import 'package:daily_wash/models/outlet_info_model.dart';


typedef CheckThis();

class OrderBox extends StatefulWidget{
  final Service service;
  final CheckThis checkThis;

  OrderBox({this.service, this.checkThis});
  final state = _OrderBoxState();
  @override
  _OrderBoxState createState()=> state;

  List<OrderCard> get orderCards => state.orderCards;

}
class _OrderBoxState extends State<OrderBox>{

  List<OrderCard> orderCards = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int x = 0; x < widget.service.serviceDetails.length; x++){
      orderCards.add(OrderCard(price: widget.service.serviceDetails[x].price,name: widget.service.serviceDetails[x].name,initialValue: 0,checkThis: ()=>widget.checkThis(),type: widget.service.name,));
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.service.serviceDetails.length,
              itemBuilder: (context,i){
              return orderCards[i];
              }
          )
        ],
      ),
    );
  }
}