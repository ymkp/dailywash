import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:provider/provider.dart';
import 'package:daily_wash/providers/promo_detail_provider.dart';

class PromoInfoMain extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final pdp = Provider.of<PromoDetailProvider>(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 8),
        child: Column(
          children: <Widget>[
            headerContainer(pdp),
            imageContainer(pdp),
            descriptionContainer(pdp),
          ],
        ),
      ),
    );
  }

  headerContainer(PromoDetailProvider pdp){
    return (pdp.state == PDPState.loading || pdp.state == PDPState.error)? Container(): Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Text(pdp.promoDetail.title,style: h6(Colors.black),),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]))
            ),
            margin: EdgeInsets.only(top: 5,bottom: 15),
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
              children: <Widget>[
                Container(

                  child: Icon(Icons.calendar_today, color: dailyRed, size: 15,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(pdp.promoDetail.dateCreated, style: t4(Colors.grey),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  imageContainer(PromoDetailProvider pdp){
    return (pdp.state == PDPState.loading || pdp.state == PDPState.error)?loadingContainer(height: 200,width: sizeHorizontal * 90):
    Container(
      width: sizeHorizontal * 90,

      child: Image.network(pdp.promoDetail.image),
    );
  }

  descriptionContainer(PromoDetailProvider pdp){
    return (pdp.state == PDPState.loading || pdp.state == PDPState.error)?Container():
    Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: RichText(
              text: TextSpan(
                style: t4(Colors.black),
                children: [
                  TextSpan(text: 'Gunakan kode promo '),
                  TextSpan(text: pdp.promoDetail.promoCode, style: h7(dailyRed))
                ]
              ),
            ),
          ),
          Container(
            child: Text(pdp.promoDetail.description,style: TextStyle(height: 1.3, fontSize: sizeHorizontal * 2.5),),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text('Promo berakhir : '+pdp.promoDetail.dateExpired, style: t4(Colors.black),),
          )
        ],
      ),
    );
  }

}