import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../auth/service/auth_service.dart';
import '../../core/constant/api_config.dart';
import '../model/api/api_conversation.dart';
import '../model/api/api_message_post.dart';
import '../model/api/join_post.dart';

class ChatService with ChangeNotifier {
  final AuthService authService;
  final Socket socket;

  ApiConversation conversation;

  ChatService(this.authService)
      : socket = io(
          ApiConfig.socket,
          OptionBuilder()
              .setTransports(['websocket'])
              .enableAutoConnect()
              .build(),
        ) {
    socket.onConnect((data) {
      print('SocketService: Connected $data');
    });

    socket.onDisconnect((data) {
      print('SocketService: Disconnected $data');
    });

    socket.on('message', (data) {
      print('message: $data');
      conversation = ApiConversation.fromJson(data);
      notifyListeners();
    });

    socket.on('tenant_conversation', (data) {
      print('tenant_conversation: $data');
      conversation = ApiConversation.fromJson(data);
      notifyListeners();
    });
  }

  void join() {
    final token = authService.readToken();
    final data = JointPost(
      token: token,
    );
    final json = data.toJson();
    socket.connect();
    socket.emit('join_tenant', json);
  }

  void sendMessage(String content, String to) {
    final token = authService.readToken();
    final data = ApiMessagePost(
      content: content,
      to: to,
      token: token,
    );
    final json = data.toJson();
    socket.connect();
    socket.emit('send_message', json);
  }
}
