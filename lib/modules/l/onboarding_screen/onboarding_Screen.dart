import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/shop_login.dart';
import 'package:shop_app/shared/component/component.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel({
    this.image,
    this.title,
    this.body,
  });
}

class OnBoardingScreen extends StatelessWidget {
  bool isLast = false;

  var boaringController = PageController();

  List<OnBoardingModel> onBoardingItems = [
    OnBoardingModel(
      image: 'asset/images/onboarding1.png',
      title: 'Find your favourite item',
      body: 'Find your favourite products that you need to buy daily',
    ),
    OnBoardingModel(
      image: 'asset/images/onboarding2.png',
      title: 'Easy & Safe Payment',
      body: 'Pay for the products you buy safe and easily',
    ),
    OnBoardingModel(
      image: 'asset/images/onboarding3.png',
      title: 'Products Delivery',
      body: 'Your Products are delivered home safely and securely',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              navigateAndReplacement(
                  context: context, widget: ShopLoginScreen());
            },
            child: Text(
              'SKIP',
              style: TextStyle(
                color: Colors.blue[900],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == onBoardingItems.length - 1) isLast = true;
                },
                controller: boaringController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildOnBoardingItem(
                  onBoardingItems: onBoardingItems[index],
                ),
                itemCount: onBoardingItems.length,
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20.0),
                  child: SmoothPageIndicator(
                    controller: boaringController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.blue[900],
                      dotHeight: 10.0,
                      spacing: 5.0,
                      dotWidth: 10.0,
                      expansionFactor: 4,
                    ),
                    count: onBoardingItems.length,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast == true) {
                      navigateAndReplacement(
                        context: context,
                        widget: ShopLoginScreen(),
                      );
                    } else {
                      boaringController.nextPage(
                        duration: Duration(microseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_right_alt,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnBoardingItem({@required OnBoardingModel onBoardingItems}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              width: 600.0,
              height: 600.0,
              image: AssetImage(
                '${onBoardingItems.image}',
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: Text(
              onBoardingItems.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: Text(
              onBoardingItems.body,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      );
}
