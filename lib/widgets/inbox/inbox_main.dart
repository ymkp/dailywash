import 'package:flutter/material.dart';
import 'package:daily_wash/models/inbox_model.dart';
import 'package:daily_wash/widgets/inbox/inbox_card.dart';

class InboxMain extends StatefulWidget{

  @override
  _InboxMainState createState() => _InboxMainState();
}

class _InboxMainState extends State<InboxMain>{

  List<Inbox> inboxes = [
    Inbox(
      id: 1,
      title: 'Kamu punya promo dry wash minggu ini',
      subTitle: 'dapatkan vouchernya dengan melengkapi data pada profil',
      date: 'Hari ini, 15.30'
    ),
    Inbox(
        id: 1,
        title: 'Kamu punya promo dry wash minggu ini',
        subTitle: 'dapatkan vouchernya dengan melengkapi data pada profil',
        date: 'Kemarin, 08.30'
    ),
    Inbox(
        id: 1,
        title: 'Kamu punya promo dry wash minggu ini',
        subTitle: 'dapatkan vouchernya dengan melengkapi data pada profil',
        date: 'Kemarin, 11.11'
    ),
    Inbox(
        id: 1,
        title: 'Kamu punya promo dry wash minggu ini',
        subTitle: 'dapatkan vouchernya dengan melengkapi data pada profil',
        date: '07-12-2019, 12.11'
    ),
    Inbox(
        id: 1,
        title: 'Kamu punya promo 3 KG minggu ini',
        subTitle: 'dapatkan vouchernya dengan melengkapi data pada profil',
        date: '01-12-2019, 00.30'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: inboxes.length,
          itemBuilder: (context, i){
          return InboxCard(inbox: inboxes[i]);
          }
      ),
    );
  }
}