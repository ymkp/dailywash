import 'package:flutter/material.dart';
import 'package:daily_wash/widgets/outlet/outlets_by_distance_main.dart';
import 'package:provider/provider.dart';
import 'package:daily_wash/providers/nearest_outlets_provider.dart';

class OutletsByDistanceScreen extends StatelessWidget{

  final String type;
  OutletsByDistanceScreen({this.type});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Outlet Terdekat'),
        centerTitle: true,
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_)=>NearestOutletsProvider(type: type),
          )
        ],
        child: OutletsByDistanceMain(type: type,),
      ),
    );
  }
}