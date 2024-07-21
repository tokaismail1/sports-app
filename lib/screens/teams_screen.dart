import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/models/team_screen_model.dart';
import 'package:sportsapp/service/teamsrepo.dart';
import 'package:sportsapp/cubits/cubit/team_screen_cubit.dart';

class TeamsScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TeamsScreenCubit(TeamService())..fetchTeams('141'),
      child: Scaffold(
        //appBar: AppBar(title: Text('Teams')),
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
                  if (state is TeamsScreenLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is TeamsScreenLoaded) {
                    return state.filteredTeams.isEmpty
                        ? Center(child: Text('No teams found'))
                        : GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemCount: state.filteredTeams.length,
                            itemBuilder: (context, index) {
                              final team = state.filteredTeams[index];
                              return Card(
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
                                    Text(team.teamName),
                                  ],
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
      ),
    );
  }
}
