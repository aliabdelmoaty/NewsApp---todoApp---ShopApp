import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/shared/components/components.dart';
import 'package:flutter2/shared/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/shopapp/cubit/cubit.dart';
import '../../../layout/shopapp/cubit/states.dart';
import '../../../shared/styles/colors.dart';
import '../home/home_shop.dart';
import 'favorites_get_model.dart';
import 'favorites_model.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, HomeShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! FavoritesShopLoadingData,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (
              context,
              index,
            ) =>
                buildFavItem(
                    SearchCubit.get(context)
                        .favorite!
                        .dataFavorite!
                        .dataProduct[index]
                        .product,
                    context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: SearchCubit.get(context)
                .favorite!
                .dataFavorite!
                .dataProduct
                .length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget buildFavItem(
  DataProduct? dataProduct,
  context,
) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: dataProduct?.image != null
                      ? NetworkImage('${dataProduct?.image}')
                      : NetworkImage(
                          'https://cdn.dribbble.com/userupload/2641500/file/original-b2b4da3f25a13ff275d03cd646d1fec3.png?compress=1&resize=1504x1128'),
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                if (dataProduct?.discount != 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      'OFFER',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.red,
                        fontSize: 10,
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'name',
                    '${dataProduct?.name}',
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
                        '${dataProduct?.price}',
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
                      if (dataProduct?.discount != 0)
                        Text(
                          // 'old',
                          '${dataProduct?.old_price}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.grey[300],
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                            decorationColor: Color.fromARGB(255, 218, 112, 102),
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            SearchCubit.get(context)
                                .changeFavorites(dataProduct.id!);
                          },
                          icon: CircleAvatar(
                            backgroundColor: SearchCubit.get(context)
                                        .favoritesChange[dataProduct!.id] ??
                                    false
                                ? Colors.red
                                : Colors.grey,
                            radius: 17,
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
