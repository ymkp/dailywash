import 'package:flutter/material.dart';
import 'package:daily_wash/models/outlet_info_model.dart';
import 'package:http/http.dart' as http;
import 'package:daily_wash/constants/url_api.dart' as url;
import 'dart:convert';

enum OIPState {none, loading, error}

class OutletInfoProvider with ChangeNotifier {

  int id;
  OutletInfoProvider({this.id}){
    getOutletInfo(id);
  }

  OutletInfo _outletInfo;
  OutletInfo get outletInfo => _outletInfo;
  OIPState _state = OIPState.none;
  OIPState get state => _state;

  _changeState(OIPState state){
    _state = state;
    notifyListeners();
  }

  getOutletInfo(int id) async {
    _changeState(OIPState.loading);
    final response = await http.get(url.outletInfo+id.toString()+'.json');
    if(response.statusCode == 200) {
      _outletInfo = OutletInfo.fromJson(json.decode(response.body)['data']);
      _changeState(OIPState.none);
    }else{
      print(response.statusCode);
      print(response.body);
      _changeState(OIPState.error);
    }
  }
}