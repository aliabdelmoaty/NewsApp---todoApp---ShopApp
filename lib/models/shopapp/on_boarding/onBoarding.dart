import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter2/models/shopapp/login/login_Shop.dart';
import 'package:flutter2/shared/components/components.dart';
import 'package:flutter2/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/styles/colors.dart';

class BoadingModel {
  final String image;
  final String title;
  final String body;
  BoadingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  List<BoadingModel> boarding = [
    BoadingModel(
      image: 'assets/images/onboard8.jpg',
      body: 'on Borad 1 body',
      title: 'on Board 1 title',
    ),
    BoadingModel(
      image: 'assets/images/onboard8.jpg',
      body: 'on Borad 2 body',
      title: 'on Board 2 title',
    ),
    BoadingModel(
      image: 'assets/images/onboard8.jpg',
      body: 'on Borad 3 body',
      title: 'on Board 3 title',
    ),
  ];

  var boardController = PageController();
  bool isLast = false;
  void sumbit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then(
      (value) {
        if (value) {
          NavigateAndFinish(context, LoginShop());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                sumbit();
              },
              child: Text('skip'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                controller: boardController,
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                      dotHeight: 10.0,
                      expansionFactor: 4,
                      dotWidth: 10.0,
                      spacing: 4,
                      activeDotColor: defaultColor,
                      dotColor: Colors.grey),
                  count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      sumbit();
                    } else {
                      boardController.nextPage(
                          duration: Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.easeInOutQuart);
                    }
                  },
                  child: Icon(Icons.keyboard_arrow_right_sharp),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoadingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('${model.body}'),
          SizedBox(
            height: 10,
          ),

          // PageView.builder(itemBuilder: (context),
        ],
      );
}
