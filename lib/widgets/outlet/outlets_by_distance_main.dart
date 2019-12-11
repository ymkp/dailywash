import 'package:daily_wash/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daily_wash/models/nearest_outlet_model.dart';
import 'package:daily_wash/providers/nearest_outlets_provider.dart';
import 'package:daily_wash/widgets/outlet/outlets_main_page.dart';
import 'package:daily_wash/widgets/home/services_box.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class OutletsByDistanceMain extends StatefulWidget{

  final String type;
  OutletsByDistanceMain({this.type});

  @override
  _OutletsByServiceMain createState() => _OutletsByServiceMain();
}

class _OutletsByServiceMain extends State<OutletsByDistanceMain>{

  NearestOutletsProvider nop;

  List<String> selectedType = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    nop = Provider.of<NearestOutletsProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: sizeHorizontal * 40,
                  child:  Text('Atur Jarak', style: h5(Colors.black),),
                ),
                Container(
                  width: sizeHorizontal * 20,
//                  child:  Text('Filter', style: t3(Colors.black),),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 6),
            alignment: Alignment.centerLeft,
            child: Text(_lowerValue.toString()+' KM',style: h4(dailyRed),),
          ),
          sliderDistance(),
          searchBox(),

          Container(
            child: (nop.state == NOPState.loading)?CircularProgressIndicator():(nop.state == NOPState.none)?OutletsMain(outlets: nop.outlets,):Text('wew'),
          )
        ],
      ),
    );
  }
  double _lowerValue = 5;
  double _upperValue;

  sliderDistance(){
    return Container(
      padding: EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          FlutterSlider(

            handlerHeight: 20,
            handler: FlutterSliderHandler(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dailyRed
              ),
              child: Icon(Icons.lens,size: 13, color: Colors.white,),
            ),
            trackBar: FlutterSliderTrackBar(
                activeTrackBarHeight: 5,
                activeTrackBar: BoxDecoration(
                    color: dailyRed
                )
            ),
            values: [5],
            onDragCompleted: (i,x,y){
              nop.changeOutletsByDistance(x.toDouble());
            },
            max: 20,
            min: 0,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              _lowerValue = lowerValue;
              _upperValue = upperValue;
              setState(() {});
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: sizeHorizontal*6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('0 KM',style: t3(Colors.grey),),
                Text('20 KM',style: t3(Colors.grey),)
              ],
            ),
          )
        ],
      ),
    );
  }



  TextEditingController searchCtrl = TextEditingController();
  FocusNode searchFocus = FocusNode();

  searchBox(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: sizeHorizontal * 6),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        style: t3(Colors.black),
        onChanged: (String s){
          nop.changeOutletsByName(s);
        },
        decoration: InputDecoration(
            hintStyle: t3(Colors.grey),
            border: InputBorder.none,
            icon: Icon(Icons.search),
            hintText: 'Cari berdasarkan nama outlet'
        ),
      ),
    );
  }
}