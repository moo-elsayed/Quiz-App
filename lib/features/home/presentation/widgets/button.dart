import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key, required this.media, this.onPressed, required this.text});

  final Size media;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        fixedSize: Size(media.width * .35, media.height * .06),
      ),
      onPressed: onPressed ?? () {},
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
