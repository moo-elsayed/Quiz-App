import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle(
      {super.key,
      this.top,
      this.left,
      this.right,
      this.bottom,
      this.child,
      this.color, this.radius});

  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final Widget? child;
  final Color? color;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: CircleAvatar(
        radius: radius ?? 20,
        backgroundColor: color ?? Colors.white,
        child: child,
      ),
    );
  }
}
