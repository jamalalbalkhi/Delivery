import '../Services/api/auth.dart';

class product {
  int? id;
  String? name;
  String? photo;
  int? price;
  String? description;
  int? count;
  int? available;
  int? marketId;
  String? createdAt;
  String? updatedAt;
  int quantity=1;
  product(
      {this.id,
        this.name,
        this.photo,
        this.price,
        this.description,
        this.count,
        this.available,
        this.marketId,
        this.createdAt,
        this.updatedAt,
      this.quantity=0});

  product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'].replaceAll("http://localhost:8000", url);
    price = json['price'];
    description = json['description'];
    count = json['count'];
    available = json['available'];
    marketId = json['market_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    quantity=json['pivot']['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['price'] = this.price;
    data['description'] = this.description;
    data['count'] = this.count;
    data['available'] = this.available;
    data['market_id'] = this.marketId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
