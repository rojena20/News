import 'package:flutter/material.dart';
import 'package:news_app/screens/category_item.dart';
import '../models/category_model.dart';

class Categories extends StatelessWidget {
  List<CategoryModel> categories = CategoryModel.getCategories();
  Function onClick;

  Categories({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pick your category of Interest",
            style: TextStyle(
              fontSize: 33,
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onClick(categories[index]);
                  },
                  child: CategoryItem(
                    model: categories[index],
                    isOdd: index.isOdd,
                  ),
                );
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
