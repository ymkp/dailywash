import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/widgets/home/services_box.dart';
import 'package:daily_wash/pages/outlet/outlets_by_service_screen.dart';

class ServicesContainer extends StatelessWidget{


  List<String> serviceItemNames = ['Regular', 'Dry Cleaning', 'Express', 'Iron','Helm','Delivery'];
  List<String> serviceImages = ['regular', 'dry_clean', 'express','iron','helm','delivery'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 6, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Tidak sempat mencuci?',style: h5(Colors.black),),
                Text('Kami Siap membersihkan berbagai barang anda',style: t3(Colors.grey),),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Servis', style: h6(Colors.black),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OutletsByServiceScreen(type: 'all',)));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                              color: dailyRed,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Text('Lihat Semua', style: h6(Colors.white),),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: serviceItemNames.length,
                itemBuilder: (context, i){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OutletsByServiceScreen(type: serviceImages[i],)));
                    },
                    child: ServiceBox(name: serviceItemNames[i],assetLocation: serviceImages[i],),
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}