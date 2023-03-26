import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_state.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling'
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return SafeArea(child: Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40, left: 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu_rounded,
                        size: 30,
                        color: Colors.black54,
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black12),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: AppLargeText(text: 'Discover'),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        labelPadding: EdgeInsets.only(left: 40, right: 20),
                        controller: _tabController,
                        dividerColor: Colors.white,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black26,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: CircleTabIndicator(
                            color: AppColors.mainColor, radius: 4),
                        tabs: [
                          Tab(
                            text: 'Places',
                          ),
                          Tab(
                            text: 'Inspiration',
                          ),
                          Tab(
                            text: 'Emotions',
                          ),
                        ]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: state.places.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubit>(context)
                                  .detailPage(state.places[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'http://mark.bslmeiyu.com/uploads/' +
                                          state.places[index].img),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Text('ji'),
                      Text('ji'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, top: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: 'Explore More',
                        size: 22,
                      ),
                      AppText(
                        text: 'See all',
                        color: Colors.indigoAccent,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 30),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('img/' +
                                            images.keys.elementAt(index)))),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: Colors.black87,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    ));
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _Ciriclepainter(color: color, radius: radius);
  }
}

class _Ciriclepainter extends BoxPainter {
  final Color color;
  double radius;
  _Ciriclepainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 + 8, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
