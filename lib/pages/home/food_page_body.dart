import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_with_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider
        Container(
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),

        //dots
        SmoothPageIndicator(
          controller: pageController,
          count: 5,
          effect: ExpandingDotsEffect(
              radius: 8,
              spacing: 10,
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: AppColors.mainColor,
              dotColor: Colors.grey.shade300),
        ),

        SizedBox(
          height: 30,
        ),

        //Popular (text) and popular dish
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popuplar'),
              SizedBox(
                width: 10,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: BigText(text: '.', color: Colors.black26)),
              SizedBox(
                width: 10,
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: SmallText(text: 'Popular dish'))
            ],
          ),
        )

        // List of dishes
        ,
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 30,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 5, top: 5),
                  child: Row(
                    children: [
                      // Container with images (photo)
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/image/food0.png'))),
                      ),
                      //Container with text and info about dish
                      Expanded(
                        child: Container(
                          height: 95,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 10, top: 10, bottom: 10),
                            child: AppColumn(
                              text: 'Chinese',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

    //currentSlide
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);

      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);

      //next Slide
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }

    //previous Slide
    else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageHeaderControllerImageBox,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: index.isEven ? Colors.amber : Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/image/food0.png",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white10,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                        0.06), // Increase opacity for a more opaque shadow
                    //spreadRadius: 4,
                    blurRadius:
                        5.0, // Increase blur radius for a more blurred effect
                    offset:
                        Offset(0, 5), // Adjust the y-offset for the direction
                  ),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0))
                ],
              ),
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: 'Sushi Box'),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      size: 13,
                                      color: AppColors.mainColor,
                                    )),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SmallText(text: '4,6'),
                          SizedBox(
                            width: 5,
                          ),
                          SmallText(text: '(1300 comments)'),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconWithTextWidget(
                              icon: Icons.circle_sharp,
                              iconColor: AppColors.iconColor1,
                              text: 'Normal',
                            ),
                            IconWithTextWidget(
                                icon: Icons.pin_drop_outlined,
                                iconColor: AppColors.mainColor,
                                text: '1,2 km'),
                            IconWithTextWidget(
                                icon: Icons.access_time_rounded,
                                iconColor: AppColors.iconColor2,
                                text: '32 min')
                          ])
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
