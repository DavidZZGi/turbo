import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  final List<String> categories = ["Mountains", "Forest", "Ocean", "Desert"];
  final List<IconData> icons = [
    Icons.terrain,
    Icons.forest,
    Icons.waves,
    Icons.landscape
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(categories.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                radius: 22,
                child: Icon(icons[index], color: Colors.red),
              ),
              SizedBox(height: 4),
              Text(categories[index], style: TextStyle(fontSize: 12)),
            ],
          ),
        );
      }),
    );
  }
}
