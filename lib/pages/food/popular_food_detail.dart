import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text.dart';
import 'package:food_delivery/widgets/icon_with_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Image background
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/food0.png'))),
            ),
          ),
          //Navigation top
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.home),
              ],
            ),
          ),
          //White Container with info
          Positioned(
            left: 0,
            right: 0,
            top: 300,
            bottom: 0,
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: 'Chinese'),
                      SizedBox(height: 40),
                      BigText(text: 'Introduce'),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandableText(
                            text:
                                'AAsdas asd asdasgda shsajgd asgdhasfd ah dghjasgd asjhdg asjgdjkas dag djhasg dhjasg djhasg djhasgd jasgd jasdgajhdg ajhssdg ajshgd ajkshk afhsa dauiwy jhsabvf hjas gd ad akd hasjhdg aswu euagsdyas ghdjahw gdashdvaAAA',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        height: 120,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.remove),
                  BigText(
                    text: '0',
                    color: Colors.black,
                  ),
                  Icon(Icons.add)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text('\$ | Add to cart'),
            ),
          ],
        ),
      ),
    );
  }
}
