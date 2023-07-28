import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/models/counterapp/CounterScreen.dart';
import 'package:flutter2/models/newsapp/webview/web_view.dart';

import '../../layout/newsapp/Cubit/cubit.dart';
import '../../layout/shopapp/cubit/cubit.dart';
import '../../layout/todoapp/cubit/cubit.dart';
import '../../models/shopapp/favorites/favorites_model.dart';
import '../../models/shopapp/search/search_model.dart';
import '../styles/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

//https://api.thenewsapi.com/v1/news/all?api_token=UIuTj6RPFpe0yMIIxdSgZkv7r6dKrXrHZ8Vzk2qa
//https://newsapi.org/v2/everything?q=apple&from=2023-02-28&to=2023-02-28&sortBy=popularity&apiKey=e9800410114443688e7cad662808d636,
Widget defaultButton({
  double width = double.infinity,
  double height = 40.0,
  Color background = Colors.blue,
  required Function function,
  required String text,
  double radius = 0.0,
}) =>
    Container(
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: background),
    );

//------------------------------------------------------------------------------
class defaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final dynamic onSubmit;
  final dynamic onChange;
  final dynamic onTap;
  final dynamic validate;
  final dynamic prefix;
  final dynamic suffix;
  final dynamic suffixPressed;
  final bool isPassword;

  defaultFormField({
    required this.label,
    required this.controller,
    required this.type,
    this.prefix,
    this.onSubmit,
    this.onChange,
    required this.validate,
    this.onTap,
    this.suffixPressed,
    this.suffix,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          child: Icon(suffix),
          onTap: suffixPressed,
        ),
        prefixIcon: Icon(prefix),
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}

//------------------------------------------------------------------------------

Widget defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(IconlyBroken.arrowLeft2),
      ),
      title: Text(title!),
      titleSpacing: 5.0,
      actions: actions,
    );
//------------------------------------------------------------------------------
Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(children: [
          CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.grey,
            child: Text(
              '${model['time']}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${model['title']}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${model['data']}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updataData(state: 'done', id: model['id']);
              },
              icon: const Icon(Icons.check_circle_rounded)),
          IconButton(
              onPressed: () {
                AppCubit.get(context)
                    .updataData(state: 'archive', id: model['id']);
              },
              icon: const Icon(
                Icons.archive,
              )),
        ]),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(
          id: model['id'],
        );
      },
    );
Widget tasksBuilder({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.isNotEmpty,
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.menu_rounded,
              size: 100,
              color: Colors.blueGrey,
            ),
            Text(
              'مفيش حاجه هنا يسطا',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: tasks.length),
    );

//------------------------------------------------------------------------------
Widget myDivider() => Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
//------------------------------------------------------------------------------
Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(
          context,
          WebViewPage(article['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText2,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
//------------------------------------------------------------------------------
Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,
      ),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );
//------------------------------------------------------------------------------
void navigateTo(context, widget, ) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
//------------------------------------------------------------------------------

void NavigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}

Widget buildProductItems(model, context, {bool inSearch = true}) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage((model.image)!),
                  width: 120,
                  height: 120,
                ),
                if ((model.discount) != 0 && inSearch)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.red,
                    child: Text(
                      'Discount',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (model.name)!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.3,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        (model.price.toString()),
                        style: TextStyle(fontSize: 12, color: defaultColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      if ((model.discount) != 0 && inSearch)
                        Text(
                          model.discount.toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      // IconButton(
                      //   onPressed: () {
                      //     SearchCubit.get(context).favoritesChange((model.id)!);
                      //     // print(model.id);
                      //   },
                      //   icon: CircleAvatar(
                      //       backgroundColor:
                      //           SearchCubit.get(context).favourite[model.id]!
                      //               ? defaultColor
                      //               : Colors.grey,
                      //       radius: 15,
                      //       child: Icon(
                      //         Icons.favorite_border,
                      //         color: Colors.white,
                      //         size: 14,
                      //       )),
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

//------------------------------------------------------------------------------

// Widget iconAndText(
//    Icon? like,
//   // required String? text,
// ) {
//   return Row(
//     children: [
//      like = 
//     ],
//   );
// }
