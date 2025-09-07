import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_todo_app/features/home/cubit/menu_cubit.dart';
import 'package:nti_todo_app/features/home/cubit/menu_state.dart';
import '../../data/models/menu_response_model.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({super.key, required this.categoryModel});

  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MenuCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryModel.title??'-'),
        ),
        body: ListView.builder(
          itemCount: categoryModel.products!.length,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          itemBuilder: (context, index)=> Column(
            children: [
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(categoryModel.products![index].imagePath??''),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(height: 10.h,),
              Row(
                children:
                [
                  Expanded(
                    child: Text(
                      categoryModel.products![index].name??'',
                    ),
                  ),
                  Text(
                      categoryModel.products![index].price.toString()
                  )

                ],
              ),
              SizedBox(height: 10.h,),
              BlocBuilder<MenuCubit,MenuState>(
                builder: (context,state){
                  return IconButton(
                      onPressed: (){
                        MenuCubit.get(context).addFavorite(categoryModel.products![index].id!);
                        MenuCubit.get(context).getProducts();
                      },
                      icon: Icon(categoryModel.products![index].isFavorite!? Icons.favorite: Icons.favorite_border,
                        color: Colors.red,)
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}