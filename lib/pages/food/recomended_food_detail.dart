import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class RecomencedFoodDetail extends StatelessWidget {
  const RecomencedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 100,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(
                  child: Text('Sliver Title App Bar'),
                ),
              ),
            ),
            backgroundColor: Colors.amber,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/food0.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  BigText(text: 'Text1'),
                  SmallText(
                      text:
                          'AAALorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus ')
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //add and remove button
            Center(
              child: Container(
                width: 150,
                child: Row(
                  children: [
                    AppIcon(icon: Icons.remove),
                    SizedBox(
                      width: 10,
                    ),
                    BigText(
                      text: '0',
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AppIcon(icon: Icons.add),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Button add to basket
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: double.maxFinite,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.grey.withOpacity(0.4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Icon(Icons.favorite),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('\$ | Add to cart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
