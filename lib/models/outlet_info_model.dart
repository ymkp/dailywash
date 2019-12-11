class OutletInfo {
  int id;
  String name;
  String image;
  String address;
  double distance;
  String businessHours;
  bool isOpen;
  bool hasPromo;
  List<dynamic> serviceNames;
  List<Service> services;

  OutletInfo({this.id, this.name, this.image, this.address, this.distance, this.businessHours, this.isOpen, this.services, this.hasPromo, this.serviceNames});

  factory OutletInfo.fromJson(Map <String, dynamic> json){
    return OutletInfo(
      id : json['id'],
      name: json['name'],
      image: json['image'],
      address: json['address'],
      distance: json['distance'],
      businessHours: json['business_hours'],
      isOpen: json['is_open'],
      hasPromo: json['has_promo'],
      serviceNames: json['services'],
      services: (json['services_details'] as List).map((a) => Service.fromJson(a)).toList(),
    );
  }
}

class Service{
  String name;
  List<ServiceDetail> serviceDetails;

  Service({this.name, this.serviceDetails});

  factory Service.fromJson(Map<String, dynamic> json){
    return Service(
      name: json['name'],
      serviceDetails: (json['detail'] as List).map((a) => ServiceDetail.fromJson(a)).toList()
    );
  }
}

class ServiceDetail{
  String name;
  int price;

  ServiceDetail({this.name, this.price});

  factory ServiceDetail.fromJson(Map<String, dynamic> json){
    return ServiceDetail(
      name: json['name'],
      price: json['price']
    );
  }
}