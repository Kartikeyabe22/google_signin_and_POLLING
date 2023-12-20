import 'package:flutter/material.dart';

class MyPolls extends StatefulWidget {
  const MyPolls({super.key});

  @override
  State<MyPolls> createState() => _MyPollsState();
}

class _MyPollsState extends State<MyPolls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('My Polls')),
    );
  }
}
