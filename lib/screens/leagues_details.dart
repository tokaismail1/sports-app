import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/screens/teams_screen.dart';
import 'package:sportsapp/screens/topscore_screen.dart';
import 'package:sportsapp/service/teamsrepo.dart';
import 'package:sportsapp/cubits/cubit/team_screen_cubit.dart';

class TeamsDetailsScreen extends StatefulWidget {
  final int leagueId;

  const TeamsDetailsScreen({required this.leagueId, Key? key}) : super(key: key);

  @override
  _TeamsDetailsScreenState createState() => _TeamsDetailsScreenState();
}

class _TeamsDetailsScreenState extends State<TeamsDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeamsScreenCubit(TeamService())..fetchTeams(widget.leagueId),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 40,
                width: 40,
              ),
              SizedBox(width: 10),
              Text(
                'Sports App',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.home, color: Color(0xFF5C5470)),
              onPressed: () {
                // Add home button functionality here
              },
            ),
            IconButton(
              icon: Icon(Icons.login, color: Color(0xFF5C5470)),
              onPressed: () {
                // Add login button functionality here
              },
            ),
          ],
          iconTheme: IconThemeData(color: Color(0xFF5C5470)),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Teams'),
              Tab(text: 'Top Scorers'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            TeamsScreen(leagueId: widget.leagueId),
            TopScorersScreen(leagueId: widget.leagueId),
          ],
        ),
      ),
    );
  }
}
