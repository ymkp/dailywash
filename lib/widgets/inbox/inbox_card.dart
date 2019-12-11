import 'package:flutter/material.dart';
import 'package:daily_wash/models/inbox_model.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';

class InboxCard extends StatelessWidget{

  final Inbox inbox;

  InboxCard({this.inbox});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        print(inbox.id.toString()+' clicked');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom:BorderSide(color: Colors.grey[200]))
        ),
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: sizeHorizontal * 4),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: dailyRed
                    ),
                    width: sizeHorizontal * 10,
                    child: Icon(Icons.mail, color: Colors.white,),
                  ),
                  Container(
                    width: sizeHorizontal * 77,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AutoSizeText(inbox.title, maxLines: 1,minFontSize: 10,style: h6(Colors.black),),
                        AutoSizeText(inbox.subTitle, maxLines: 1,minFontSize: 10,style: t4(Colors.black),),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(),
                  Container(
                    child: Text(inbox.date, style: t4(Colors.grey),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}