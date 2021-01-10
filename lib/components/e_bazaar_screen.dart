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
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(tabs: [
                Tab(
                  child: Text(
                    "Home",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    "Categories",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ]),
              SizedBox(height: 5),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
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
                    ListView(
                      children: [
                        _buildProductsListView("Books"),
                        _buildProductsListView("Fashion"),
                        _buildProductsListView("Sports"),
                        _buildProductsListView("Furniture"),
                        _buildProductsListView("Gadgets"),
                        _buildProductsListView("Vehicles"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildProductsListView(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("View all"),
              ),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.8
          ),
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return ItemCard();
          },
          itemCount: 4,
        ),
      ],
    );
  }
}
