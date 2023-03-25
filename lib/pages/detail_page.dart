import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('img/mountain.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 30,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        size: 40,
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 250,
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: 'Yosemite',
                            color: Colors.black87,
                          ),
                          AppLargeText(
                            text: '\$ 250',
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_rounded,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'USA, California',
                            style: TextStyle(color: AppColors.mainColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(4, (index) {
                              return Icon(
                                Icons.star_rate,
                                color: Colors.amber,
                              );
                            }),
                          ),
                          Icon(
                            Icons.star_half,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          AppText(
                            text: '(4.5)',
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      AppLargeText(
                        text: 'People',
                        color: Colors.black87,
                        size: 23,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: 'Number of people in your group',
                        size: 16,
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 6),
                              child: AppButton(
                                text: (index + 1).toString(),
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black87,
                                size: 60,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppLargeText(
                        text: 'Description',
                        size: 23,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        height: 3.5,
                      ),
                      AppText(
                        text:
                            'You must go for a travel. Travelling helps get rid of pressure. Go to mountains to see the nature. ',
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 30,
                child: Row(
                  children: [
                    AppButton(
                      isIcon: true,
                      size: 60,
                      color: AppColors.textColor1,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.textColor2,
                      icon: Icons.favorite_border,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                      width: 250,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
