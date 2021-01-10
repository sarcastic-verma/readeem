import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readeem/components/my_cached_network_image.dart';

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MyCachedNetworkImage(
              width: double.infinity,
              borderRadius: 5,
              url:
                  "https://images.unsplash.com/photo-1512212621149-107ffe572d2f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1359&q=80",
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Sofa",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.5),
          Text(
            "Lane Furniture",
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          ),
          SizedBox(height: 2.5),
          Row(
            children: [
              Text(
                "\$32",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Icon(
                CupertinoIcons.star_fill,
                color: Colors.yellow[600],
                size: 18,
              ),
              SizedBox(width: 5),
              Text(
                "4.8",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
