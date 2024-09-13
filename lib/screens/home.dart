import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/categories.dart';
import 'package:news_app/screens/drawer_icon.dart';

import '../Tabbar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: DrawerIcon(
          onIconPresses: onDrawerClick,
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff39A552),
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
          centerTitle: true,
          title: Text(
            selectedCategory == null ? "News App" : selectedCategory!.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: selectedCategory == null
            ? Categories(
                onClick: onCategorySelect,
              )
            : tabBar(
                id: selectedCategory!.id,
              ),
      ),
    );
  }

  CategoryModel? selectedCategory = null;

  onDrawerClick(id) {
    if (id == DrawerIcon.categoryID) {
      selectedCategory = null;
    } else if (id == DrawerIcon.settingsID) {}
    setState(() {});
  }

  onCategorySelect(category) {
    selectedCategory = category;
    setState(() {});
  }
}
