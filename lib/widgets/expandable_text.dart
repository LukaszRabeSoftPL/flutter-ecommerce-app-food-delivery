import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  ExpandableText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstText;
  late IconData iconUp = Icons.abc;
  late IconData iconDown = Icons.cloud_circle;
  bool isClicked = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstText = widget.text.substring(0, 40);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ReadMoreText(
            widget.text,
            trimLines: 2,
            style: TextStyle(color: Colors.black),
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: '...Read more',
            trimExpandedText: ' Less',
          ),
          InkWell(
            onTap: () {
              setState(() {
                isClicked = !isClicked;
              });
            },
            child: Row(
              children: [
                Icon(isClicked ? iconUp : iconDown),
                Text(firstText.length.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
