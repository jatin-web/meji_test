import 'package:flutter/material.dart';
import 'package:meji_digital_test/models/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            news.title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          const SizedBox(height: 5),
          Text(
            news.description,
            maxLines: 2,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey.shade300,
            alignment: Alignment.center,
            child: const Text(
              "Sample Image",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
