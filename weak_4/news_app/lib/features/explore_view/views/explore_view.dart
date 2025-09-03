import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helper/app_navigator.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/widgets/default_app_bar.dart';
import 'package:news_app/features/article_view/views/article_view.dart';
import 'package:news_app/features/splash_view/views/widgets/default_form_field.dart';

import '../../../core/utils/app_colors.dart';
import '../cubit/news_cubit.dart';
import '../cubit/news_state.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getNews(),
      child: Scaffold(
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                NewsCubit.get(context).getNews();
              },
              child: Builder(
                builder: (context) {
                  if (state is NewsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is NewsError) {
                    return Center(child: Text(state.error));
                  } else if (state is NewsSuccess) {
                    if (state.articlesResponseModels.articles?.isEmpty ??
                        true) {
                      return Center(child: Text('No Data'));
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          DefaultAppBar(),
                          SizedBox(height: 12.h),
                          DefaultFormField(
                            controller: NewsCubit.get(context).searchKeyWord,
                            hintText: "Search",
                          ),
                          ElevatedButton(
                            onPressed: (){
                              if(NewsCubit.get(context).searchKeyWord != null) {
                                NewsCubit.get(context).getNewsBySearch();
                              }
                            },
                            style:ElevatedButton.styleFrom(
                                backgroundColor: AppColors.buttonPrimary
                            ) ,
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Search",
                                    style: TextStyle(
                                        color: AppColors.primary
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                                  state.articlesResponseModels.articles!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: (){
                                    AppNavigator.goTo(context, ArticleView(articlesModel: state.articlesResponseModels.articles![index]));
                                  },
                                  child: Card(
                                    child: Column(
                                      children: [
                                        // image
                                        Image(
                                          image: state.articlesResponseModels.articles![index].urlToImage != null && state.articlesResponseModels.articles![index].urlToImage!.isNotEmpty
                                              ? NetworkImage(state.articlesResponseModels.articles![index].urlToImage!)
                                              : AssetImage(AppAssets.articleImage) as ImageProvider,
                                        ),


                                        // Image.network(
                                        //   state
                                        //           .articlesResponseModels
                                        //           .articles![index]
                                        //           .urlToImage ??
                                        //       '',
                                        // ),

                                        Text(
                                          state
                                                  .articlesResponseModels
                                                  .articles![index]
                                                  .title ??
                                              '',
                                        ),
                                        Text(
                                          state
                                                  .articlesResponseModels
                                                  .articles![index]
                                                  .description ??
                                              '',
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
