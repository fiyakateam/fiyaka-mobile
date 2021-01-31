import 'package:flutter/material.dart';

class ChatSection extends StatelessWidget {
  final List<Widget> messages;

  const ChatSection({Key key, @required this.messages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild section");
    return ListView.builder(
      itemBuilder: (_, int index) => messages[index],
      itemCount: messages.length,
      reverse: true,
      padding: EdgeInsets.all(6.0),
    );
  }
}
