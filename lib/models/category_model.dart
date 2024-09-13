import 'dart:ui';
import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.color,
  });

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        id: "sports",
        name: "Sports",
        image: "assets/images/ball.png",
        color: Colors.red,
      ),
      CategoryModel(
        id: "entertainment",
        name: "Entertainment",
        image: "assets/images/entertainment.png",
        color: Color(0xff003e90),
      ),
      CategoryModel(
        id: "health",
        name: "Health",
        image: "assets/images/health.png",
        color: Colors.pink,
      ),
      CategoryModel(
        id: "business",
        name: "Business",
        image: "assets/images/bussines.png",
        color: Color(0xffcf7e4b),
      ),
      CategoryModel(
        id: "general",
        name: "General",
        image: "assets/images/general.png",
        color: Colors.lightBlueAccent,
      ),
      CategoryModel(
        id: "science",
        name: "Science",
        image: "assets/images/science.png",
        color: Color.fromARGB(255, 240, 200, 0),
      ),
      CategoryModel(
        id: "technology",
        name: "Technology",
        image: "assets/images/technology.png",
        color: Color(0xff39A552),
      ),
    ];
  }
}
