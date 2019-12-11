import 'package:daily_wash/widgets/order/order_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_wash/models/order_checkout.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:intl/intl.dart';
import 'package:daily_wash/widgets/order/method_payment_bottom_sheet.dart';

class OrderCheckoutMain extends StatefulWidget{

  final List<OrderCheckout> orderCheckouts;
  OrderCheckoutMain({this.orderCheckouts});

  @override
  _OrderCheckoutMainState createState() => _OrderCheckoutMainState();
}

class _OrderCheckoutMainState extends State<OrderCheckoutMain>{

  int laundryPrice = 0;
  int deliveryPrice = 10000;
  int finalPrice = 0;
  final formatter = new NumberFormat("#,###");
  String paymentMethod = '';
  MethodPaymentBottomSheet mpbs;
  String notes = '';

  TextEditingController notesCtrl = TextEditingController();
  FocusNode notesFocus = FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFinalPrice();
  }

  getFinalPrice(){
    for(OrderCheckout oc in widget.orderCheckouts){
      for(OrderDetail od in oc.orderDetails){
        laundryPrice += od.price*od.quantity;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print('this');
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            deliveryContainer(),
            cucianContainer(),
            catatanContainer(),
            priceContainer(),
            paymentMethodBox(),
            orderButton()
          ],
        ),
      ),
    );
  }

  cucianContainer(){
    return Container(

      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text('Cucian', style: h5(dailyBlue),),
                ),
                GestureDetector(
                  onTap: (){
                    print('pressed');
                    onCatatanButtonPressed();
                  },
                  child: Container(
                    width: sizeHorizontal * 20,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: dailyBlue),
//                        color: dailyBlue
                    ),
                    child: Text('Catatan', style: t5(dailyBlue),),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.orderCheckouts.length,
              itemBuilder: (context, i){
                return orderCucianBox(widget.orderCheckouts[i]);
              }
          )
        ],
      ),
    );
  }

  deliveryContainer(){
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Servis Antar Jemput', style: h5(dailyBlue),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                width: sizeHorizontal * 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text('Pengambilan (oleh kurir)', style: t3(Colors.grey),),
                    ),
                    Container(
                      child: Text('ASLDJLAKSJDLAaklsdj SKDJLAKSJD LASKJDLKASJD', style: h6(Colors.black),),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  print('clicked');
                },
                child: Container(
                  width: sizeHorizontal * 7,
                  child: Image.asset('res/icons/map_marker.png'),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),

                width: sizeHorizontal * 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text('Pengantaran (oleh kurir)', style: t3(Colors.grey),),
                    ),
                    Container(
                      child: Text('ASLDJLAKSJDLASKDJLAKSJD LASKJDLKASJD', style: h6(Colors.black),),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  print('clicked');
                },
                child: Container(
                  width: sizeHorizontal * 7,
                  child: Image.asset('res/icons/map_marker.png'),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),

                width: sizeHorizontal * 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text('Waktu Pengantaran (oleh kurir)', style: t3(Colors.grey),),
                    ),
                    Container(
                      child: Text('Minggu, 22 Desember 2019', style: h6(Colors.black),),
                    ),
                    Container(
                      child: Text('18.00 - 19.00', style: h6(Colors.black),),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  print('clicked');
                },
                child: Container(
                  width: sizeHorizontal * 7,
                  child: Image.asset('res/icons/delivery_clock.png'),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),

