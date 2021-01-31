import '../service/chat_service.dart';
import 'chat_input.dart';
import 'chat_section.dart';
import '../../core/locator.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'chat_viewmodel.dart';

class ChatView extends ViewModelBuilderWidget<ChatViewModel> {
  @override
  ChatViewModel viewModelBuilder(BuildContext context) => ChatViewModel();

  @override
  bool get reactive => true;

  @override
  void onViewModelReady(ChatViewModel model) {
    model.join();
  }

  @override
  Widget builder(BuildContext context, ChatViewModel model, Widget child) {
    context.watch<ChatService>();
    model.updateMessages();
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
