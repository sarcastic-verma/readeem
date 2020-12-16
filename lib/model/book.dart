import 'package:flutter/cupertino.dart';

class Book {
  Book({@required this.phone, @required this.name});

  String name;
  String phone;

  factory Book.fromJson(Map<String, dynamic> user) {
    return Book(phone: user['phone'], name: user['name']);
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
