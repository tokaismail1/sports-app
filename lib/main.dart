import 'package:flutter/material.dart';
import 'package:sportsapp/screens/login_screen.dart';
import 'package:sportsapp/screens/home_screen.dart';
import 'package:sportsapp/screens/countries_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/countries': (context) => CountriesScreen(),
      },
    );
  }
}
