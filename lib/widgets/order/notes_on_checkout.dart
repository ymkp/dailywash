import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';

class NotesOnCheckout extends StatefulWidget{

  final String initialText;
  NotesOnCheckout({this.initialText});
  final state = _NotesOnCheckoutState();
  @override
  _NotesOnCheckoutState createState() => state;

  String get text => state.notesCtrl.text;
}

class _NotesOnCheckoutState extends State<NotesOnCheckout>{

  TextEditingController notesCtrl = TextEditingController();
  FocusNode notesFocus = FocusNode();
  int notesTextCount = 0;

  @override
  initState(){
    super.initState();
    notesCtrl.text = widget.initialText;
    notesTextCount = notesCtrl.text.length;
    notesCtrl.addListener(checkTextCount);
  }

  checkTextCount(){
    setState(() {
      notesTextCount = notesCtrl.text.length;
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 10),
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          border: Border.all(color: dailyBlueShadow)
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: TextFormField(
              controller: notesCtrl,
              focusNode: notesFocus,
              style: t3(Colors.black),
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: t3(Colors.grey),
                  hintText: 'Es teh tiga'
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: Text( notesTextCount.toString()+'/ 200', style: t3(Colors.grey),textAlign: TextAlign.end,)
          )
        ],
      ),
    );
  }
}