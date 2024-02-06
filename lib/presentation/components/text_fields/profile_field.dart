import 'package:flutter/material.dart';
import 'package:meji_digital_test/constants.dart';

class ProfileField extends StatelessWidget {
  const ProfileField(
      {super.key, required this.title, required this.val, this.bottomMargin});
  final String title;
  final String val;
  final double? bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.only(bottom: bottomMargin ?? 0),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          border: const Border(left: BorderSide(width: 2, color: themeColor))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),
          Text(
            val,
            style: const TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
