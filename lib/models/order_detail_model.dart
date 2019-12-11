class OrderDetail {

  int id;
  String orderId;
  int status;
  String outletName;
  String outletAddress;
  Service service;

  OrderDetail({this.id, this.orderId, this.status, this.outletName, this.outletAddress, this.service});

  factory OrderDetail.fromJson(Map<String, dynamic> json){
    return OrderDetail(
      id: json['id'],
      orderId: json['orderId'],
      status: json['status'],
      outletName: json['outlet']['name'],
      outletAddress: json['outlet']['address'],
      service: Service.fromJson(json['service'])
    );
  }

}

class Service{
  int id;
  String type;
  String name;
  String dateCreated;
  String dateFinished;
  bool isSelfService;
  String selfServiceDetail;
  List<ServiceDetail> serviceDetails;

  Service({this.id, this.type, this.name, this.dateCreated, this.dateFinished, this.isSelfService, this.selfServiceDetail, this.serviceDetails});

  factory Service.fromJson(Map<String, dynamic> json){
    return Service(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      dateCreated: json['date_created'],
      dateFinished: json['date_finished'],
      isSelfService: json['is_self_service'],
      selfServiceDetail: (json['self_service_detail'] != null)?json['self_service_detail']['name']:null,
      serviceDetails: (json['details'] as List).map((a) => ServiceDetail.fromJson(a)).toList()
    );
  }
}

class ServiceDetail {
  int id;
  String name;
  int price;
  int quantity;

  ServiceDetail({this.id, this.name, this.price, this.quantity});

  factory ServiceDetail.fromJson(Map<String, dynamic> json){
    return ServiceDetail(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity']
    );
  }
}