import 'package:flutter/material.dart';
import 'package:daily_wash/widgets/service/outlets_by_service_main.dart';
import 'package:provider/provider.dart';
import 'package:daily_wash/providers/nearest_outlets_provider.dart';

class OutletsByServiceScreen extends StatelessWidget{

  final String type;
  OutletsByServiceScreen({this.type});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Service'),
        centerTitle: true,
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_)=>NearestOutletsProvider(type: type),
            )
        ],
        child: OutletsByServiceMain(type: type,),
      ),
    );
  }
}