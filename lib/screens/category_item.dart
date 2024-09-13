import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel model;
  bool isOdd;

  CategoryItem({super.key, required this.model, required this.isOdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: model.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
          bottomLeft: !isOdd?Radius.circular(25):Radius.zero,
          bottomRight: isOdd?Radius.circular(25):Radius.zero,
        ),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Text(
            model.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
            ),
          ),
        ],
      ),
    );
  }
}
