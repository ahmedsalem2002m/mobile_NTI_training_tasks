import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/helper/app_navigator.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_paddings.dart';
import 'package:news_app/features/article_view/cubit/article_cubit.dart';
import 'package:news_app/features/explore_view/data/models/articles_respones_model.dart';

import '../cubit/article_state.dart';

class ArticleView extends StatelessWidget {
  ArticleView({required this.articlesModel});

  ArticlesModel articlesModel;

  // String formatDate(String dateString) {
  //   final dateTime = DateTime.parse(dateString);
  //   return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleCubit(),
      child: Scaffold(
        body: BlocBuilder<ArticleCubit, ArticleState>(
          builder: (context, state) {
            return Stack(
              children: [
                Image(
                  width: double.infinity,
                  height: 316.h,
                  fit: BoxFit.fill,
                  image:
                      articlesModel.urlToImage != null &&
                          articlesModel.urlToImage!.isNotEmpty
                      ? NetworkImage(articlesModel.urlToImage!)
                      : AssetImage(AppAssets.articleImage) as ImageProvider,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32.r),
                      ),
                    ),
                    child: Padding(
                      padding: AppPaddings.defaultHomePadding,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    AppNavigator.goBack(context);
                                  },
                                  icon: SvgPicture.asset(
                                    AppAssets.wrapperIcon_2,
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        ArticleCubit.get(
                                          context,
                                        ).changeBookmark();
                                      },
                                      icon: SvgPicture.asset(
                                        ArticleCubit.get(context).bookMark
                                            ?  AppAssets.bookmarkIcon
                                            : AppAssets.bookmarkIconUnColor,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: null,
                                      icon: SvgPicture.asset(
                                        AppAssets.wrapperIcon,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              articlesModel.title ?? "",
                              style: TextStyle(
                                fontSize: 32.sp,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.r,
                                  backgroundImage: NetworkImage(
                                    articlesModel.urlToImage ??
                                        AppAssets.personalImage,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Text(articlesModel.author ?? "Harry Harper · "),
                                Text(" · "),
                                Text(
                                  ArticleCubit.get(
                                    context,
                                  ).formatDate(articlesModel.publishedAt ?? ""),
                                ),
                              ],
                            ),
                            Text(
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 20.sp,
                              ),
                              articlesModel.content ?? "",
                              // "Forests are one of the most important natural resources that our planet possesses. Not only do they provide us with a diverse range of products such as timber, medicine, and food, but they also play a vital role in mitigating climate change and maintaining the overall health of our planet's ecosystems. In this article, we will explore the ways in which forests are helping our world. One of the most important roles that forests play is in absorbing carbon dioxide from the atmosphere. Trees absorb carbon dioxide through photosynthesis and store it in their trunks, branches, and leaves. This carbon sequestration helps to mitigate climate change by reducing the amount of greenhouse gases in the atmosphere. Forests are estimated to absorb approximately 2.4 billion tonnes of carbon dioxide each year, which is equivalent to around 10% of global greenhouse gas emissions.Forests also play a crucial role in maintaining the water cycle. Trees absorb water from the soil and release it back into the atmosphere through a process known as transpiration. This helps to regulate the local climate and prevents soil erosion and flooding. Forests also act as natural water filters, helping to purify water that flows through them.Forests are also important sources of biodiversity. They provide habitat for countless species of plants and animals, many of which are found nowhere else on earth. Forests also provide a source of food and medicine for many communities around the world. In fact, it is estimated that around 80% of the world's population relies on traditional medicine derived from plants, many of which are found in forests.In addition to their ecological and cultural importance, forests also provide economic benefits. They provide jobs and income for millions of people around the world, particularly in rural areas. Forests also provide timber, paper, and other products that are essential to many industries.",
                            ),
                            // SizedBox(height: 24.h),
                            // Text(
                            //   textAlign:TextAlign.center,
                            //   "Get The Latest News\n And Updates",
                            //   style: TextStyle(fontSize: 32.sp, color: AppColors.textPrimary),
                            // ),
                            // Text(
                            //   textAlign:TextAlign.center,
                            //   "From Politics to Entertainment: Your One-Stop Source for Comprehensive Coverage of the Latest News and Developments Across the Glob will be right on your hand.",
                            //   style: TextStyle(fontSize: 18.sp, color: AppColors.textSecondary),
                            // ),
                            // SizedBox(height: 12.h,),
                            // ElevatedButton(
                            //   onPressed: (){
                            //     AppNavigator.goTo(context, SearchView(),type: NavigatorType.pushReplacement);
                            //   },
                            //   style:ElevatedButton.styleFrom(
                            //       backgroundColor: AppColors.buttonPrimary
                            //   ) ,
                            //   child: Row(
                            //       mainAxisSize: MainAxisSize.min,
                            //       children: [
                            //         Text(
                            //           "Explore",
                            //           style: TextStyle(
                            //               color: AppColors.primary
                            //           ),
                            //         ),
                            //         SizedBox(width: 4.w,),
                            //         Icon(Icons.arrow_forward,color: AppColors.primary,)
                            //       ]
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
