import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_state.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/navpages/home_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AppCubit, CubitStates>(
          builder: (context, state) {
            if (state is WelcomeState) {
              return WelcomePage();
            } else if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                ),
              );
            } else if (state is LoadedState) {
              return HomePage();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
