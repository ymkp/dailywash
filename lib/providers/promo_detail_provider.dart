import 'package:flutter/material.dart';
import 'package:daily_wash/models/promo_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:daily_wash/constants/url_api.dart' as url;
import 'dart:convert';

enum PDPState {none, loading, error}

class PromoDetailProvider with ChangeNotifier {

  int id;
  PromoDetailProvider({this.id}){
    getPromoInfo(id);
  }

  PromoDetail _promoDetail;
  PromoDetail get promoDetail => _promoDetail;
  PDPState _state = PDPState.none;
  PDPState get state => _state;

  _changeState(PDPState state){
    _state = state;
    notifyListeners();
  }

  getPromoInfo(int id) async {
    _changeState(PDPState.loading);
    print('id : $id');
    final response = await http.get(url.promoInfo+'promo$id.json');
    if(response.statusCode == 200) {
      _promoDetail = PromoDetail.fromJson(json.decode(response.body)['data']);
      print(_promoDetail.image);
      _changeState(PDPState.none);
    }else{
      print(response.statusCode);
      print(response.body);
      _changeState(PDPState.error);
    }
  }
}