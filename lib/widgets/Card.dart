import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sportsapp/models/Leagues_model.dart';

class LeaguesContainer extends StatelessWidget {
  const LeaguesContainer({
    super.key,
    required this.leaguesModel,
  });
  final LeaguesModel leaguesModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff5C5470),
            borderRadius: BorderRadius.circular(15)),
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(leaguesModel.leagueKey.toString(),
                      style: TextStyle(color: Color(0xffFAF0E6))),
                  Text(leaguesModel.countryKey.toString(),
                      style: TextStyle(color: Color(0xffFAF0E6)))
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  leaguesModel.leagueName,
                  style: TextStyle(color: Color(0xffFAF0E6)),
                ),
                Text(leaguesModel.countryName,
                    style: TextStyle(color: Color(0xffFAF0E6)))
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CachedNetworkImage(
                  imageUrl: leaguesModel.leagueLogo ??
                      'https://dieselpunkcore.com/wp-content/uploads/2014/06/logo-placeholder.png',
                  errorWidget: (context, url, error) =>
                      const Text('Logo is not Available'),
                  height: 50,
                  width: 50,
                ),
                CachedNetworkImage(
                  imageUrl: leaguesModel.countryLogo ??
                      'https://dieselpunkcore.com/wp-content/uploads/2014/06/logo-placeholder.png',
                  errorWidget: (context, url, error) =>
                     const Text('Logo is not Available'),
                  height: 50,
                  width: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
