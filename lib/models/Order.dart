class Order {
  int? id;
  int? userId;
  String? orderStatus;
  String? paymentStatus;
  String? location;
  int? totalPrice;
  int? tax;
  int? deliveryCharge;
  int? finalBill;
  int? isDeleted;
  var deletedAt;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.id,
        this.userId,
        this.orderStatus,
        this.paymentStatus,
        this.location,
        this.totalPrice,
        this.tax,
        this.deliveryCharge,
        this.finalBill,
        this.isDeleted,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    location = json['location'];
    totalPrice = json['total_price'];
    tax = json['tax'];
    deliveryCharge = json['delivery_charge'];
    finalBill = json['final_bill'];
    isDeleted = json['is_deleted'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_status'] = this.orderStatus;
    data['payment_status'] = this.paymentStatus;
    data['location'] = this.location;
    data['total_price'] = this.totalPrice;
    data['tax'] = this.tax;
    data['delivery_charge'] = this.deliveryCharge;
    data['final_bill'] = this.finalBill;
    data['is_deleted'] = this.isDeleted;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
