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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white
        ),
        width: 250,
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: sizeHorizontal * 25,
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
                padding: EdgeInsets.symmetric(vertical:3,horizontal: 5),
                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 100,
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.mapMarkerAlt, color: dailyRed, size: 20,),
                          Text('  '+distance.toString()+' KM',style: t4(Colors.black),)
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      child: Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.solidClock, color: warningOrange,size: 20, ),
                          Text('  '+businessHours,style: t4(Colors.black),)
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