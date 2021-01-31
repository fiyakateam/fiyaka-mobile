import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chat_viewmodel.dart';

class ChatSection extends ViewModelWidget<ChatViewModel> {
  @override
  Widget build(BuildContext context, ChatViewModel model) {
    return ListView.builder(
      itemBuilder: (_, int index) => model.messages[index],
      itemCount: model.messages.length,
      reverse: true,
      padding: EdgeInsets.all(6.0),
    );
  }
}
