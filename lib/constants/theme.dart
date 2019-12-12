import 'package:flutter/material.dart';

//USER INFO
int userId;
List<String> months = ['','January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
List<String> nameOfDay = ['','Monday', 'Tuesday', 'Wednesday','Thursday','Friday','Saturday','Sunday'];
double sizeHorizontal;
double sizeVertical;
Widget chatIconTheme;

class SizeConfig {
  static MediaQueryData  _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  static double _safeAreaHorizontal;
  static double _safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    sizeHorizontal = safeBlockHorizontal;
    sizeVertical = safeBlockVertical;
//    chatIconTheme = Container(child: SvgPicture.asset('res/graphics/chat00.svg',color: Colors.white,),height: 50,width: 50,);


  }
}

//------------------------------------------TEXTSTYLE
TextStyle h0(Color color) => TextStyle(
    fontSize: sizeHorizontal * 10,
    fontWeight: FontWeight.bold,
    color: color,
    fontFamily: 'SFProBold'
);

TextStyle h1(Color color) => TextStyle(
    fontSize: sizeHorizontal * 8.5,
    fontWeight: FontWeight.bold,
    color: color,
    fontFamily: 'SFProBold'
);

TextStyle h2 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 7,
    fontWeight: FontWeight.bold,
    color: color,
    fontFamily: 'SFProBold'

);

TextStyle h3 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 6,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFProBold',
    color: color

);

TextStyle h4 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 5,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFProBold',
    color: color
);

TextStyle h5 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 4,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFProBold',
    color: color
);

TextStyle h6 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 3,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFProBold',
    color: color
);

TextStyle h7 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 2.5,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFProBold',
    color: color
);

TextStyle t1 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 5,
    color: color

);

TextStyle t2 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 4,
    color: color
);

TextStyle t3 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 3,
    color: color
);

TextStyle t4 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 2.5,
    color: color
);

TextStyle t3U (Color color) => TextStyle(
    fontSize: sizeHorizontal * 3,
    color: color,
  decoration: TextDecoration.underline
);

TextStyle t5 (Color color) => TextStyle(
    fontSize: sizeHorizontal * 2,
    color: color
);

TextStyle ctaOrange = TextStyle(
    fontSize: sizeHorizontal * 4,
//    fontWeight: FontWeight.bold,
    color: Colors.white
);

TextStyle ctaWhite = TextStyle(
  color: maerskBlue,
  fontSize: sizeHorizontal * 4,
//    fontWeight: FontWeight.bold
);

//-----------------------color_section
const Color maerskBlue = Color(0xFF42B0D5);
const Color maerskBlue100 = Color(0x2542B0D5);
const Color anotherBlue = Color(0xFF128FC8);
const Color youngBlue = Color(0xFFB5E1F6);
const Color darkBlue = Color(0xFF04233C);
const Color blueFive = Color(0xFF058EC6);
const Color lightBlue = Color(0xFF85E0F4);
const Color darkGrey = Color(0xFF474747);
const Color greyTwo = Color(0xFF535353);
const Color successGreen = Color(0xFF8bc24a);
const Color dangerRed = Color(0xFFff4421);
const Color warningOrange = Color(0xffff9700);

const Color creamLogo = Color(0xFFD8D7C5);
const Color blueLogo = Color(0xFF4C5359);
const Color redLogo = Color(0xFFED1B24);

const Color dailyRed = Color(0xFFF22E46);
const Color dailyRedShadow = Color(0x55F22E46);

const Color dailyBlue = Color(0xFF003459);
const Color dailyBlueShadow = Color(0x55003459);

const Color dailyWhite = Color(0xFFF8F8F8);
//-------------------------------------


//--------------------------------------------
void showInSnackBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
    String value, int status) {
  Color color;
  if (status == 1) {
    color = successGreen;
  } else if (status == 2) {
    color = warningOrange;
  } else if (status == 3) {
    color = dangerRed;
  } else if (status == 4) {
    color = maerskBlue;
  }
  FocusScope.of(context).requestFocus(FocusNode());
  scaffoldKey.currentState?.removeCurrentSnackBar();
  scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(
      value,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 16.0, fontFamily: "ZettaSans"),
    ),
    backgroundColor: color,
    duration: Duration(milliseconds: 2200),
  ));
}


void showSnackBarHigh(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
    String value, int status) {
  TextEditingController opoikiCtrl = TextEditingController();
  Color color;
  if (status == 1) {
    color = successGreen;
  } else if (status == 2) {
    color = warningOrange;
  } else if (status == 3) {
    color = dangerRed;
  } else if (status == 4) {
    color = maerskBlue;
  }
//  FocusScope.of(context).requestFocus(FocusNode());
  scaffoldKey.currentState?.removeCurrentSnackBar();
  scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Container(
        height: 300,
        child: Column(
          children: <Widget>[
            Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 16.0, fontFamily: "ZettaSans"),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: TextFormField(
                style: t2(Colors.black),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                controller: opoikiCtrl,
                decoration: InputDecoration(
                    border: InputBorder.none
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: FlatButton(
                onPressed: (){
                  scaffoldKey.currentState?.removeCurrentSnackBar();
                },
                child: Text('OK',style: h3(Colors.white),),
              ),
            )
          ],
        )
    ),
    backgroundColor: color,
    duration: Duration(seconds: 2200),
  ));
}
// -------------------------------------------------------//

infoBox({String title, String subtitle}){
  return Container(
      padding: EdgeInsets.symmetric(horizontal: sizeHorizontal * 4, vertical: 10),
      margin: EdgeInsets.only(bottom: 10, top: 15,left: sizeHorizontal * 4, right: sizeHorizontal * 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.info_outline,color: maerskBlue,),
                Text(
                  title
                  , style: h5(Colors.black),)
              ],
            ),
          ),
          Text(
            subtitle
            ,style: t3(Colors.black),
          ),
        ],
      )
  );
}

loadingContainer({double height, double width}){
  return Container(
    margin: EdgeInsets.only(top: 15),
    height: height,
    width: width,
    decoration:  BoxDecoration(
      color: dailyRedShadow,
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

showDialogWarning({BuildContext context, String title, String description}){
  return showDialog(
      context: context,
      builder: (context)=>Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        elevation: 0,
//      backgroundColor: Colors.transparent,
        child: Container(
//        padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: maerskBlue100
                ),
                width: 50,
                height: 50,
                child:Icon(Icons.error_outline, color: maerskBlue,size: 50,),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  title,
                  style: h4(Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),

                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: t2(Colors.grey),
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                  margin: EdgeInsets.only(bottom: 15),
//            height: 200,
                  width: sizeHorizontal * 50,
//                margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      shape: BoxShape.rectangle,
                      color: maerskBlue
                  ),
                  child: FlatButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'OK',
                        style: h5(Colors.white),
                      )
                  )
              )
            ],
          ),
        ),
      )
  );
}
String getDateAsString(String s){
  DateTime d = DateTime.parse(s);
  return nameOfDay[d.weekday]+', '+d.day.toString()+' '+months[d.month]+' '+d.year.toString();
}

String getDateAsTimeClock(String s){
  DateTime d = DateTime.parse(s);
  return d.hour.toString()+':'+d.minute.toString();
}

showDialogLoadingTheme({BuildContext context}){
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context)=>Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ));
}