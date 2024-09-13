import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/NewsDataResponse.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height * 0.2,
            imageUrl: article.urlToImage ?? "",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            article.author ?? "",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
            ),
          ),
          Text(
            article.title ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
