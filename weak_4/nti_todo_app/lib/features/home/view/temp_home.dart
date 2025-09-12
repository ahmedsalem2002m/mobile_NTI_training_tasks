// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:nti_todo_app/core/helper/app_navigator.dart';
// import 'package:nti_todo_app/core/utils/app_paddings.dart';
// import 'package:nti_todo_app/features/home/view/widgets/category_product_view.dart';
// import 'package:nti_todo_app/features/login/data/model/login_response_model.dart';
// import '../../../core/widgets/default_app_bar.dart';
// import '../cubit/menu_cubit.dart';
// import '../cubit/menu_state.dart';
// import '../cubit/user_cubit.dart';
// import '../cubit/user_state.dart';
//
// class TempHome extends StatelessWidget {
//   TempHome({super.key, this.userModel});
//
//   UserModel? userModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => UserCubit()..controlUser(userModel),
//       child: Scaffold(
//         body: Padding(
//           padding: AppPaddings.defaultHomePadding,
//           child: Column(
//             children: [
//               BlocBuilder<UserCubit, UserState>(
//                 builder: (context, state) {
//                   if (state is UserLoading) {
//                     return CircularProgressIndicator();
//                   } else if (state is UserError) {
//                     return Text("Error: ${state.error}");
//                   } else if (state is UserSuccess) {
//                     return DefaultAppBar(userModel: state.userModel);
//                   } else {
//                     return SizedBox();
//                   }
//                 },
//               ),
//               BlocProvider(
//                 create: (context) => MenuCubit()..getMenu(),
//                 child: BlocBuilder<MenuCubit, MenuState>(
//                   builder: (context, state) {
//                     if (state is MenuLoading) {
//                       return Center(child: CircularProgressIndicator());
//                     } else if (state is MenuError) {
//                       return Center(child: Text(state.error));
//                     } else if (state is MenuSuccess) {
//                       return Expanded(
//                         child: RefreshIndicator(
//                           onRefresh: () async {
//                             MenuCubit.get(context).getMenu();
//                           },
//                           child: ListView.builder(
//                             itemBuilder: (context, index) => InkWell(
//                               onTap: () {
//                                 AppNavigator.goTo(
//                                   context,
//                                   CategoryProductsView(
//                                     categoryModel: state.categories[index],
//                                   ),
//                                 );
//                               },
//                               child: Column(
//                                 children: [
//                                   Image.network(
//                                     state.categories[index].imagePath ?? '',
//                                   ),
//                                   Text(state.categories[index].title ?? '-'),
//                                   Text(
//                                     state.categories[index].description ?? '-',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             itemCount: state.categories.length,
//                           ),
//                         ),
//                       );
//                     } else {
//                       return SizedBox();
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
