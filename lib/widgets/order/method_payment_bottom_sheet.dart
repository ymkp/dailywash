import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';

class MethodPaymentBottomSheet extends StatefulWidget{

  final String pm;
  MethodPaymentBottomSheet({this.pm});
  final state = _MethodPaymentBottomSheetState();

  @override
  _MethodPaymentBottomSheetState createState() => state;

  String get paymentMethod => state.paymentMethod;
}

class _MethodPaymentBottomSheetState extends State<MethodPaymentBottomSheet>{

  String paymentMethod = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentMethod = widget.pm;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      padding: EdgeInsets.symmetric(vertical: 30, horizontal: sizeHorizontal * 5),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text('Pilih Metode Pembayaran', style: h5(Colors.black),),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                boxPaymentGopay(),
                boxPaymentOVO(),
                boxPaymentCredit()
              ],
            ),
          ),

        ],
      ),
    );
  }

  boxPaymentGopay(){
    return GestureDetector(
      onTap: (){
        setState(() {
          paymentMethod = 'gopay';
        });
      },
      child: Card(
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: (paymentMethod == 'gopay')?Border.all(color: dailyBlue):null
          ),
          width: sizeHorizontal * 25,
          height: sizeHorizontal * 25,
          child: Text('GOPAY'),
        ),
      ),
    );
  }

  boxPaymentOVO(){
    return GestureDetector(
      onTap: (){
        setState(() {
          paymentMethod = 'ovo';
        });
      },
      child: Card(
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: (paymentMethod == 'ovo')?Border.all(color: dailyBlue):null
          ),
          width: sizeHorizontal * 25,
          height: sizeHorizontal * 25,
          child: Text('OVO'),
        ),
      ),
    );
  }

  boxPaymentCredit(){
    return GestureDetector(
      onTap: (){
        setState(() {
          paymentMethod = 'credit';
        });
      },
      child: Card(
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: (paymentMethod == 'credit')?Border.all(color: dailyBlue):null
          ),
          width: sizeHorizontal * 25,
          height: sizeHorizontal * 25,
          child: Text('CREDIT'),
        ),
      ),
    );
  }


}