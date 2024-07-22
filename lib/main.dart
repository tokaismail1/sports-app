import 'package:flutter/material.dart';
import 'package:flutter_application_sports_app/cubit/cubit.dart';
import 'package:flutter_application_sports_app/screens/countries_screen.dart';
import 'package:flutter_application_sports_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BlocProvider(
        create: (context) => GetDataCubit(),
        child: HomeScreen(),
      ),
    );
  }
}
