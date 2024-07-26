// import 'package:flutter/material.dart';
// import 'package:sportsapp/helpers/update_login_status.dart';
// import 'package:sportsapp/screens/home_screen.dart';

// class StartScreen extends StatefulWidget {
//   final String? phoneNumber;
//   const StartScreen({super.key, this.phoneNumber});

//   @override
//   _StartScreenState createState() => _StartScreenState();
// }

// class _StartScreenState extends State<StartScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Navigate to HomeScreen after a 2-second delay
//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.pushReplacement(context,
//           MaterialPageRoute(builder: (context) {
//         return HomeScreen();
//       }));

//       updateLoginStatus(true);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF5C5470),
    
//       body: Center(
//         child: Text("${widget.phoneNumber} is logged in successfully",
//             style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white)),
//       ),
//     );
//   }
// }
