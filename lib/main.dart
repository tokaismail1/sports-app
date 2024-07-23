import 'package:flutter/material.dart';
import 'package:sportsapp/screens/leagues_details.dart';
import 'package:sportsapp/screens/leagues_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/cubits/cubit/leagues_cubit.dart';


import 'package:sportsapp/service/Leagues_repo.dart';

void main() {
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaguesCubit(LeaguesService(Dio()))..getLeagues(),
      child: const MaterialApp(
        home: LeaguesScreen(),
      ),
    );
  }
}