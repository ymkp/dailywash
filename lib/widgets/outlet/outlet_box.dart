import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_wash/pages/outlet/outlet_main_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class OutletBox extends StatelessWidget{

  final int id;
  final String name;
  final String address;
  final String image;
  final String businessHours;
  final double distance;

  OutletBox({this.id, this.name, this.address, this.image, this.businessHours, this.distance});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => OutletMainPage(outletId: id,)));
      },
      child: Container(
        margin: EdgeInsets.only(left: sizeHorizontal * 5),
        height: 210,
        width: 270,
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image)
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                height: 50,
                child: AutoSizeText(name,style: h6(Colors.black),maxLines: 2,),
              ),
//              Container(
//                padding: EdgeInsets.all(3),
//                height: 50,
//                child: AutoSizeText(address, style: t3(Colors.grey),maxLines: 2,),
//              )
              Container(
                width: 270,
                height: 50,
                padding: EdgeInsets.symmetric(vertical:3,horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 120,
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.mapMarkerAlt, color: dailyRed, size: 20,),
                          Container(
                            width: 90,
                            child: AutoSizeText('  '+distance.toString()+' KM',style: t4(Colors.black),maxLines: 1, minFontSize: 10,)
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidClock, color: warningOrange,size: 20, ),
                          Container(
                            width: 90,
                            child: AutoSizeText('  '+businessHours,style: t4(Colors.black), maxLines:  1, minFontSize: 10,),
                          )
                        ],
                      ),
                    ),                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}