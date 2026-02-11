class MessageModel {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final bool isMe;
  final MessageType type;

  const MessageModel({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    required this.isMe,
    this.type = MessageType.text,
  });
}

enum MessageType { text, image, emoji }

class ChatModel {
  final String id;
  final String username;
  final String displayName;
  final String avatarUrl;
  final String lastMessage;
  final String timeAgo;
  final bool hasUnread;
  final int unreadCount;
  final bool hasStory;
  final List<MessageModel> messages;

  const ChatModel({
    required this.id,
    required this.username,
    required this.displayName,
    required this.avatarUrl,
    required this.lastMessage,
    required this.timeAgo,
    required this.messages,
    this.hasUnread = false,
    this.unreadCount = 0,
    this.hasStory = false,
  });
}
