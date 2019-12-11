import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'tempat_duduk_model.dart';

class TempatDudukBox extends StatelessWidget{

  final TempatDuduk tempatDuduk;
  TempatDudukBox({this.tempatDuduk});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      top: sizeHorizontal * tempatDuduk.y,
      left: sizeHorizontal * tempatDuduk.x,
      child: GestureDetector(
        onTap: (){
          print(tempatDuduk.id.toString() +' is clicked');
        },
        child: Container(
          height: sizeHorizontal * 2 * 5,
          width: sizeHorizontal * (tempatDuduk.size/2) * 5,
          decoration: BoxDecoration(
            color: (tempatDuduk.condition == 'full')?dangerRed:(tempatDuduk.condition == 'half')?maerskBlue:successGreen,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(tempatDuduk.id.toString(),style: h4(Colors.white),),
        ),
      ),
    );
  }
}