class OrderCheckout {

  String name;
  List<OrderDetail> orderDetails;

  OrderCheckout({this.name, this.orderDetails});
}

class OrderDetail {
  String name;
  int price;
  int quantity;

  OrderDetail({this.name, this.price, this.quantity});
}