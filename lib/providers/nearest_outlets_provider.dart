import 'package:flutter/material.dart';
import 'package:daily_wash/models/nearest_outlet_model.dart';
import 'package:http/http.dart' as http;
import 'package:daily_wash/constants/url_api.dart' as url;
import 'dart:convert';

enum NOPState {none, loading, error}

class NearestOutletsProvider with ChangeNotifier{

  String type;
  NearestOutletsProvider({this.type}) {
    print('init'+type);
    getNearestOutlets();
  }

  List<NearestOutlet> _outlets = [];
  List<NearestOutlet> get outlets => _outlets;
  List<NearestOutlet> _nearestOutlets = [];
  List<NearestOutlet> get nearestOutlets => _nearestOutlets;
  NOPState _state = NOPState.none;
  NOPState get state => _state;

  _changeState(NOPState state){
    _state = state;
    notifyListeners();
  }

  getNearestOutlets() async {
    _changeState(NOPState.loading);
    final response = await http.get(url.url+'nearest_outlets.json');
    if(response.statusCode == 200){
      _nearestOutlets = (json.decode(response.body)['outlets'] as List).map((f)=>NearestOutlet.fromJson(f)).toList();
      _outlets = _nearestOutlets;
      _changeState(NOPState.none);
      print('get nearest done');
      if(type != 'all'){
        changeOutletsByType([type]);
      }
    }else{
      print(response.statusCode);
      print(response.body);
      _changeState(NOPState.error);
    }
  }
  
  changeOutletsByName(String s){
    _outlets = _nearestOutlets.where((a) => a.name.toLowerCase().contains(s)).toList();
    notifyListeners();
  }
  
  changeOutletsByType(List<String> types){
    print(types);
    _outlets = _nearestOutlets;
    if(types.isNotEmpty){
      for(int i = 0;i<types.length;i++){
        _outlets = _outlets.where((a) => a.services.contains(types[i])).toList();
      }
    }

//    _outlets = _nearestOutlets.where((a) => a.services.contains(types)).toList();
    notifyListeners();
  }

  changeOutletsByDistance(double distance){
    print('distance : $distance');
    _outlets = _nearestOutlets;
    _outlets = _nearestOutlets.where((a) => a.distance <= distance).toList();
    notifyListeners();
  }
  
  
}