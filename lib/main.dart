import 'package:flutter/material.dart';
import 'package:sportsapp/screens/leagues_details.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: teamsdetailsscreen(),
    );
  }
}