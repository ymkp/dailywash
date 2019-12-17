import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:provider/provider.dart';
import 'package:daily_wash/providers/outlet_info_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_wash/widgets/outlet/outlet_detail_service_tabs.dart';
import 'package:daily_wash/pages/order/make_order_screen.dart';

class OutletMain extends StatefulWidget{

  @override
  _OutletMainState createState() => _OutletMainState();
}

class _OutletMainState extends State<OutletMain>{

  OutletInfoProvider oip;

  @override
  Widget build(BuildContext context) {
    oip = Provider.of<OutletInfoProvider>(context);
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        height: sizeVertical * 104,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              height: 250,
              width: sizeHorizontal * 100,
              decoration: (oip.state == OIPState.loading || oip.state == OIPState.error)?null: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(oip.outletInfo.image)
                  )
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child:  (oip.state == OIPState.loading || oip.state == OIPState.error)?Container():Text(oip.outletInfo.name, style: h4(Colors.white),)
                  ),
                  Positioned(
                    top: 30,
                    left: 0,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white,),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]))
              ),
              margin: EdgeInsets.only(left: sizeHorizontal * 6, right: sizeHorizontal * 6, top: 15),
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: sizeHorizontal * 5,
                        child: Icon(FontAwesomeIcons.mapMarked, size: 15,color: Colors.green,),
                      ),
                      Container(
                        width: sizeHorizontal * 80,
                        child: (oip.state == OIPState.loading || oip.state == OIPState.error)?Container():AutoSizeText(oip.outletInfo.address, style: t4(Colors.black),maxLines: 1, minFontSize: 8,),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.mapMarker, size: 15,color: dailyRed,),
                                    (oip.state == OIPState.loading || oip.state == OIPState.error)?Container():AutoSizeText(' '+oip.outletInfo.distance.toString()+' KM', style: t4(Colors.black),maxLines: 1, minFontSize: 8,)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.solidClock, size: 15,color: warningOrange,),
                                    (oip.state == OIPState.loading || oip.state == OIPState.error)?Container():AutoSizeText(' '+oip.outletInfo.businessHours, style: t4(Colors.black),maxLines: 1, minFontSize: 8,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              (oip.state == OIPState.loading || oip.state == OIPState.error || !oip.outletInfo.hasPromo)?Container():
                              Container(
                                width: sizeHorizontal * 17,
                                padding: EdgeInsets.symmetric(vertical: 2.5),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [warningOrange, Color(0xFFFFCA8B) ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text('Promo', textAlign: TextAlign.center, style: h7(Colors.white),),),
                              (oip.state == OIPState.loading || oip.state == OIPState.error )?Container():(oip.outletInfo.isOpen)?
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                width: sizeHorizontal * 17,
                                padding: EdgeInsets.symmetric(vertical: 2.5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF30A7A7),
                                          Color(0xFF59C3C3)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight
                                    )
                                ),
                                child: Text('Buka', textAlign: TextAlign.center, style: h7(Colors.white),),
                              ):
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                width: sizeHorizontal * 17,
                                padding: EdgeInsets.symmetric(vertical: 2.5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.grey)
                                ),
                                child: Text('Tutup', textAlign: TextAlign.center, style: h7(Colors.grey),),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            (oip.state == OIPState.loading || oip.state == OIPState.error )?Container():
            Expanded(
//            height: sizeVertical * 67,
              child: ServiceTab(outletInfo: oip.outletInfo,),
            ),
            orderDeliveryButton()


          ],
        ),
      ),
    );
  }
  orderDeliveryButton(){
    return  (oip.state == OIPState.loading || oip.state == OIPState.error )?Container(): GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MakeOrderScreen(outletInfo: oip.outletInfo,)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: sizeHorizontal * 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: dailyRed
        ),
        child: Text('Buat Pesanan Laundry',style: h5(Colors.white),textAlign: TextAlign.center,),
      ),
    );
  }
}