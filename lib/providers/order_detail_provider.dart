import 'package:flutter/material.dart';
import 'package:daily_wash/models/order_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:daily_wash/constants/url_api.dart' as url;
import 'dart:convert';

enum ODPState {none, loading, error}

class OrderDetailProvider with ChangeNotifier{

  int id;
  String orderId;
  OrderDetailProvider({this.orderId, this.id}){
    getOrderDetail(id, orderId);
  }
  OrderDetail _orderDetail;
  OrderDetail get orderDetail => _orderDetail;
  ODPState _state = ODPState.none;
  ODPState get state => _state;

  _changeState(ODPState state){
    _state = state;
    notifyListeners();
  }

  getOrderDetail(int id, String orderId) async {
    _changeState(ODPState.loading);
    final response = await http.get(url.orderInfo+orderId.toLowerCase()+'.json');
    if(response.statusCode == 200) {
      _orderDetail = OrderDetail.fromJson(json.decode(response.body)['data']);
      _changeState(ODPState.none);
    }else{
      print(response.statusCode);
      print(response.body);
      _changeState(ODPState.error);
    }
  }
}