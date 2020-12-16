import 'package:flutter/cupertino.dart';

class Order {
  Order({@required this.phone, @required this.name});

  String name;
  String phone;

  factory Order.fromJson(Map<String, dynamic> user) {
    return Order(phone: user['phone'], name: user['name']);
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
