import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_large_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
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
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: AppLargeText(text: 'Discover'),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: TabBar(controller: , tabs: [
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
          )
        ],
      ),
    ));
  }
}
