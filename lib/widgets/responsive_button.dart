import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key, this.isResponsive = false, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.indigo,
      ),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceAround
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? AppText(
                  size: 18,
                  text: 'Book Trip Now ',
                  color: Colors.white,
                )
              : Container(),
          Icon(
            Icons.arrow_forward_ios_sharp,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
