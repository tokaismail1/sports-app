import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/cubits/cubit/leagues_cubit.dart';
import 'package:sportsapp/widgets/Card.dart';
import 'package:sportsapp/models/country_response_model.dart';
import 'package:sportsapp/screens/leagues_details.dart';
import 'package:sportsapp/service/Leagues_repo.dart';
import 'package:dio/dio.dart';

class LeaguesScreen extends StatelessWidget {
  final Country country;

  const LeaguesScreen({required this.country, Key? key}) : super(key: key);

  void _navigateToLeagueDetails(BuildContext context, int leagueId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TeamsDetailsScreen(leagueId: leagueId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaguesCubit(LeaguesService(Dio()))..getLeagues(country.countryKey),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff352F44),
          title: Text(
            'Leagues in ${country.countryName}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color:Colors.white),
        ),
        body: Column(
          children: [
            BlocBuilder<LeaguesCubit, LeaguesState>(
              builder: (context, state) {
                if (state is LeaguesInitial) {
                  return const Center(
                    child: Text('Please wait...'),
                  );
                } else if (state is LeaguesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LeaguesSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.leagues.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _navigateToLeagueDetails(context, state.leagues[index].leagueKey),
                          child: LeaguesContainer(
                            leaguesModel: state.leagues[index],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
