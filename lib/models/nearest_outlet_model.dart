class NearestOutlet {

  int id;
  String name;
  String image;
  double distance;
  String businessHours;
  bool isOpen;
  bool hasPromo;
  List<dynamic> services;

  NearestOutlet({this.id, this.name, this.image, this.distance, this.businessHours, this.isOpen, this.hasPromo, this.services});

  factory NearestOutlet.fromJson(Map<String, dynamic> json){
    return NearestOutlet(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      distance: json['distance'],
      businessHours: json['business_hours'],
      isOpen: json['is_open'],
      hasPromo: json['has_promo'],
      services: json['services']
    );
  }
}