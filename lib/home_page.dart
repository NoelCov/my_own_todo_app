import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
            child: Text(
              'Hello, Noel!',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            'TODAY\'S TASKS',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          Container(
            height: 30.0,
            width: 300.0,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
