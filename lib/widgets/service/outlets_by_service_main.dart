import 'package:daily_wash/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daily_wash/models/nearest_outlet_model.dart';
import 'package:daily_wash/providers/nearest_outlets_provider.dart';
import 'package:daily_wash/widgets/outlet/outlets_main_page.dart';
import 'package:daily_wash/widgets/home/services_box.dart';

class OutletsByServiceMain extends StatefulWidget{

  final String type;
  OutletsByServiceMain({this.type});

  @override
  _OutletsByServiceMain createState() => _OutletsByServiceMain();
}

class _OutletsByServiceMain extends State<OutletsByServiceMain>{

  NearestOutletsProvider nop;
  List<String> serviceItemNames = ['Regular', 'Dry Cleaning', 'Express', 'Iron','Helm','Delivery'];
  List<String> serviceImages = ['regular', 'dry_clean', 'express','iron','helm','delivery'];
  List<ServiceBoxSmall> sbs = [];
  List<String> selectedType = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initServiceBox();

  }

  initServiceBox(){
    for(int i = 0; i < serviceItemNames.length; i++){
      sbs.add(ServiceBoxSmall(name: serviceItemNames[i],assetLocation: serviceImages[i],isSelected: widget.type == serviceImages[i],));
    }
    if(widget.type != null && widget.type != 'all'){
      selectedType.add(widget.type);
    }
  }

  @override
  Widget build(BuildContext context) {
    nop = Provider.of<NearestOutletsProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: sizeHorizontal * 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: sizeHorizontal * 40,
                  child:  Text('Pilih Jasa', style: h5(Colors.black),),
                ),
                Container(
                  width: sizeHorizontal * 20,
//                  child:  Text('Filter', style: t3(Colors.black),),
                )
              ],
            ),
          ),
          serviceBoxes(),
          searchBox(),

          Container(
            child: (nop.state == NOPState.loading)?CircularProgressIndicator():(nop.state == NOPState.none)?OutletsMain(outlets: nop.outlets,):Text('wew'),
          )
        ],
      ),
    );
  }


  serviceBoxes(){
    return Container(
      child: Column(
        children: <Widget>[
          Row(),
          Container(
            height: 70,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: serviceItemNames.length,
                itemBuilder: (context, i){
                  return GestureDetector(
                    onTap: (){
                      print('luar widget');
                      if(selectedType.contains(serviceImages[i])){
                        selectedType.remove(serviceImages[i]);
                      }else{
                        selectedType.add(serviceImages[i]);
                      }
                      print(selectedType);
                      sbs[i].changeSelected();
                      nop.changeOutletsByType(selectedType);
                    },
                    child: sbs[i],
                  );
                }
            ),
          )
        ],
      ),
    );
  }

  TextEditingController searchCtrl = TextEditingController();
  FocusNode searchFocus = FocusNode();

  searchBox(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: sizeHorizontal * 6),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        style: t3(Colors.black),
        onChanged: (String s){
          nop.changeOutletsByName(s);
        },
        decoration: InputDecoration(
          hintStyle: t3(Colors.grey),
          border: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: 'Cari berdasarkan nama outlet'
        ),
      ),
    );
  }
}