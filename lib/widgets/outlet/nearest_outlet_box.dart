import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/models/nearest_outlet_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:daily_wash/pages/outlet/outlet_main_page.dart';

class NearestOutletBox extends StatelessWidget{

  final NearestOutlet outlet;
  NearestOutletBox({this.outlet});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => OutletMainPage(outletId: outlet.id,)));
      },
      child:  Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]))
        ),
        margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 6, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: sizeHorizontal * 13,
                          height: sizeHorizontal * 13,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              image: DecorationImage(
                                  image: NetworkImage(outlet.image)
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: sizeHorizontal * 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: sizeHorizontal * 50,
                                child: AutoSizeText(outlet.name, style: h6((outlet.isOpen)?Colors.black:Colors.grey,),maxLines: 1,minFontSize: 10,),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                width: sizeHorizontal * 50,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: sizeHorizontal * 25,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(FontAwesomeIcons.mapMarkerAlt, color: (outlet.isOpen)?dailyRed:Colors.grey,size: 12,),
                                          Text(' '+outlet.distance.toString()+' KM', style: t4((outlet.isOpen)?Colors.black:Colors.grey,),)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: sizeHorizontal * 25,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(FontAwesomeIcons.solidClock, color: (outlet.isOpen)?warningOrange:Colors.grey,size: 12,),
                                          Text(' '+outlet.businessHours,style: t4((outlet.isOpen)?Colors.black:Colors.grey,))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      (outlet.hasPromo)?Container(
                        padding: EdgeInsets.symmetric(vertical: 2.5),
                        alignment: Alignment.center,
                        width: sizeHorizontal * 17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                              colors: [
                                warningOrange,
                                Color(0xFFFFCA8B)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight
                          ),
                        ),
                        child: Text('Promo', style: h7(Colors.white),),
                      ):Container(),
                      (!outlet.isOpen)?Container(
                        padding: EdgeInsets.symmetric(vertical: 2.5),
                        alignment: Alignment.center,
                        width: sizeHorizontal * 17,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Text('Tutup', style: h7(Colors.grey),),
                      ):Container()
                    ],
                  ),
                ],
              ),
            ),
            serviceBox()
          ],
        ),
      ),
    );
  }

  serviceBox(){
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: sizeHorizontal * 10,
            child: Text('Jasa', style: t3(Colors.grey),),
          ),
          Container(
            height: 50,
            width: sizeHorizontal * 75,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
                itemCount: outlet.services.length,
                itemBuilder: (context, i){
                return serviceIcon(outlet.services[i]);
                }
            ),
          )
        ],
      ),
    );
  }

  serviceIcon(String type){
    return Container(
//      height: 50,
//      width: 50,
      margin: EdgeInsets.only(left: 3,top: 10,bottom: 10),
      child: (type == 'regular')?Image.asset('res/icons/service_regular_small.png'):(type == 'express')?Image.asset('res/icons/service_express_small.png'):(type == 'helm')?Image.asset('res/icons/service_helm_small.png'):(type == 'delivery')?Image.asset('res/icons/service_delivery_small.png'):(type == 'iron')?Image.asset('res/icons/service_iron_small.png'):(type == 'dry_clean')?Image.asset('res/icons/service_dry_clean_small.png'):Image.asset('res/icons/service_regular_small.png'),
    );
  }
}