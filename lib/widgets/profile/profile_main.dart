import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileMain extends StatefulWidget{

  @override
  _ProfileMainState createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 6),
        child: Column(
          children: <Widget>[
            headerProfileWithPhoto(),
            pointContainer(),
            profileButtons(),
            logoutContainer()
          ],
        ),
      ),
    );
  }



  headerProfileWithPhoto(){
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: sizeHorizontal * 90,
            height: 100,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: dailyRed
                    ),
                    child: Icon(FontAwesomeIcons.userAstronaut, color: Colors.white, size: 99,),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 50,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: (){
                      print('tapped');
                    },
                    child: Container(
                      child: Text('Ubah Profil', style: t4(Colors.black),),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text('Yochanan Maranatha Kristian Putra', style: h6(Colors.black),),
          )
        ],
      ),
    );
  }

  pointContainer(){
    return Container(
      margin: EdgeInsets.only(bottom: 15, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: sizeHorizontal * 20,
                  height: sizeHorizontal * 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dailyRedShadow,
                  ),
                  child: Icon(FontAwesomeIcons.shoppingBasket, color: dailyRed, size: sizeHorizontal * 10,),
                ),
                Container(
                  child: Text('4', style: h2(Colors.black),),
                ),
                Container(
                  child: Text('Total Mencuci', style: t4(Colors.grey),),
                )
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            width: 1,
            height: 100,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: sizeHorizontal * 20,
                  height: sizeHorizontal * 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFE7D4),
                  ),
                  child: Icon(FontAwesomeIcons.coins, color: Color(0xFFFEB73D), size: sizeHorizontal * 10,),
                ),
                Container(
                  child: Text('9838', style: h2(Colors.black),),
                ),
                Container(
                  child: Text('Poin Terkumpul', style: t4(Colors.grey),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  profileButtons(){
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: sizeHorizontal * 75,
                    child: Text('Ajak Teman', style: t3(Colors.black),),
                  ),
                  Container(
                    child: Icon(Icons.chevron_right, color: Colors.black,),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: sizeHorizontal * 75,
                    child: Text('FAQ', style: t3(Colors.black),),
                  ),
                  Container(
                    child: Icon(Icons.chevron_right, color: Colors.black,),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    width: sizeHorizontal * 75,
                    child: Text('Terms of Service', style: t3(Colors.black),),
                  ),
                  Container(
                    child: Icon(Icons.chevron_right, color: Colors.black,),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  logoutContainer(){
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('The Daily Wash App v 0.01', style: t4(Colors.grey),),
          GestureDetector(
            onTap: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear();
              Navigator.of(context).pushNamedAndRemoveUntil('Login', (Route<dynamic> route) => false);
            },
            child: Container(
              child: Text('Logout', style: h7(dailyRed),),
            ),
          )
        ],
      ),
    );
  }
}