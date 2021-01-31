import 'package:fiyaka/chat/view/chat_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

class ChatInput extends HookViewModelWidget<ChatViewModel> {
  @override
  bool get reactive => false;
  @override
  Widget buildViewModelWidget(BuildContext context, ChatViewModel model) {
    return Row(
      children: [
        Container(
          child: IconButton(
            icon: const Icon(Icons.send),
            color: Colors.blue,
            onPressed: () => model.receiveMessage(model.textController.text),
          ),
        ),
        Flexible(
          child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            controller: model.textController,
            onSubmitted: model.handleSubmitted,
            decoration: InputDecoration(
              hintText: 'Send a message',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
        Container(
          child: IconButton(
            icon: const Icon(Icons.send),
            color: Colors.blue,
            onPressed: () => model.handleSubmitted(model.textController.text),
          ),
        ),
      ],
    );
  }
}
