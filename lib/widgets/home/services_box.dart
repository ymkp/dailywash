import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ServiceBox extends StatelessWidget{

  final String name;
  final String assetLocation;

  ServiceBox({this.name, this.assetLocation});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: sizeHorizontal * 5),
      height: 100,
      width: 100,
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 7, horizontal: 3),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                width: 45,
                height: 45,
                child: Image.asset('res/icons/service_$assetLocation.png'),
              ),
              Text(name,style: t4(Colors.black),)
            ],
          ),
        ),
      ),
    );
  }
}


class ServiceBoxSmall extends StatefulWidget{
  final String name;
  final String assetLocation;
  final bool isSelected;
  final state = _ServiceBoxSmallState();
  ServiceBoxSmall({this.name, this.assetLocation, this.isSelected});

  _ServiceBoxSmallState createState() => state;

  void changeSelected() => state.changeSelected();

}
class _ServiceBoxSmallState extends State<ServiceBoxSmall>{

  bool isSelected = false;

  @override
  initState(){
    super.initState();
    isSelected = widget.isSelected;
  }

  changeSelected(){
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: sizeHorizontal * 5),
          height: 75,
          width: 75,
          child: Card(
            elevation: 3,
            child: Container(
              padding: EdgeInsets.symmetric( horizontal: 3,),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 45,
                    height: 45,
                    child: Image.asset('res/icons/service_'+widget.assetLocation+'_small.png'),
                  ),
                  AutoSizeText(widget.name,style: t4(Colors.black),minFontSize: 5,maxLines: 1,)
                ],
              ),
            ),
          ),
        ),
        (isSelected)?Container(
          decoration: BoxDecoration(
            border: Border.all(color: dangerRed),
            color: Color(0x33F22E46),
            borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          margin: EdgeInsets.only(left: (sizeHorizontal * 5)),
          width: 75,
          height: 75,
        ):Container()
      ],
    );
  }
}