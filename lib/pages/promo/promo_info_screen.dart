import 'package:flutter/material.dart';
import 'package:daily_wash/providers/promo_detail_provider.dart';
import 'package:daily_wash/widgets/promo/promo_info_main.dart';
import 'package:provider/provider.dart';

class PromoInfoScreen extends StatelessWidget{

  final int id;
  PromoInfoScreen({this.id});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Promo Detail'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => PromoDetailProvider(id: id),
        child: PromoInfoMain(),
      ),
    );
  }
}