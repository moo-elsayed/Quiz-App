import 'package:flutter/material.dart';
import 'package:tasks_app/features/home/presentation/widgets/circle.dart';

class QuestionTicket extends StatelessWidget {
  const QuestionTicket({super.key, required this.question});

  final String question;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            question,
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
        Circle(left: -20, color: Colors.black),
        Circle(right: -20, color: Colors.black),
        Circle(
          top: -26,
          radius: 26,
          child: Icon(
            Icons.check,
            color: Colors.green,
            size: 42,
          ),
        ),
      ],
    );
  }
}
