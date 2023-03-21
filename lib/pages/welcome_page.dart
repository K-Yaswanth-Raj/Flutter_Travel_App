import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  List images = [
    'w1.jpg',
    'w3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        image: AssetImage('img/' + images[index]))),
                child: Container(
                  margin: EdgeInsets.only(top: 90, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: 'Trips'),
                          AppText(
                            text: 'Mountain',
                            size: 30.0,
                            //color: Colors.black87,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            width: 300,
                            child: AppText(
                                color: Colors.black87,
                                size: 18,
                                text:
                                    'Mountain hikes give you an incredible sense of freedom along with endurance tests.'),
                          ),

                          //21.17
                        ],
                      ),
                      Column(
                        children: List.generate(images.length, (indexDots) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 4.5),
                            width: 8,
                            height: index == indexDots ? 25 : 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == indexDots
                                    ? Colors.black87
                                    : Colors.black38),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
