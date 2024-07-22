import 'package:flutter/material.dart';
import 'package:flutter_application_sports_app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar background to white
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
                    color: Colors.black, // Set text color to black
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Color(0xFF5C5470)), // Home icon in specific color
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
                  icon: Icon(Icons.login, color: Color(0xFF5C5470)), // Login icon in specific color
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
        iconTheme: IconThemeData(color: Color.fromARGB(255, 159, 113, 168)), // Set icon theme to specific color
      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle the form submission
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
