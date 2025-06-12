import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/message.dart';
import '../services/chat_service.dart';
import '../providers/user_provider.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String characterId;
  const ChatScreen({super.key, required this.characterId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatService _chatService;
  late Future<List<Message>> _futureMessages;
  final TextEditingController _controller = TextEditingController();
  late String _roomId;
  Timer? _timer;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final token = Provider.of<UserProvider>(context, listen: false).token!;
    _chatService = ChatService(token: token);
    _roomId = widget.characterId;
    _futureMessages = _chatService.fetchMessages(_roomId);

    // 5초마다 메시지 새로고침
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _futureMessages = _chatService.fetchMessages(_roomId);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  bool _canSendMessage() {
    return _controller.text.trim().isNotEmpty;
  }

  Future<void> _sendMessage() async {
    final content = _controller.text.trim();
    if (content.isEmpty) return;

    try {
      await _chatService.sendMessage(_roomId, content);
      _controller.clear();
      setState(() {
        _futureMessages = _chatService.fetchMessages(_roomId);
      });
      // 메시지 전송 후 스크롤 맨 아래로 이동
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('전송 실패: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('채팅방')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Message>>(
              future: _futureMessages,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('에러: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('메시지가 없습니다.'));
                }

                final messages = snapshot.data!;
                return ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[messages.length - 1 - index];
                    return MessageBubble(message: message);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: '메시지를 입력하세요'),
                    onChanged: (_) => setState(() {}),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _canSendMessage() ? _sendMessage : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}