import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Settings"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Support",
                style: TextStyle(color: Colors.white),
              ),
            ),
            settingsButton("Feedback", () {}),
            settingsButton("Help", () {}),
            settingsButton("About", () {}),
          ],
        ),
      ),
    );
  }

  Widget settingsButton(String title, Function onpress) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 150),
      onPressed: onpress,
    );
  }
}
