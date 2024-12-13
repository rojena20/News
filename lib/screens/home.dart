import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/categories.dart';
import 'package:news_app/screens/drawer_icon.dart';
import '../Tabbar.dart';
import '../apis/api_maneger.dart';
import '../models/NewsDataResponse.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchController = TextEditingController();
  List<Articles> searchResults = []; // Store search results
  bool isLoading = false;// Track loading state
  bool isSearching=false;
  CategoryModel? selectedCategory;

  @override
  void initState() {
    super.initState();

    // Listen to changes in the search query
    searchController.addListener(() {
      _performSearch(); // Call the search function on text change
    });
  }

  @override
  void dispose() {
    searchController.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  // Method to perform the API search
  void _performSearch() async {
    String query = searchController.text.trim(); // Get the input query

    if (query.isEmpty) {
      setState(() {
        searchResults = []; // Clear results if the query is empty
      });
      return;
    }

    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      var response =
      await ApiManeger.searchArticles(query); // Make the API call
      setState(() {
        searchResults = response.articles?.map((e) => Articles.fromJson(e)).toList()??[]; // Update the search results
      });
    } catch (e) {
      print('Error during search: $e');
    } finally {
      setState(() {
        isLoading = false; // Stop loading indicator
      });
    }
  }

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
        drawer: isSearching?null:DrawerIcon(
          onIconPresses: onDrawerClick,
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
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
            title: isSearching
                ? TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search Articles",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Color(0xff39A552),),
              ),
              style: TextStyle(color: Color(0xff39A552),),
            )
                : Text(
              selectedCategory == null
                  ? "News App"
                  : selectedCategory!.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: [
              if (selectedCategory != null)
                if (isSearching)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = false;
                        searchController.clear();// Reset articles
                      });
                    },
                    icon: Icon(Icons.close),
                  )
                else
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                    icon: Icon(Icons.search),
                  ),
            ],

          ),
        ),
        body: selectedCategory == null
            ? Categories(
          onClick: onCategorySelect,
        )
            : tabBar(
          id: selectedCategory!.id,
          onArticlesLoades: (articles) {
            searchResults = articles;
            setState(() {});
          },
          articles: searchResults,
        ),
      ),
    );
  }

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