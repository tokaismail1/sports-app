import 'package:flutter/material.dart';

class SearchPlayers extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchPlayers({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Close the keyboard and unfocus the text field when tapping outside
        FocusScope.of(context).unfocus();
      },
      child: 
    Container(
      margin: EdgeInsets.only(top: 80, bottom: 60),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white, // Set color to white
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Example action, you can define your own
            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Select Player Name',
                labelStyle: TextStyle(color: Color.fromARGB(255, 129, 128, 128)), // Label color
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white, // Search icon color
                ),
                filled: true,
                fillColor: Color(0xff5C5470), // Background color of text field
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              style: TextStyle(color: Colors.white), // Text color
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    ),
    );
  }
}