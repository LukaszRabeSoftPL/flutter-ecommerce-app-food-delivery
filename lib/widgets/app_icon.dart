import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  Color colorIcon;
  double size;
  Color colorBack;
  IconData icon;

  AppIcon({
    required this.icon,
    this.size = 50,
    this.colorIcon = Colors.black,
    Key? key,
  })  : colorBack = Colors.white.withOpacity(0.1),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: colorBack,
        backgroundBlendMode: BlendMode.luminosity,
      ),
      child: Center(
        child: Icon(
          icon,
          color: colorIcon,
        ),
      ),
    );
  }
}
