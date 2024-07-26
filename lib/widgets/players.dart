import 'package:flutter/material.dart';
import 'package:sportsapp/models/players_model.dart';
import 'package:sportsapp/widgets/dialog_players.dart';

class PlayrsCard extends StatelessWidget {
  final Result player;

  const PlayrsCard({required this.player, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CustomDialogWidget(playerData: player),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 370,
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff5C5470),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: player.playerImage != null && player.playerImage!.isNotEmpty
                        ? Image.network(
                            player.playerImage!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print('Error loading image: $error');
                              return Center(
                                child: Icon(Icons.image_not_supported, size: 60, color: Colors.white),
                              );
                            },
                          )
                        : Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 130,
              width: 320,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.6),
                    blurRadius: 20.0,
                    offset: Offset(-5, -5),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      Text(player.playerName ?? "",
                          style: TextStyle(
                              color: Color(0xff352F44),
                              fontWeight: FontWeight.bold,
                              fontSize: 22)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        player.playerType ?? "",
                        style: TextStyle(
                            color: Color(0xff352F44),
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}