//                width: sizeHorizontal * 70,
                child: Text('Biaya antar - jemput', style: t3(Colors.grey),),
              ),
              GestureDetector(
                onTap: (){
                  print('clicked');
                },
                child: Container(
//                  width: sizeHorizontal * 20,
                  child: Text('Rp '+formatter.format(deliveryPrice).replaceAll(',', '.'), style: h6(dailyBlue),),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  onCatatanButtonPressed(){
    print('that');
    return showBottomSheet(
      context: context,
      builder: (context)=>Container(
        decoration: BoxDecoration(
          color: Colors.white,
            boxShadow: [
              new BoxShadow(
                color: dailyBlueShadow,
                blurRadius: 900,
                offset: new Offset(-10, -7.0),
              )
            ],
          borderRadius: BorderRadius.vertical(top:Radius.circular(15)),
//          border: Border.all(color: dailyBlue)
        ),
        padding: EdgeInsets.only(top: 30, left: sizeHorizontal * 5, right: sizeHorizontal * 5, bottom: 5),
        height: 360,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Beri Catatan', style: h5(Colors.black),),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text('Beri tahu soal cucian anda, apakah harus pakai air hangat, air dingin atau air lainnya, oke oke?', style: t3(Colors.black45),),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                border: Border.all(color: dailyBlueShadow)
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                      controller: notesCtrl,
                      focusNode: notesFocus,
                      style: t3(Colors.black),
                      maxLines: 6,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: t3(Colors.grey),
                          hintText: 'Es teh tiga'
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    child: Text('Ganti / angka', style: t3(Colors.grey),textAlign: TextAlign.end,)
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  notes = notesCtrl.text;
                });
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 15, bottom: 10),
                padding: EdgeInsets.symmetric(vertical: 10),
                width: sizeHorizontal * 90,
                decoration: BoxDecoration(
                  color: dailyBlue,
                  borderRadius: BorderRadius.all(Radius.circular(7))
                ),
                child: Text('Buat Catatan', style: h5(Colors.white),textAlign: TextAlign.center,),
              ),
            )
          ],
        ),
      )
    );
  }

  catatanContainer(){
    return (notes != '')? Container(
      width: sizeHorizontal * 90,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(notes,style: t3(Colors.black),)
          )
        ],
      ),
    ):Container();
  }

  orderCucianBox(OrderCheckout oc){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child:  RichText(
              text: TextSpan(
                  style: t2(Colors.black),
                  children:[
                    TextSpan(
                        text: 'Paket '
                    ),
                    TextSpan(
                        style: h4(Colors.black),
                        text: oc.name
                    )
                  ]
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]))
            ),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount: oc.orderDetails.length,
              itemBuilder: (context, i){
                  return orderCard(oc.orderDetails[i]);
              },
            ),
          )
        ],
      ),
    );
  }

  orderCard(OrderDetail od){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: sizeHorizontal * 10,
            child: Text(od.quantity.toString()+'x', style: t3(Colors.black),),
          ),
          Container(
            width: sizeHorizontal * 50,
            child: Text(od.name, style: t3(Colors.black)),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: sizeHorizontal * 24,
            child: Text('Rp '+formatter.format(od.price * od.quantity).replaceAll(',', '.'), style: t3(Colors.black))
          )
        ],
      ),
    );
  }

  priceContainer(){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]))
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        'Total Cucian',style: t3(Colors.black),
                    ),
                    Text('Rp '+formatter.format(laundryPrice).replaceAll(',', '.'),style: h6(Colors.black))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        'Biaya Pengiriman',style: t3(Colors.black)
                    ),
                    Text('Rp '+formatter.format(deliveryPrice).replaceAll(',', '.'),style: h6(Colors.black))
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]))
          ),
          padding: EdgeInsets.only(bottom: 15),
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                  'Total Biaya',style: t3(Colors.black)
              ),
              Text('Rp '+formatter.format(deliveryPrice+laundryPrice).replaceAll(',', '.'),style: h5(dailyBlue))
            ],
          ),
        )
      ],
    );
  }

  paymentMethodBox(){
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text('Metode Pembayaran', style: h5(dailyBlue),),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    print('pressed');
                    onPaymentMethodPressed();
                  },
                  child: Container(
                    width: sizeHorizontal * 35,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
//                              border: Border.all(color: dailyBlue),
                        color: dailyBlue
                    ),
                    child: Text((paymentMethod == 'gopay')?'GoPay':(paymentMethod == 'ovo')?'OVO':(paymentMethod == 'credit')?'Credit':'Pilih', style: h6(Colors.white),textAlign: TextAlign.center),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    width: sizeHorizontal * 35,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: dailyBlue),
//                        color: dailyBlue
                    ),
                    child: Text('Tambahkan Promo', style: t4(dailyBlue),textAlign: TextAlign.center,),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  onPaymentMethodPressed(){
    print('that');
    return showBottomSheet(
        context: context,
        builder: (context)=>Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              new BoxShadow(
                color: dailyBlueShadow,
                blurRadius: 900,
                offset: new Offset(-10, -7.0),
              )
            ],
            borderRadius: BorderRadius.vertical(top:Radius.circular(15)),
//          border: Border.all(color: dailyBlue)
          ),          height: 270,
          child: Column(
            children: <Widget>[
              mpbs = MethodPaymentBottomSheet(pm: paymentMethod,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    paymentMethod = mpbs.paymentMethod;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: sizeHorizontal * 90,
                  decoration: BoxDecoration(
                      color: dailyBlue,
                      borderRadius: BorderRadius.all(Radius.circular(7))
                  ),
                  child: Text('Pilih', style: h5(Colors.white),textAlign: TextAlign.center,),
                ),
              )
            ],
          ),
        )
    );
  }

  orderButton(){
    return GestureDetector(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: sizeHorizontal * 90,
        margin: EdgeInsets.only(top: 10, bottom: 25),
        decoration: BoxDecoration(
            color: dailyRed,
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Text('Pesan', style: h5(Colors.white),textAlign: TextAlign.center,),
      ),
    );
  }




}