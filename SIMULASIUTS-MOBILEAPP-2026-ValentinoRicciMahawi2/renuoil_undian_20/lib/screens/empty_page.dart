import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String title;
  const EmptyPage({super.key, this.title = 'Page'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFC107),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title, style: const TextStyle(color: Colors.black)),
      ),
      body: const Center(child: Text('')),
    );
  }
}
