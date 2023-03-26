import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
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
  var a = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (context, index) {
              a = index;
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        image: AssetImage('img/' + images[index]))),
                child: Column(
                  children: [
                    Container(
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
                    Spacer(),
                    a == 0
                        ? Column(
                            children: [
                              Center(
                                child: Text(
                                  'Swipe Down',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  size: 55,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Container(
                                child: Center(
                                  child: TextButton(
                                    //style: ButtonStyle(elevation: MaterialStateProperty()),
                                    child: Text(
                                      '    Go    ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                    style: TextButton.styleFrom(
                                        side: BorderSide(
                                      color: Colors.white,
                                    )),
                                    onPressed: () {
                                      BlocProvider.of<AppCubit>(context).getTravelData();
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              )
                            ],
                          ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
