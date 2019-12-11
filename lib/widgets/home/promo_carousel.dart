import 'package:daily_wash/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class PromoCarousel extends StatefulWidget{

  @override
  _PromoCarouselState createState()=> _PromoCarouselState();

}
class _PromoCarouselState extends State<PromoCarousel>{

  int _current = 0;
  List<Widget> carouselItems = [];

  @override
  initState(){
    super.initState();
    getCarousels();
  }


  getCarousels(){
    for(int i = 0;i<5;i++){
      carouselItems.add(carouselContainer(id: i));
    }
  }

  carouselContainer({int id}){
    return GestureDetector(
      onTap: (){
        print('$id is clicked');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: (id % 2 == 0)?AssetImage('res/icons/promo01.png'):AssetImage('res/icons/promo02.png')
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Stack(
          children: [
            CarouselSlider(
              height: 150,
              items: carouselItems,
              autoPlay: true,
              aspectRatio: 2,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
            ),
          ]
      ),
    );
  }
}