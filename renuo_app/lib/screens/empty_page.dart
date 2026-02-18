import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String title;

  const EmptyPage({super.key, this.title = 'Detail'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5C518),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: const Center(
        child: Text('Page is empty', style: TextStyle(fontSize: 18, color: Colors.grey)),
      ),
    );
  }
}
