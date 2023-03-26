import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_logics.dart';
import 'cubit/app_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      //home: WelcomePage(),
      home: BlocProvider<AppCubit>(
        create: (context) => AppCubit(),
        child: AppCubitLogics(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
