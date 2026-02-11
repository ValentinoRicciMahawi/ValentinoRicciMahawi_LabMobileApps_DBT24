import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../data/mock_data.dart';
import '../widgets/contact_cart.dart';
import 'chat_screen.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = MockData.getUsers();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Messages',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final lastMessage = MockData.getLastMessage(user.id);
          final lastMessageTime = MockData.getLastMessageTime(user.id);

          return ContactCard(
            user: user,
            lastMessage: lastMessage,
            lastMessageTime: lastMessageTime,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(user: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}