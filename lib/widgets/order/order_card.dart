import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/models/outlet_info_model.dart';
import 'package:intl/intl.dart';

typedef CheckThis();

class OrderCard extends StatefulWidget{

  final int id;
  final String name;
  final String type;
  final int price;
  final int initialValue;
  final CheckThis checkThis;
  OrderCard({this.id, this.name, this.price,this.initialValue, this.checkThis, this.type});

  final state = _OrderCardState();
  @override
  _OrderCardState createState() => state;

  int get quantity => state.quantity;
  int get thisPrice => state.getThisPrice();
}

class _OrderCardState extends State<OrderCard>{

  final formatter = new NumberFormat("#,###");

  int quantity = 0;

  @override
  initState(){
    super.initState();
    quantity = widget.initialValue;
  }

  int getThisPrice(){
    return quantity * widget.price;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: sizeHorizontal * 3,vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: sizeHorizontal * 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.name, style: h6(Colors.black),),
                    Text('Rp '+formatter.format(widget.price).replaceAll(',', '.'),style: t3(Colors.black),)
                  ],
                ),
              ),
              Container(
//                width: sizeHorizontal * 40,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(this.quantity !=0){
                            this.quantity--;
                          }
                        });
                        print(widget.name+' : '+this.quantity.toString());
                        widget.checkThis();
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: dailyBlue,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Icon(Icons.remove, color: Colors.white,),
                      ),
                    ),
                    Container(
                      width: sizeHorizontal*8,
                      child: Text(this.quantity.toString(),style: h6(Colors.black), textAlign: TextAlign.center,),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(this.quantity!=99){
                            this.quantity++;
                          }
                        });
                        widget.checkThis();

                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: dailyBlue,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Icon(Icons.add, color: Colors.white,),
                      ),
                    ),
                    (quantity!= 0)?
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              quantity = 0;
                            });
                          },
                          child: Container(
                            width: 30,
                            child: Icon(Icons.delete, color: dailyRed,),
                          ),
                        )
                        :Container(
                      width: 30,                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
