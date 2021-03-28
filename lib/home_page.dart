import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {},
              child: Icon(Icons.clear, size: 40.0, color: Colors.white),
            ),
            FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {},
              child: Icon(Icons.add, size: 40.0, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0, top: 60.0, bottom: 20.0),
            child: Text(
              'Hello, Noel!',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Text(
              'TODAY\'S TASKS',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          TaskContainer(),
          TaskContainer(),
        ],
      ),
    );
  }
}

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Hello');
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        decoration: BoxDecoration(
            color: Color(0xFF3A3A3A),
            borderRadius: BorderRadius.circular(15.0)),
        child: Center(
          child: Text(
            'Task number 1',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                textBaseline: TextBaseline.ideographic),
          ),
        ),
      ),
    );
  }
}
