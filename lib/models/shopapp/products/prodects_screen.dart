import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/models/shopapp/favorites/favorites_screen.dart';
import 'package:flutter2/models/shopapp/home/home_shop.dart';
import 'package:flutter2/shared/components/components.dart';
import 'package:flutter2/shared/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../layout/shopapp/cubit/cubit.dart';
import '../../../layout/shopapp/cubit/states.dart';
import '../cateogries/categories_model.dart';
import '../cateogries/categories_model.dart';
import '../cateogries/categories_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, HomeShopState>(
      listener: (context, state) {
        if (state is ChangeFavoritesShopSuccessData) {
          if (state.model.status == false) {
            print(state.model.message);
            MotionToast.error(
              description: Text('${state.model.message}'),
              // primaryColor: Colors.white60,
            ).show(context);
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SearchCubit.get(context).homeModel != null &&
              SearchCubit.get(context).categories != null,
          builder: (context) => builderWidget(
              SearchCubit.get(context).homeModel!,
              SearchCubit.get(context).categories!,
              context),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget builderWidget(HomeModel model, Categories category, context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model.data.banners
                  .map(
                    (e) => Image(
                      image: e.image != null
                          ? NetworkImage('${e.image}')
                          : NetworkImage(
                              'https://cdn.dribbble.com/userupload/2641500/file/original-b2b4da3f25a13ff275d03cd646d1fec3.png?compress=1&resize=1504x1128'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 200,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: true,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayAnimationDuration: Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayInterval: Duration(seconds: 2),
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildCategories(category.data!.data[index]),
                      separatorBuilder: (context, index) => SizedBox(width: 5),
                      itemCount: category.data!.data.length,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'New Prodects',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1.5,
                children: List.generate(
                    model.data.products.length,
                    (index) =>
                        buildGridProduct(model.data.products[index], context)),
              ),
            ),
          ],
        ),
      );

  Widget buildCategories(DataModel dataModel) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(
              dataModel.image!,
            ),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Container(
              width: 100,
              color: Colors.black.withOpacity(.7),
              child: Text(
                dataModel.name!,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
        ],
      );

  Widget buildGridProduct(ProductModel model, context) => Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  height: 150,
                  width: double.infinity,
                  // fit: BoxFit.cover,
                ),
                if (model.discount != 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'offer',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.0, height: 1.1),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price.round()}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: defaultColor,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if (model.discount != 0)
                        Text(
                          '${model.old_price.round()}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[300],
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 3,
                            decorationColor: Color.fromARGB(255, 218, 112, 102),
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            SearchCubit.get(context).changeFavorites(model.id);
                          },
                          icon: CircleAvatar(
                            backgroundColor: SearchCubit.get(context)
                                        .favoritesChange[model.id] ??
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
      );
}
