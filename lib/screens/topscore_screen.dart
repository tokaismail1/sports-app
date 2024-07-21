import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/cubits/cubit/topscore_cubit.dart';
import 'package:sportsapp/models/topscore_model.dart';
import 'package:sportsapp/service/topscore_repo.dart';

class TopScorersScreen extends StatelessWidget {
  final TopScorerService _topScorerService = TopScorerService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopScorerCubit(_topScorerService)..fetchTopScorers('141'),
      child: Scaffold(
        //appBar: AppBar(title: Text('Top Scorers')),
        body: BlocBuilder<TopScorerCubit, TopScorerState>(
          builder: (context, state) {
            if (state is TopScorerLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is TopScorerLoaded) {
              return ListView.builder(
                itemCount: state.topScorers.length,
                itemBuilder: (context, index) {
                  final player = state.topScorers[index];
                  return ListTile(
                    title: Text(player.playerName),
                    subtitle: Text('Goals: ${player.goals}'),
                  );
                },
              );
            } else if (state is TopScorerError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}
