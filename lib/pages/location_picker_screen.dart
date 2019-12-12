import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'dart:async';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
//import 'package:client/app/constants/var.dart' as vars;
import 'package:geolocator/geolocator.dart';
import 'package:daily_wash/providers/picker_provider.dart';


const apiKey = 'AIzaSyCsICft3IJZUwyOW5F00_A3_1qCXcva0zM';

class PickupPickerScreen extends StatefulWidget{

  final PickerProvider pickerProvider;
  final bool isPickup;
  PickupPickerScreen({@required this.pickerProvider, @required this.isPickup});

  @override
  _PickupPickerScreenState createState()=> _PickupPickerScreenState();
}

class _PickupPickerScreenState extends State<PickupPickerScreen>{

  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: apiKey);
  GoogleMapController mc;

  LatLng _center ;
  LatLng _lastMapPosition;
  loc.LocationData _locationData = loc.LocationData.fromMap({'latitude': 0.0,'longitude':0.0});
  String alamatNama = 'Klik di sini';
  String alamatDetail = 'untuk mencari';
  String zipCode = '';

  @override
  initState() {
    super.initState();
    // Add listeners to this class

    _init();
  }

  Future<void> displayPrediction(Prediction p) async {
    if (p != null) {
      print('isi p : '+p.toString());
      PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);

      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;
      setState(() {
        _lastMapPosition = LatLng(lat, lng);
      });

      mc.animateCamera(
          CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(lat, lng),
                  zoom: 20
              )
          )
      );
      var address = await Geocoder.local.findAddressesFromQuery(p.description);
      String thisAlamat = '';

      print('isi detail : '+detail.result.name);
      if(address.first.locality != '' && address.first.locality != null ){
        print('sublocality tidak kosong');
        print(address.first.locality);
        thisAlamat = address.first.locality;
      }else
      if(address.first.subAdminArea!= '' && address.first.subAdminArea!= null){
        print('subadmin tidak kosong');
        print(address.first.subAdminArea);
        thisAlamat = address.first.subAdminArea;
      }else
      if(address.first.subLocality != '' && address.first.subLocality != null ){
        print('sublocality tidak kosong');
        print(address.first.subLocality);
        thisAlamat = address.first.subLocality;
      }
      else if(detail.result.name !='' && detail.result.name != null){
        print('nama  tidak kosong');
        thisAlamat = detail.result.name;
      }
      else if(address.first.addressLine != '' && address.first.addressLine != null){
        print(' alamat tidak kosong');
        print(address.first.addressLine);
        thisAlamat = address.first.addressLine;
      }

      setState(() {
//        alamatNama = p.description.split(",").first;
        alamatNama = thisAlamat;
        alamatDetail = address.first.addressLine;
        zipCode = address.first.postalCode;
      });
      print('kodepos : $zipCode');


    }
  }

  _init()async {
    var location = await loc.Location();
    loc.LocationData l = await location.getLocation();
    setState(() {
      _locationData = l;
      _center =  LatLng(l.latitude, l.longitude);
      _lastMapPosition = _center;
    });
    print('long : '+_locationData.longitude.toString());
    print('lat : '+_locationData.latitude.toString());

  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mc = controller;
    });
  }

  _onCameraMove(CameraPosition position) {
    setState(() {
      _lastMapPosition = position.target;
    });
  }

  getAddress()async{
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(_lastMapPosition.latitude, _lastMapPosition.longitude);
    if(alamatNama == 'Klik di sini' || alamatNama == ''){
      print('alamatnama $alamatNama');
      setState(() {
        if(placemark.first.locality != '' && placemark.first.locality != null ){
          print('sublocality tidak kosong');
          print(placemark.first.locality);
          alamatNama = placemark.first.locality;
        }else
        if(placemark.first.subAdministrativeArea!= '' && placemark.first.subAdministrativeArea!= null){
          print('subadmin tidak kosong');
          print(placemark.first.subAdministrativeArea);
          alamatNama = placemark.first.subAdministrativeArea;
        }else
        if(placemark.first.locality != '' && placemark.first.locality != null ){
          print('sublocality tidak kosong');
          print(placemark.first.locality);
          alamatNama = placemark.first.locality;
        }else if(placemark.first.subLocality != '' && placemark.first.subLocality != null ){
          print('sublocality tidak kosong');
          print(placemark.first.subLocality);
          alamatNama = placemark.first.subLocality;
        }
        else if(placemark.first.name !='' && placemark.first.name != null){
          print('nama  tidak kosong');
          alamatNama = placemark.first.name;
        }
        else {
          print(' alamat tidak kosong');
          alamatNama = 'not found';
        }
//        alamatNama = placemark.first.thoroughfare+' '+placemark.first.subThoroughfare;
      });
      print('alamatnama $alamatNama');

    }
    if(alamatDetail == 'untuk mencari' || alamatDetail == ''){
      setState(() {
        alamatDetail = placemark.first.thoroughfare+''+placemark.first.subThoroughfare+' '+placemark.first.subLocality+' '+placemark.first.locality+' '+placemark.first.subAdministrativeArea+' '+placemark.first.administrativeArea;
      });
    }

    if(zipCode == ''){
      setState(() {
        zipCode = placemark.first.postalCode;
      });
    }else{
      setState(() {
        zipCode = placemark.first.postalCode;
      });
    }
    print('kode pos : $zipCode');
    print('administrative? : '+placemark.first.administrativeArea);
    print('subadministrative? : '+placemark.first.subAdministrativeArea);
    print('name? : '+placemark.first.name);
    print('locality? : '+placemark.first.locality);
    print('sublocality? : '+placemark.first.subLocality);
    print('thoroughfare? : '+placemark.first.thoroughfare);
    print('subthoroughfare? : '+placemark.first.subThoroughfare);

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text((widget.isPickup)?'Lokasi Pengambilan':'Lokasi Pengantaran'),
      ),
      body: (_locationData.longitude == 0.0)?Container(
        child: CircularProgressIndicator(),
        alignment: Alignment.center,
      ):Stack(
        children: <Widget>[
          googlemaps(),
          Positioned(
            bottom: 0,
            child: bottomCard(context),
          ),
          Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 70),
                child: Icon(Icons.place, size: 80, color: dailyRed,),
              )
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                color: Colors.grey[200],
                child: Text('lat : '+_lastMapPosition.latitude.toString()+'\nlong : '+_lastMapPosition.longitude.toString()),
              )
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: buttonNav(context),
          )
        ],
      ),
    );
  }

  searchLocation(){
    return FlatButton(
      onPressed: () async {
        // show input autocomplete with selected mode
        // then get the Prediction selected
        Prediction p = await PlacesAutocomplete.show(
            context: context,
            apiKey: apiKey,
            mode: Mode.fullscreen,
            language: "en"
        );
        displayPrediction(p);
      },
      child: ListTile(
        leading: Icon(Icons.search,color: Colors.green,),
        title: Container(
          width: sizeHorizontal * 80,
          child: AutoSizeText(alamatNama, style: h5(Colors.black),maxLines: 1,),
        ),
        subtitle: Container(
          child: AutoSizeText(alamatDetail,maxLines: 3,style: t2(Colors.black),),
        ),
      ),
    );
  }

  bottomCard(BuildContext context){
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 20),
      height: 180,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: searchLocation(),
    );
  }

  buttonNav(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width-40,
//      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,
        color: dailyRed,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FlatButton(
        onPressed: ()async{
          await getAddress();
//          if(alamatNama == 'Klik di sini' || alamatDetail == 'untuk mencari'){
//              await getAddress();
//          }
          (widget.isPickup)?
          await widget.pickerProvider.setPickUp(_lastMapPosition.longitude, _lastMapPosition.latitude, alamatNama, alamatDetail):
          await widget.pickerProvider.setDestination(_lastMapPosition.longitude, _lastMapPosition.latitude, alamatNama, alamatDetail);
          Navigator.pop(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context)=> Order3Screen())
          // );
        },
        child: Text(
          "Pilih Lokasi",
          style: TextStyle(
              fontSize: 17,
              color: Colors.white
          ),),
      ),
    );
  }

  googlemaps(){
    return GoogleMap(
      initialCameraPosition: CameraPosition(
          target: LatLng(_locationData.latitude, _locationData.longitude),
          zoom: 10),
      myLocationEnabled: true,
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      onCameraMove: _onCameraMove,
    );
  }
}