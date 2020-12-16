import 'package:flutter/cupertino.dart';

import 'book.dart';
import 'item.dart';
import 'order.dart';

class User {
  List<Book> completedBooks;
  List<Book> inProgressBooks;
  List<Book> favBooks;
  List<Item> cart;
  int reward;
  List<Order> previousOrders;
  String img;
  String id;
  String name;
  String email;
  String mobile;
  String joinDate;
  String changePasswordDate;

  User({
    @required this.completedBooks,
    @required this.inProgressBooks,
    @required this.favBooks,
    @required this.cart,
    @required this.reward,
    @required this.previousOrders,
    @required this.img,
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.mobile,
    @required this.joinDate,
    @required this.changePasswordDate,
  });

  User.fromJson(Map<String, dynamic> json) {
    if (json['completedBooks'] != null) {
      completedBooks = List<Book>();
      json['completedBooks'].forEach((v) {
        completedBooks.add(Book.fromJson(v));
      });
    }
    if (json['inProgressBooks'] != null) {
      inProgressBooks = List<Book>();
      json['inProgressBooks'].forEach((v) {
        inProgressBooks.add(Book.fromJson(v));
      });
    }
    if (json['favBooks'] != null) {
      favBooks = List<Book>();
      json['favBooks'].forEach((v) {
        favBooks.add(Book.fromJson(v));
      });
    }
    if (json['cart'] != null) {
      cart = List<Item>();
      json['cart'].forEach((v) {
        cart.add(Item.fromJson(v));
      });
    }
    reward = json['reward'];
    if (json['previousOrders'] != null) {
      previousOrders = List<Order>();
      json['previousOrders'].forEach((v) {
        previousOrders.add(Order.fromJson(v));
      });
    }
    img = json['img'];
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    joinDate = json['joinDate'];
    changePasswordDate = json['changePasswordDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.completedBooks != null) {
      data['completedBooks'] =
          this.completedBooks.map((v) => v.toJson()).toList();
    }
    if (this.inProgressBooks != null) {
      data['inProgressBooks'] =
          this.inProgressBooks.map((v) => v.toJson()).toList();
    }
    if (this.favBooks != null) {
      data['favBooks'] = this.favBooks.map((v) => v.toJson()).toList();
    }
    if (this.cart != null) {
      data['cart'] = this.cart.map((v) => v.toJson()).toList();
    }
    data['reward'] = this.reward;
    if (this.previousOrders != null) {
      data['previousOrders'] =
          this.previousOrders.map((v) => v.toJson()).toList();
    }
    data['img'] = this.img;
    data['_id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['joinDate'] = this.joinDate;
    data['changePasswordDate'] = this.changePasswordDate;
    return data;
  }
}
