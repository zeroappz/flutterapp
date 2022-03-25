import 'package:dealsapp/commonwidget/global_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'onboarding_data.dart';
import 'package:dealsapp/values/values.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  List colors = const [
    Color(0xFFDDEEDE),
    Color(0xFFFFE5DE),
    Color(0xFFDCF6E5),
  ];

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      height: Sizes.HEIGHT_10,
      width: _currentPage == index ? Sizes.WIDTH_24 : Sizes.WIDTH_10,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(Sizes.SIZE_48),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    double blockH = SizeConfig.blockH!;
    double blockV = SizeConfig.blockV!;

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: data.length,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemBuilder: (context, index) {
                  return Container(
                    color: colors[index],
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          Image.asset(
                            data[index].image,
                            // 'assets/images/splash_1.png',
                            height: SizeConfig.blockV! * 35,
                          ),
                          SizedBox(
                            height: (height >= 840) ? 60 : 30,
                          ),
                          Text(
                            data[index].title,
                            // "Onboarding Screen 1 for DealsApp",
                            style: const TextStyle(
                              fontSize: Sizes.TEXT_SIZE_24,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Maiandra GD",
                            ),
                          ),
                          const SizedBox(
                            height: Sizes.HEIGHT_16,
                          ),
                          Text(
                            data[index].description,
                            // "Anyone can work on this app screens as it is much easier to work around",
                            style: const TextStyle(
                              fontSize: Sizes.TEXT_SIZE_16,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Maiandra GD",
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      data.length,
                      (int index) => _buildDots(index: index),
                    ),
                  ),
                  _currentPage + 1 == data.length
                      ? Padding(
                          padding: const EdgeInsets.all(Sizes.RADIUS_24 + 6.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.TEXT_SIZE_16,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Sizes.SIZE_48,
                                ),
                              ),
                              padding: (width <= 550)
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 100.0, vertical: 20.0)
                                  : EdgeInsets.symmetric(
                                      horizontal: width * 0.2, vertical: 24.0),
                              textStyle: TextStyle(
                                fontSize: (width <= 550)
                                    ? Sizes.TEXT_SIZE_12
                                    : Sizes.TEXT_SIZE_16,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _pageController.jumpToPage(2);
                                },
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  elevation: 0.0,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: (width <= 550)
                                        ? Sizes.TEXT_SIZE_16
                                        : Sizes.TEXT_SIZE_24,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: const Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Sizes.TEXT_SIZE_16,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      Sizes.SIZE_48,
                                    ),
                                  ),
                                  padding: (width <= 550)
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 20.0)
                                      : const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 24.0),
                                  textStyle: TextStyle(
                                    fontSize: (width <= 550)
                                        ? Sizes.TEXT_SIZE_12
                                        : Sizes.TEXT_SIZE_16,
                                  ),
                                ),
                              ),
                            ],
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
