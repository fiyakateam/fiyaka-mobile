import 'package:fiyaka/auth/widget/message_bubble.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  final textController = TextEditingController();
  final messages = <Widget>[];
  void handleSubmitted(String text) {
    textController.clear();
    if (text != '') {
      messages.insert(
        0,
        MessageBubble(
          isReceived: false,
          text: text,
        ),
      );
      notifyListeners();
    }
  }

  void receiveMessage(String text) {
    textController.clear();
    if (text != '') {
      messages.insert(
        0,
        MessageBubble(
          isReceived: true,
          text: text,
        ),
      );
      notifyListeners();
    }
  }
}
