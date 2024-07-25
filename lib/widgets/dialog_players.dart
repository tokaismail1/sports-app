import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:sportsapp/cubits/cubit/players_cubit.dart';
import 'package:sportsapp/cubits/cubit/players_state.dart';
import 'package:sportsapp/models/players_model.dart';
import 'package:sportsapp/service/players_repo.dart';

class CustomDialogWidget extends StatelessWidget {
  final Result? playerData;

  const CustomDialogWidget({required this.playerData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard
        FocusScope.of(context).unfocus();
      },
      child:
    Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          BlocProvider(
            create: (context) => PlayersCubit(PlayersRepo()), // Ensure PlayersRepo is correctly initialized
            child: BlocBuilder<PlayersCubit, PlayersState>(
              builder: (context, state) {
                return Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(playerData?.playerName ?? "", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      if (playerData?.playerImage != null && playerData!.playerImage!.isNotEmpty)
                        Image.network(
                          playerData!.playerImage!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            print('Error loading image: $error');
                            return Center(
                              child: Icon(Icons.image_not_supported, size: 60, color: Colors.grey),
                            );
                          },
                        ),
                      if (playerData?.playerImage == null || playerData!.playerImage!.isEmpty)
                        Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                      SizedBox(height: 10),
                      Text('Number: ${playerData?.playerNumber ?? ''}', style: TextStyle(fontSize: 18)),
                      Text('Country: ${playerData?.playerCountry ?? ''}', style: TextStyle(fontSize: 18)),
                      Text('Position: ${playerData?.playerType ?? ''}', style: TextStyle(fontSize: 18)),
                      Text('Age: ${playerData?.playerAge ?? ''}', style: TextStyle(fontSize: 18)),
                      Text('Yellow Cards: ${playerData?.playerYellowCards ?? ''}', style: TextStyle(fontSize: 18)),
                      Text('Red Cards: ${playerData?.playerRedCards ?? ''}', style: TextStyle(fontSize: 18)),
                      Text('Goals: ${playerData?.playerGoals ?? ''}', style: TextStyle(fontSize: 18)),
                      Text('Assists: ${playerData?.playerAssists ?? ''}', style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      _shareTextButton(context),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 45,
              height: 45,
              child: IconButton(
                icon: Icon(Icons.close),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  FocusScope.of(context).unfocus();
                },
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 170, 169, 169),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }





  Widget _shareTextButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      String playerName = playerData?.playerName ?? '';
      String teamName = playerData?.teamName ?? '';

      // Share the data
      Share.share(
        'Player Name: $playerName Club: $teamName',
      );

      // Print the data to the console
      print('Player Name: $playerName , Club: $teamName');
    },
    color: Colors.grey,
    icon: Icon(
      Icons.share,
      size: 40,
    ),
  );
}
}