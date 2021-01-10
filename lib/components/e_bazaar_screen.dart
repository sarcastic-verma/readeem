import 'package:flutter/material.dart';
import 'package:readeem/components/item_card.dart';

class EBazaarScreen extends StatelessWidget {
  static const id = 'home_boiler_plate';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFD6DFE7),
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios, color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "E Bazaar",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(5),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            childAspectRatio: 0.8,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return ItemCard();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
