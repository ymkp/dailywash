class PromoDetail {
  int id;
  String title;
  String dateCreated;
  String dateExpired;
  String image;
  String promoCode;
  String description;

  PromoDetail({this.id, this.title, this.dateCreated, this.dateExpired, this.image, this.description, this.promoCode});

  factory PromoDetail.fromJson(Map<String, dynamic>json){
    return PromoDetail(
      id: json['id'],
      title: json['title'],
      dateCreated: json['created_date'],
      dateExpired: json['expired_date'],
      image: json['image'],
      promoCode: json['promo_code'],
      description: json['description'],
    );
  }
}