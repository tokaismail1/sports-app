import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/cubits/cubit/players_cubit.dart';
import 'package:sportsapp/cubits/cubit/players_state.dart';
import 'package:sportsapp/widgets/players.dart';
import 'package:sportsapp/widgets/search_players.dart';
import 'package:sportsapp/service/players_repo.dart'; // Add import for PlayersRepo

class PlayerScreen extends StatelessWidget {
  final int teamId;

  const PlayerScreen({Key? key, required this.teamId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayersCubit(PlayersRepo())..fetchPlayers(teamId),
      child: GestureDetector(
        onTap: () {
          // Close the keyboard and unfocus the text field when tapping outside
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Color(0xff352F44),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Builder(
                  builder: (context) {
                    return SearchPlayers(
                      onChanged: (query) {
                        context.read<PlayersCubit>().filterPlayers(query);
                      },
                    );
                  },
                ),
                BlocBuilder<PlayersCubit, PlayersState>(
                  builder: (context, state) {
                    if (state is PlayersLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is PlayersSuccess) {
                      return Container(
                        height: MediaQuery.of(context).size.height - 310,
                        child: PageView.builder(
                          itemCount: state.responceModel.result?.length ?? 0,
                          itemBuilder: (context, index) => PlayrsCard(
                            player: state.responceModel.result![index],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text('Something went wrong'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
