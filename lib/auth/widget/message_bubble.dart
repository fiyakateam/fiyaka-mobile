import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final bool isReceived;
  final String text;
  const MessageBubble({Key key, this.isReceived, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isReceived
        ? Bubble(
            alignment: Alignment.topLeft,
            margin: BubbleEdges.only(top: 10),
            nip: BubbleNip.leftTop,
            child: Text(text),
          )
        : Bubble(
            alignment: Alignment.topRight,
            margin: BubbleEdges.only(top: 10),
            nip: BubbleNip.rightTop,
            color: Color.fromRGBO(225, 255, 199, 1.0),
            child: Text(text, textAlign: TextAlign.right),
          );
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    // TODO: implement toString
    return 'Text: $text';
  }
}
