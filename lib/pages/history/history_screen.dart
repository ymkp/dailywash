import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:daily_wash/widgets/history/history_main.dart';


class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  DecoratedTabBar({@required this.tabBar, @required this.decoration});

  final TabBar tabBar;
  final BoxDecoration decoration;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(decoration: decoration)),
        tabBar,
      ],
    );
  }
}

class HistoryScreen extends StatefulWidget{

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HistoryScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          bottom: DecoratedTabBar(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.grey[300],
                        width: 2
                    )
                )
            ),
            tabBar: TabBar(
              indicatorPadding: EdgeInsets.all(0),
              labelPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
              unselectedLabelColor: Colors.grey,
              labelColor: dailyBlue,
              indicatorColor: dailyBlue,
              labelStyle: TextStyle(
                  fontFamily: 'SFProBold'
              ),
              tabs: [
                Container(
                    height: 47,
                    alignment: Alignment.bottomCenter,
//                      width: sizeHorizontal * 25,
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: AutoSizeText('Sedang Dicuci',maxLines: 1,),
                    )
                ),
                Container(
                    height: 47,
                    alignment: Alignment.bottomCenter,
//                      width: sizeHorizontal * 25,
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: AutoSizeText('Selesai',maxLines: 1),
                    )
                ),
              ],
            ),
          ),
          title: Text('Pesananku'),
          centerTitle: true,
        ),
        body: HistoryMain(),
      ),
    );
  }
}