import 'package:flutter/material.dart';
import 'package:news_app/screens/news_item.dart';
import 'package:news_app/tab_item.dart';
import 'apis/api_maneger.dart';
import 'models/NewsDataResponse.dart';

class tabBar extends StatefulWidget {
  String id;
  Function onArticlesLoades;
  List<Articles> articles;

  tabBar({
    super.key,
    required this.id,
    required this.onArticlesLoades,
    required this.articles,
  });

  @override
  State<tabBar> createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManeger.getSources(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        var sources = snapshot.data?.sources ?? [];
        return Column(
          children: [
            DefaultTabController(
              length: sources.length,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TabBar(
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    onTap: (value) {
                      selectedTabIndex = value;
                      setState(() {});
                    },
                    tabs: sources
                        .map((e) => TabItem(
                              source: e,
                              isSelected:
                                  sources.elementAt(selectedTabIndex) == e,
                            ))
                        .toList()),
              ),
            ),
            FutureBuilder(
              future:
                  ApiManeger.getNewsDate(sources[selectedTabIndex].id ?? ""),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }
                var articles = snapshot.data?.articles ?? [];
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return NewsItem(
                          article: articles[index],
                        );
                      },
                      itemCount: articles.length,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
