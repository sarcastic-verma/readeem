import 'package:flutter/cupertino.dart';

class Item {
  Item({@required this.phone, @required this.name});

  String name;
  String phone;

  factory Item.fromJson(Map<String, dynamic> user) {
    return Item(phone: user['phone'], name: user['name']);
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}