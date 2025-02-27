import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/home/presentation/manager/task_cubit/task_states.dart';

import '../../data/models.dart';
import '../manager/task_cubit/task_cubit.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({super.key, required this.answer});

  final Answer answer;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color? color;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    TaskCubit cubit = BlocProvider.of<TaskCubit>(context);
    return BlocConsumer<TaskCubit, TaskStates>(
      listener: (context, state) {
        if (state is TaskCheck) {
          onPressed = () {};
          if (widget.answer.isCorrect) {
            color = Colors.green;
          } else if (!widget.answer.isCorrect &&
              cubit.selectedAnswer == widget.answer) {
            color = Colors.red;
          }
        } else if (state is TaskNext) {
          color = null;
          onPressed = null;
        }
      },
      builder: (context, state) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * .75, 0),
          maximumSize: Size.fromWidth(MediaQuery.of(context).size.width * .75),
          foregroundColor: Colors.black,
          padding: EdgeInsets.all(16),
          backgroundColor: color ??
              (cubit.selectedAnswer == widget.answer
                  ? Colors.white60
                  : Colors.white),
        ),
        onPressed: onPressed ??
            () {
              BlocProvider.of<TaskCubit>(context).selectAnswer(
                answer: widget.answer,
              );
            },
        child: Text(
          widget.answer.answer,
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
