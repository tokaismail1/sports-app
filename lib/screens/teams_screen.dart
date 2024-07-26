import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/cubits/cubit/team_screen_cubit.dart';
import 'package:sportsapp/screens/players_screen.dart';

class TeamsScreen extends StatefulWidget {
  final int leagueId;

  TeamsScreen({required this.leagueId});

  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<TeamsScreenCubit>().fetchTeams(widget.leagueId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Teams',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                final cubit = context.read<TeamsScreenCubit>();
                final currentState = cubit.state;
                if (currentState is TeamsScreenLoaded) {
                  cubit.filterTeams(query, currentState.teams);
                }
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<TeamsScreenCubit, TeamsScreenState>(
              builder: (context, state) {
                print('Current state: $state');
                if (state is TeamsScreenLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TeamsScreenLoaded) {
                  print('Loaded teams: ${state.filteredTeams}');
                  return state.filteredTeams.isEmpty
                      ? Center(child: Text('No teams found'))
                      : GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemCount: state.filteredTeams.length,
                          itemBuilder: (context, index) {
                            final team = state.filteredTeams[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PlayerScreen(teamId: team.teamKey),
                                  ),
                                );
                              },
                              child: Card(
                                color: Color(0xFF5C5470),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      team.teamLogo,
                                      height: 50,
                                      width: 50,
                                      errorBuilder: (context, error, stackTrace) {
                                        print('Error loading image: $error');
                                        return Icon(Icons.error);
                                      },
                                      loadingBuilder: (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Center(child: CircularProgressIndicator());
                                      },
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      team.teamName,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                } else if (state is TeamsScreenError) {
                  return Center(child: Text('Error: ${state.error}'));
                } else {
                  return Center(child: Text('No teams found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
