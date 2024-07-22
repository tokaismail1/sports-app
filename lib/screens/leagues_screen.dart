import 'package:flutter/material.dart';
import 'package:flutter_application_sports_app/Widgets/Card.dart';
import 'package:flutter_application_sports_app/cubit/leagues_cubit.dart';
import 'package:flutter_application_sports_app/model/country_response_model.dart';
import 'package:flutter_application_sports_app/repos/Leagues_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class LeaguesScreen extends StatelessWidget {
  final Country country;

  const LeaguesScreen({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff352F44),
        title: Text(
          'Leagues in ${country.countryName}',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => LeaguesCubit(LeaguesRepo(Dio()))..getLeagues(country.countryName),
        child: Column(
          children: [
            BlocBuilder<LeaguesCubit, LeaguesState>(
              builder: (context, state) {
                if (state is LeaguesInitial) {
                  return Center(child: Text('Please wait...'));
                } else if (state is LeaguesLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is LeaguesSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.leagues.length,
                      itemBuilder: (context, index) {
                        return LeaguesContainer(
                          leaguesModel: state.leagues[index],
                        );
                      },
                    ),
                  );
                } else if (state is LeaguesFailure) {
                  return Center(child: Text('Error: error'));
                } else {
                  return Center(child: Text('Something went wrong'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
