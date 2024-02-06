import 'package:flutter/material.dart';
import 'package:meji_digital_test/constants.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.isLaoding = false, this.color});
  final String title;
  final VoidCallback onTap;
  final bool isLaoding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        color: color ?? themeColor,
        alignment: Alignment.center,
        child: isLaoding
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                title.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
      ),
    );
  }
}
