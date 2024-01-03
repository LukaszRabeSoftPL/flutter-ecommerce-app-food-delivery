import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_with_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(text: text),
      SmallText(text: 'description'),
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconWithTextWidget(
                icon: Icons.timeline,
                iconColor: AppColors.iconColor1,
                text: 'Normal'),
            IconWithTextWidget(
                icon: Icons.pin_drop_outlined,
                iconColor: AppColors.mainColor,
                text: '17 km'),
            IconWithTextWidget(
                icon: Icons.time_to_leave,
                iconColor: AppColors.iconColor1,
                text: '32 min'),
          ],
        ),
      )
    ]);
  }
}
