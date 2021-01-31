import 'package:fiyaka/auth/widget/message_bubble.dart';
import 'package:fiyaka/chat/service/chat_service.dart';
import 'package:fiyaka/core/locator.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  final chatService = locator<ChatService>();
  final textController = TextEditingController();
  var messages = <Widget>[];

  void updateMessages() {
    final conversation = chatService.conversation;
    if (conversation == null) {
      return;
    }
    final landlordId = conversation.landlord;
    messages = conversation.messages
        .map(
          (m) => MessageBubble(
            isReceived: m.from == landlordId,
            text: m.content,
          ),
        )
        .toList();
  }

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

  void join() {
    chatService.join();
  }
}
