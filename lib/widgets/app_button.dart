import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../misc/colors.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  bool? isIcon;
  final Color borderColor;
  AppButton(
      {super.key,
      required this.size,
      this.text,
      this.icon,
      this.isIcon = false,
      required this.color,
      required this.backgroundColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18)),
      height: size,
      width: size,
      child: Center(
        child: isIcon == false
            ? Center(
                child: AppText(
                size: 25,
                text: text!,
                color: Colors.black,
              ))
            : Center(
                child: Icon(
                  icon,
                  color: color,
                ),
              ),
      ),
    );
  }
}
