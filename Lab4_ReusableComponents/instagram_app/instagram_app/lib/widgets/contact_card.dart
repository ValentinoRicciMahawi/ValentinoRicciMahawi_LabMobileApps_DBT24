import 'package:flutter/material.dart';
import '../models/message_model.dart';

class ContactCard extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;

  const ContactCard({
    super.key,
    required this.chat,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: chat.hasStory
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFf09433),
                              Color(0xFFe6683c),
                              Color(0xFFdc2743),
                              Color(0xFFcc2366),
                              Color(0xFFbc1888),
                            ],
                          )
                        : null,
                    color: chat.hasStory ? null : Colors.grey[800],
                  ),
                  padding: chat.hasStory ? const EdgeInsets.all(2) : null,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    padding: chat.hasStory ? const EdgeInsets.all(2) : null,
                    child: ClipOval(
                      child: Image.network(
                        chat.avatarUrl,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey[700],
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.displayName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: chat.hasUnread
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${chat.lastMessage} · ${chat.timeAgo}',
                    style: TextStyle(
                      color: chat.hasUnread
                          ? Colors.white
                          : Colors.grey[500],
                      fontSize: 13,
                      fontWeight: chat.hasUnread
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            if (chat.hasUnread && chat.unreadCount > 0)
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF0095F6),
                  shape: BoxShape.circle,
                ),
              )
            else
              Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey[600],
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
