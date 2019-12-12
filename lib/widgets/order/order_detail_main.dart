import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daily_wash/providers/order_detail_provider.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/models/order_detail_model.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';


class OrderDetailMain extends StatefulWidget{

  @override
  _OrderDetailMainState createState() => _OrderDetailMainState();
}
class _OrderDetailMainState extends State<OrderDetailMain>{

  OrderDetailProvider odp;
  final formatter = new NumberFormat("#,###");


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    odp = Provider.of<OrderDetailProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          statusCircles(),
          outletDetail(),
          detailOrderBox(),


        ],
      ),
    );
  }

  statusCircles(){
    return Container(
      margin : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: sizeHorizontal * 16,

//            margin : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(10),
                  margin : EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (odp.state == ODPState.loading || odp.state == ODPState.error)?Colors.white:(odp.orderDetail.status > 1)?dailyBlue:Colors.cyanAccent,
                      border: Border.all(color: dailyBlue)
                  ),
                  child: Image.asset('res/icons/status1.png', scale: 8,),
                ),
                AutoSizeText('Dalam Antrian' , style: t4(Colors.black),minFontSize: 4,maxLines: 1,)
              ],
            ),
          ),
          Container(
            width: sizeHorizontal * 16,

//            margin : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(10),
                  margin : EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (odp.state == ODPState.loading || odp.state == ODPState.error)?Colors.white:(odp.orderDetail.status > 2)?dailyBlue:Colors.cyanAccent,
                      border: Border.all(color: dailyBlue)
                  ),
                  child: Image.asset('res/icons/status2.png',scale: 10,),
                ),
                AutoSizeText('Sudah Dicuci' , style: t4(Colors.black),maxLines: 1,minFontSize: 4,)
              ],
            ),
          ),
          Container(
            width: sizeHorizontal * 16,

//            margin : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(10),
                  margin : EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (odp.state == ODPState.loading || odp.state == ODPState.error)?Colors.white:(odp.orderDetail.status > 3)?dailyBlue:Colors.cyanAccent,
                      border: Border.all(color: dailyBlue)
                  ),
                  child: Image.asset('res/icons/status3.png',scale: 10,),
                ),
                AutoSizeText('Siap Diambil' , style: t4(Colors.black),minFontSize: 4,maxLines: 1,)
              ],
            ),
          ),
          Container(
            width: sizeHorizontal * 16,

//            margin : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: <Widget>[
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(10),
                  margin : EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (odp.state == ODPState.loading || odp.state == ODPState.error)?Colors.white:(odp.orderDetail.status > 4)?dailyBlue:Colors.cyanAccent,
                      border: Border.all(color: dailyBlue)
                  ),
                  child: Image.asset('res/icons/status99.png',scale: 10,),
                ),
                AutoSizeText('Selesai' , style: t4(Colors.black),minFontSize: 8,maxLines: 1,)
              ],
            ),
          )
        ],
      ),
    );
  }

  outletDetail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 6,vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]))
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Container(
                  width: sizeHorizontal * 10,
                  height: sizeHorizontal * 10,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('res/icons/outlet_logo.png'),
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text((odp.state == ODPState.loading || odp.state == ODPState.error)?'---':odp.orderDetail.outletName, style: h5(Colors.black),),
                      ),
                      Container(
                        child: Text((odp.state == ODPState.loading || odp.state == ODPState.error)?'':(odp.orderDetail.service.isSelfService)?odp.orderDetail.service.selfServiceDetail:'', style: t4(Colors.black),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: sizeHorizontal * 10,
                  height: sizeHorizontal * 10,
                  child:Image.asset('res/icons/outlet_time.png',scale: 5,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 7),
                  child:  Text((odp.state == ODPState.loading || odp.state == ODPState.error)?'---':'Selesai '+odp.orderDetail.service.dateFinished, style: t3(Colors.black),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  detailOrderBox(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 6),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Detail Pesanan', style: t4(Colors.grey),),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 30,
                              height: 30,
                              child: (odp.state == ODPState.loading || odp.state == ODPState.error)?null: Image.asset('res/icons/service_'+odp.orderDetail.service.type+'_small.png'),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: (odp.state == ODPState.loading || odp.state == ODPState.error)?null: Text(odp.orderDetail.service.name, style: h6(Colors.black),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: (odp.state == ODPState.loading || odp.state == ODPState.error)?null: Text(odp.orderDetail.service.dateCreated, style: t4(Colors.grey),),
                      )
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Cucian', style: t4(Colors.grey),),
                ),
                (odp.state == ODPState.loading || odp.state == ODPState.error)?Container():
                 Container(
                   margin: EdgeInsets.symmetric(vertical: 10),
                   child: ListView.builder(
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemCount: odp.orderDetail.service.serviceDetails.length,
                       itemBuilder: (context, i){
                       return Container(
                         margin: EdgeInsets.symmetric(vertical: 7),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             Container(
                               child: Row(
                                 children: <Widget>[
                                   Container(
                                     width:sizeHorizontal * 10,
                                     child: Text(odp.orderDetail.service.serviceDetails[i].quantity.toString()+'x',style: t3(Colors.black),),
                                   ),
                                   Container(
                                     width:sizeHorizontal * 40,
                                     child: Text(odp.orderDetail.service.serviceDetails[i].name,style: t3(Colors.black),),
                                   )
                                 ],
                               ),
                             ),
                             Container(
//                               width:sizeHorizontal * 30,
                               child: Text('Rp '+formatter.format((odp.orderDetail.service.serviceDetails[i].quantity * odp.orderDetail.service.serviceDetails[i].price)).replaceAll(',', '.'),style: t3(Colors.black),),
                             )
                           ],
                         ),
                       );
                       }
                   ),
                 )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Total Biaya ('+ ((odp.state == ODPState.loading || odp.state == ODPState.error)?'':getOrderQuantity(odp.orderDetail.service.serviceDetails).toString())+' pcs)', style: h5(Colors.black),),
                Text('Rp '+((odp.state == ODPState.loading || odp.state == ODPState.error)?'':getOrderPrice(odp.orderDetail.service.serviceDetails).toString()), style: h5(Colors.black))
              ],
            ),
          )
        ],
      ),
    );
  }

  int getOrderQuantity(List<ServiceDetail> sds){
    int i = 0;
    for(ServiceDetail sd in sds){
      i += sd.quantity;
    }
    return i;
  }

  int getOrderPrice(List<ServiceDetail> sds){
    int rp = 0;
    for(ServiceDetail sd in sds){
      rp += (sd.quantity * sd.price);
    }
    return rp;
  }
}