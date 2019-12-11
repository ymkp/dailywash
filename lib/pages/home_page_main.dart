import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/pages/home/home_page_screen.dart';
import 'package:daily_wash/pages/history/history_screen.dart';
import 'package:daily_wash/pages/profile/profile_screen.dart';
import 'package:daily_wash/pages/inbox/inbox_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageMain extends StatefulWidget{

  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain>{


    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      renderIcons();
    }

    List<Widget> homeIcon =[];
    List<Widget> historyIcon =[];
    List<Widget> inboxIcon =[];
    List<Widget> accountIcon =[];

    renderIcons(){
      homeIcon.add(Container(child: Image.asset('res/icons/home0.png'),height: 20,));
      homeIcon.add(Container(child: Image.asset('res/icons/home1.png'),height: 20));
      historyIcon.add(Container(child: Image.asset('res/icons/history0.png'),height: 20));
      historyIcon.add(Container(child: Image.asset('res/icons/history1.png'),height: 20));
      inboxIcon.add(Container(child: Image.asset('res/icons/inbox0.png'),height: 20));
      inboxIcon.add(Container(child: Image.asset('res/icons/inbox1.png'),height: 20));
      accountIcon.add(Container(child: Image.asset('res/icons/profile0.png'),height: 20));
      accountIcon.add(Container(child: Image.asset('res/icons/profile1.png'),height: 20));
    }

    int selectedIndex = 0;
    List<Widget> widgets = <Widget>[
      HomePageScreen(),
      HistoryScreen(),
      InboxScreen(),
      ProfileScreen()
    ];

    onItemTap(int index){
      setState(() {
        selectedIndex = index;
      });
    }

    @override
    Widget build(BuildContext context) {
      return  Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.transparent),
        child: Scaffold(
          // appBar: AppBar(),
          body:  widgets.elementAt(selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem> [
              BottomNavigationBarItem(activeIcon: homeIcon[1],icon: homeIcon[0], title: Text("Beranda", style: TextStyle(fontSize: 10),)),
              BottomNavigationBarItem(activeIcon: historyIcon[1],icon: historyIcon[0], title: Text("Pesananku", style: TextStyle(fontSize: 10))),
              BottomNavigationBarItem(activeIcon: inboxIcon[1],icon: inboxIcon[0], title: Text("Kotak Masuk", style: TextStyle(fontSize: 10))),
              BottomNavigationBarItem(activeIcon: accountIcon[1],icon: accountIcon[0], title: Text("Profil", style: TextStyle(fontSize: 10))),
            ],
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: redLogo,
            onTap: onItemTap,
          ),

        ),
      );
    }
}