import 'package:flutter/material.dart';
import 'package:sportsapp/screens/countries_screen.dart';
import 'package:sportsapp/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  
   final String? phoneNumber;
   const HomeScreen({super.key, this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF352F44),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {
                      Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => HomeScreen(),
                  ),
                );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.login, color: Colors.white),
                  onPressed: () {
                       Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => LoginScreen(),
                  ),
                );
                  },
                ),
              ],
            ),
          ],
        ),
        iconTheme: IconThemeData(color:Colors.white),
      ),
      backgroundColor: Color(0xFF352F44),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 40),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  FootballWidget(),
                  BasketballWidget(),
                  CricketWidget(),
                  TennisWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FootballWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SportsWidget(
      name: 'Football',
      image: 'assets/images/football.png',
      onTap: () {
        // Navigator.pushNamed(context, '/countries');
        Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => CountriesScreen()),
);
        
      },
    );
  }
}

class BasketballWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SportsWidget(
      name: 'Basketball',
      image: 'assets/images/basketball.png',
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Coming Soon'),
              content: Text('This feature is coming soon.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class CricketWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SportsWidget(
      name: 'Cricket',
      image: 'assets/images/cricket.png',
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Coming Soon'),
              content: Text('This feature is coming soon.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class TennisWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SportsWidget(
      name: 'Tennis',
      image: 'assets/images/tennis.png',
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Coming Soon'),
              content: Text('This feature is coming soon.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class SportsWidget extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;

  const SportsWidget({
    required this.name,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Color(0xFF5C5470), // Set a background color for the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
