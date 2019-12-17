import 'package:flutter/material.dart';
import 'package:daily_wash/constants/theme.dart';
import 'package:daily_wash/models/outlet_info_model.dart';
import 'package:intl/intl.dart';


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
        Positioned(left: 0,bottom:0,child: Container(decoration: decoration)),
        tabBar,
      ],
    );
  }
}

class ServiceTab extends StatefulWidget{

  final OutletInfo outletInfo;
  ServiceTab({this.outletInfo});

  @override
  _ServiceTabState createState() => _ServiceTabState();
}

class _ServiceTabState extends State<ServiceTab>{

  List<Widget> tabs = [];
  List<Widget> tabContents = [];
  final formatter = new NumberFormat("#,###");



  init(){
    for(Service s in widget.outletInfo.services){
      tabs.add(Container(
        alignment: Alignment.topCenter,

        width: 50,
        height: 50,
        child: Image.asset('res/icons/service_'+s.name+'_small.png'),
      ));
      tabContents.add(tabContent(s));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            leading: Container(),
            bottom: DecoratedTabBar(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey[200],
                          width: 2
                      )
                  )
              ),
              tabBar: TabBar(
                isScrollable: true,
                indicatorPadding: EdgeInsets.all(0),
                labelPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                indicatorColor: dailyRed,
                labelStyle: TextStyle(
                    fontFamily: 'SFProBold'
                ),
                tabs: tabs,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: tabContents,
        ),
      ),
    );
  }

  tabContent(Service service){
    return Container(
      margin: EdgeInsets.only(left: sizeHorizontal * 6, right: sizeHorizontal * 6, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(getProperTitle(service.name.replaceAll('_', ' ')), style: h5(Colors.black),),
          ),
          Container(
//            height: sizeVertical * 45,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: service.serviceDetails.length,
                itemBuilder: (context, i){
                  return renderServiceContent(service.serviceDetails[i]);
                }
            ),
          )

        ],
      ),
    );
  }

  String getProperTitle(String s){
    return s[0].toUpperCase()+s.substring(1);
  }

  renderServiceContent(ServiceDetail s){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(s.name, style: t3(Colors.black),),
          ),
          Container(
            child: Text('Rp '+formatter.format(s.price).replaceAll(',', '.'), style: h6(Colors.black),),
          )
        ],
      ),
    );
  }
}