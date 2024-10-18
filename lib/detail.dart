import 'package:flutter/material.dart';
import 'destination.dart';

class DetailPage extends StatelessWidget {
  final Destination destination;

  DetailPage({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(destination.imageUrl, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              destination.description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
