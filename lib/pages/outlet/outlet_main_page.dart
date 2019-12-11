import 'package:flutter/material.dart';
import 'package:daily_wash/widgets/outlet/outlet_main.dart';
import 'package:provider/provider.dart';
import 'package:daily_wash/providers/outlet_info_provider.dart';

class OutletMainPage extends StatelessWidget{

  final int outletId;
  OutletMainPage({this.outletId});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(-22),
        child:  AppBar(
        ),
      ),
      body: ChangeNotifierProvider(
        child: OutletMain(),
        create: (_) => OutletInfoProvider(id: outletId),
      ),
    );
  }
}