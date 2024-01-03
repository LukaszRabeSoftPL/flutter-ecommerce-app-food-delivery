import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BigText(
                            text: 'Bangladesh',
                            color: AppColors.mainColor,
                            size: 20,
                          ),
                          Row(
                            children: [
                              SmallText(
                                text: 'Olsztyn',
                                color: Colors.black54,
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.mainColor),
                        ),
                      )
                    ]),
              ),
            ),
            Expanded(child: SingleChildScrollView(child: FoodPageBody())),
          ],
        ),
      ),
    );
  }
}
