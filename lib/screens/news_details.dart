import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsDataResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = "NewsDetails";

  NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Articles articles = ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
            "News Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: CachedNetworkImage(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                imageUrl: articles.urlToImage ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articles.source?.name ?? "",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    articles.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    articles.publishedAt?.substring(0, 10) ?? "",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    articles.content
                            ?.substring(0, articles.content?.indexOf("[")) ??
                        "",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchUrl(articles.url??"");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Read Full Article",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.arrow_right,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    Uri luncher= Uri.parse(url);
    if (!await launchUrl(luncher)) {
      throw Exception('Could not launch $luncher');
    }
  }
}
