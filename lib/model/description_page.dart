import 'package:flutter/material.dart';
import 'package:soul_serenity/theme.dart';
import 'card_item.dart';

class DescriptionPage extends StatelessWidget {
  final CardItem card;

  const DescriptionPage({required this.card, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Description'),
        backgroundColor: greenColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              card.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'By ${card.author}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Image.asset(card.imagePath),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}