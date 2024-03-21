import 'package:flutter/material.dart';
import 'package:expenio_1/screens/login.dart';
import 'package:expenio_1/myText.dart';
import 'package:expenio_1/models/const_values.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:expenio_1/models/onboard_functions.dart';
import '../customBox.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _controller = PageController();
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _controller,
                  onPageChanged: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  itemBuilder: (context, i) {
                    var details = demo_data[i];
                    return OnBoardingContent(
                      image: details.image,
                      title: details.title,
                      description: details.description,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: MyText(
                      title: "Let's Go",
                      weight: FontWeight.w400,
                      color: textColor,
                      size: 14,
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                  ),
                  selectedIndex == 0 || selectedIndex == 1
                      ? InkWell(
                          onTap: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                          child: CustomBbox(
                            color: mainColor,
                            width: 91,
                            height: 45,
                            radius: BorderRadius.circular(20),
                            widget: Center(
                              child: MyText(
                                title: 'NEXT',
                                color: Colors.white,
                                size: textsize,
                              ),
                            ),
                          ),
                        )
                      : selectedIndex == 2
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => LogIn()));
                              },
                              child: CustomBbox(
                                color: mainColor,
                                width: 128,
                                height: 45,
                                radius: BorderRadius.circular(20),
                                widget: Center(
                                  child: MyText(
                                    title: 'Get Started',
                                    size: textsize,
                                    color: Colors.white,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          foregroundDecoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
        bigspace,
        MyText(
          title: title,
          color: mainColor,
          weight: FontWeight.w600,
          size: 24,
        ),
        smallspace,
        MyText(
          title: description,
          color: textColor,
          weight: FontWeight.w400,
          align: TextAlign.center,
          size: textsize,
        ),
      ],
    );
  }
}
