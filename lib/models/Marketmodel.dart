import 'package:untitled/Services/api/auth.dart';

class Market {
  int? id;
  String? name;
  String? photo;
  String? location;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Market(
      {this.id,
        this.name,
        this.photo,
        this.location,
        this.categoryId,
        this.createdAt,
        this.updatedAt});

  Market.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'].replaceAll("http://localhost:8000", url);
    location = json['location'];
    categoryId = json['category_id'] ?? "NO Location";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['location'] = this.location;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
