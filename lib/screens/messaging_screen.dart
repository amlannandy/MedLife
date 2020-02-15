import 'package:flutter/material.dart';
import '../widgets/message_bubble.dart';

class MessagingScreen extends StatefulWidget {

  static const routeName = '/messaging_screen';

  final String doctorName;

  MessagingScreen(this.doctorName);

  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {

  final messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.doctorName,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => MessageBubble(),
        itemCount: messages.length,
      ),
    );
  }
}