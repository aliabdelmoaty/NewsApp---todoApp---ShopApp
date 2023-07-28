import 'package:flutter/material.dart';
import 'package:flutter2/models/shopapp/search/cubit.dart';
import 'package:flutter2/models/shopapp/search/search_model.dart';
import 'package:flutter2/models/shopapp/search/state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var saerchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultFormField(
                      label: 'Search',
                      prefix: Icons.search,
                      controller: saerchController,
                      type: TextInputType.text,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'error text ';
                        }
                        return null;
                      },
                      onSubmit: (String? text) {
                        SearchCubit.get(context).search(text!);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (state is SearchLoadingState) LinearProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (
                          context,
                          index,
                        ) =>
                            buildProductItems(
                                SearchCubit.get(context)
                                    .model!
                                    .data!
                                    .data[index],
                                context),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount:
                            SearchCubit.get(context).model!.data!.data.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildFavItem(
  Datum? model,
  context,
) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: NetworkImage('${model!.image}'),
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'name',
                    '${model.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        // 'price',
                        '${model.price}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: defaultColor,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      // if (model?.discount != 0)
                      //   Text(
                      //     // 'old',
                      //     '${model?.old_price}',
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //     style: TextStyle(
                      //       fontSize: 13.0,
                      //       color: Colors.grey[300],
                      //       decoration: TextDecoration.lineThrough,
                      //       decorationThickness: 2,
                      //       decorationColor: Color.fromARGB(255, 218, 112, 102),
                      //     ),
                      //   ),
                      const Spacer(),
                      // IconButton(
                      //     onPressed: () {
                      //       HomeShopCubit.get(context)
                      //           .changeFavorites(model.id!);
                      //     },
                      // icon: CircleAvatar(
                      //   backgroundColor: HomeShopCubit.get(context)
                      //               .favoritesChange[model!.id] ??
                      //           false
                      //       ? Colors.red
                      //       : Colors.grey,
                      //   radius: 17,
                      //   child: Icon(
                      //     Icons.favorite_outline,
                      //     color: Colors.white,
                      //   ),
                      // ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
