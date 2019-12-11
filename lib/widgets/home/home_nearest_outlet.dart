import 'package:flutter/material.dart';
import 'package:daily_wash/widgets/outlet/outlet_box.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/pages/outlet/outlet_by_distance_screen.dart';

class HomeNearestOutlet extends StatelessWidget{

  final List<Map<String, dynamic>> nearestLaundries = [
    {
      'id':1,
      'image':'https://picsum.photos/seed/laundry1/200/300',
      'name':'Laundry Perkasa',
      'address':'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'distance' : 0.3,
      'business_hours' : '09.00 - 20.00'
    },
    {
      'id':2,
      'image':'https://picsum.photos/seed/laundry2/200/300',
      'name':'Bu Cin - Menteng atas',
      'address':'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'distance' : 1.5,
      'business_hours' : '09.00 - 23.00'
    },
    {
      'id':3,
      'image':'https://picsum.photos/seed/laundry3/200/300',
      'name':'Laundry Perkasa',
      'address':'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'distance' : 3.0,
      'business_hours' : '07.00 - 21.00'
    },
    {
      'id':4,
      'image':'https://picsum.photos/seed/laundry4/200/300',
      'name':'Laundry Doa Ibu',
      'address':'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      'distance' : 9.2,
      'business_hours' : '00.00 - 24.00'
    },

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: sizeHorizontal * 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Outlet Terdekat', style: h5(Colors.black),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Outlet kami yang paling dekat', style:t3(Colors.grey)),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> OutletsByDistanceScreen(type: 'all',)));
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
                )
              ],
            ),
          ),
          SizedBox(
            height: 190,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: nearestLaundries.length,
                itemBuilder: (context, i){
                  return OutletBox(
                    id: nearestLaundries[i]['id'],
                    address: nearestLaundries[i]['address'],
                    image: nearestLaundries[i]['image'],
                    name: nearestLaundries[i]['name'],
                    businessHours: nearestLaundries[i]['business_hours'],
                    distance: nearestLaundries[i]['distance'],
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}