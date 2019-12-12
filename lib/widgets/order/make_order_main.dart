import 'package:daily_wash/pages/order/order_checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:daily_wash/models/outlet_info_model.dart';
import 'package:daily_wash/widgets/order/order_card.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/widgets/order/order_box.dart';
import 'package:daily_wash/models/order_checkout.dart';

class MakeOrderMain extends StatefulWidget{

  final OutletInfo outletInfo;
  final state = _MakeOrderMainState();
  int get inCart => state.inCart;

  MakeOrderMain({this.outletInfo});

  @override
  _MakeOrderMainState createState() => state;
}

class _MakeOrderMainState extends State<MakeOrderMain>{

  List<OrderCheckout> orderCheckouts = [];
  List<dynamic> selectedService;
  List<DropdownMenuItem> dropdownContents = [];
  List<OrderBox> orderBoxes = [];
  List<OrderCard> orderCards = [];
  int position = 0;
  List<bool> visibilityOrderBox = List();
  int inCart = 0;

  @override
  initState(){
    super.initState();
    initDropdownBox();
  }


  initDropdownBox(){
    int k = 0;
    for(String s in widget.outletInfo.serviceNames){
      dropdownContents.add(DropdownMenuItem(
        child: Text(getProperTitle(s).replaceAll('_', ' ')),
        value: [s,k],
        )
      );
      k++;
      visibilityOrderBox.add(false);
    }
//    selectedService = ['regular',0];
    for(int i = 0 ; i<widget.outletInfo.services.length; i++){
      orderBoxes.add(
        OrderBox(service: widget.outletInfo.services[i],checkThis: ()=>checkThis(),)
      );
//      orderCards.add(List());
//      for(int x = 0; x < widget.outletInfo.services[i].serviceDetails.length;x++){
//        orderCards[i].add(OrderCard(initialValue: 0,name: widget.outletInfo.services[i].serviceDetails[x].name,price: widget.outletInfo.services[i].serviceDetails[x].price,));
//      }

    }
    print(selectedService);
  }
  String getProperTitle(String s){
    return s[0].toUpperCase()+s.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        height: sizeVertical * 90,
        margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 5),
        child: Stack(
          children: <Widget>[
            Container(
              height: sizeVertical * 83,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  selectServiceBox(),
                  cucianBox2(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child:  sendBox()
            )
          ],
        ),
      ),
    );
  }

  selectServiceBox(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Pilihan Servis', style: h5(Colors.black),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: DropdownButton(
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down),
              hint: Text('Pilih servis'),
              value: selectedService,
              onChanged: (value){
                print(value);
                setState(() {
                  selectedService = value;
                  position = value[1];
                  for(int kkk = 0; kkk < visibilityOrderBox.length;kkk++){
                    visibilityOrderBox[kkk] = false;
                  }
                  visibilityOrderBox[position] = true;
//                  selectedService = getProperTitle(value).replaceAll('_', ' ');
                });
              },
              items: dropdownContents,
            ),
          )

        ],
      ),
    );

  }

  cucianBox2(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Cucian',style: h5(Colors.black),),
          (selectedService == null)?Container(
            child: Center(
              child: Text('Pilih Servis Dulu'),
            ),
          ):ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderBoxes.length,
              itemBuilder: (context, l){
              return Offstage(
                offstage: !visibilityOrderBox[l],
                child: orderBoxes[l],
              );
              }
          )
        ],
      ),
    );
  }

  sendBox(){
    return GestureDetector(
      onTap: (){
        orderCheckouts.clear();
        for(String s in widget.outletInfo.serviceNames){
          List<OrderDetail> od = [];
          for(OrderCard oc in orderCards.where((a) => ((a.quantity != 0)&&(a.type == s))).toList()){
            od.add(OrderDetail(
              name: oc.name,
              quantity: oc.quantity,
              price: oc.price
            ));
          }
          if(od.isNotEmpty){
            orderCheckouts.add(OrderCheckout(
                name: s,
                orderDetails: od
            ));
          }
        }
        print('ada : '+orderCheckouts.length.toString());
        Navigator.push(context, MaterialPageRoute(builder: (context) => OrderCheckoutScreen(orderCheckouts: orderCheckouts,)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: dailyRed,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: sizeHorizontal * 90,
        child: Text('Pesan', style: h5(Colors.white),textAlign: TextAlign.center,),
      ),
    );
  }

  checkThis(){
    int c = 0;
    orderCards = List();
    for (OrderBox ob in orderBoxes){
      orderCards.insertAll(0, ob.orderCards);
    }
    for(OrderCard o in orderCards){
      if(o.quantity!=0){
        c+=o.quantity;
      }
    }
    setState(() {
      inCart = c;
    });
    print('dalam cart : '+c.toString());
  }




}