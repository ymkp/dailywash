import 'package:flutter/widgets.dart';

enum PickerLoadingState {none, loading, error}

class PickerProvider with ChangeNotifier{
  double _pickupLong = 0.0;
  double get pickupLong => _pickupLong;
  double _pickupLat = 0.0;
  double get pickupLat => _pickupLat;
  String _pickupName = '';
  String get pickupName => _pickupName;
  String _pickupAddress = '';
  String get pickupAddress => _pickupAddress;

  double _destLong = 0.0;
  double get destLong => _destLong;
  double _destLat = 0.0;
  double get destLat => _destLat;
  String _destName = '';
  String get destName => _destName;
  String _destAddress = '';
  String get destAddress => _destAddress;

  PickerLoadingState _state = PickerLoadingState.none;
  PickerLoadingState get state => _state;

  _changeLoadingState(PickerLoadingState state){
    _state = state;
    notifyListeners();
  }

  setPickUp(double long, double lat, String name, String address){
    print('will it change?');
    _changeLoadingState(PickerLoadingState.loading);
    _pickupLong = long;
    _pickupLat = lat;
    _pickupAddress = address;
    _pickupName= name;
    _changeLoadingState(PickerLoadingState.none);
  }

  setDestination(double long, double lat, String name, String address){
    print('will it change?');
    _changeLoadingState(PickerLoadingState.loading);
    _destLong = long;
    _destLat = lat;
    _destAddress = address;
    _destName= name;
    _changeLoadingState(PickerLoadingState.none);
  }

}