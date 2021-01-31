import 'package:fiyaka/chat/view/chat_input.dart';
import 'package:fiyaka/chat/view/chat_section.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'chat_viewmodel.dart';

class ChatView extends ViewModelBuilderWidget<ChatViewModel> {
  @override
  ChatViewModel viewModelBuilder(BuildContext context) => ChatViewModel();

  @override
  bool get reactive => false;

  @override
  void onViewModelReady(ChatViewModel model) {}

  @override
  Widget builder(BuildContext context, ChatViewModel model, Widget child) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(98, 98, 98, 1.0),
      appBar: AppBar(
        title: Text('ChatView'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: ChatSection(),
            ),
            ChatInput(),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
