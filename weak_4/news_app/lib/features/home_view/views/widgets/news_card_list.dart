import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import '../../data/models/news_card_model.dart';
import 'news_card.dart';

class NewsCardList extends StatelessWidget {
   NewsCardList({super.key});
  List<NewsCardModel> news = [
    NewsCardModel(imagePath: AppAssets.image_3, title: "The Pros and Cons of Remote Work", subTitle: "Technology"),
    NewsCardModel(imagePath: AppAssets.image_2, title: "The Pros and Cons of Remote Work", subTitle: "Technology"),
    NewsCardModel(imagePath: AppAssets.image_1, title: "The Pros and Cons of Remote Work", subTitle: "Technology"),
    NewsCardModel(imagePath: AppAssets.image_3, title: "The Pros and Cons of Remote Work", subTitle: "Technology"),

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 324.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: news.length,
          itemBuilder:(context,index){return NewsCard(newsCardModel: news[index]);}
      ),
    );
  }
}
