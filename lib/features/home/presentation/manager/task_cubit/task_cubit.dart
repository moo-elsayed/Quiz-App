import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/home/data/models.dart';
import 'package:tasks_app/features/home/presentation/manager/task_cubit/task_states.dart';

import '../../../../../core/widgets/awesome_dialog.dart';

class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(TaskInitial());
  int currentIndex = 0;
  int score = 0;
  Answer? _selectedAnswer;
  List<Task> tasks = getTasks();

  void selectAnswer({required Answer answer}) {
    _selectedAnswer = answer;
  }

  void next({required BuildContext context}) {
    if (_selectedAnswer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('no selected answer'),
        ),
      );
      return;
    }

    if (_selectedAnswer!.isCorrect) score++;
    log(_selectedAnswer!.isCorrect.toString());
    _selectedAnswer = null;

    if (currentIndex != tasks.length - 1) {
      currentIndex++;
      emit(TaskNext());
    } else {
      showAwesomeDialog(
        context: context,
        title: 'Your score is $score',
        dismissOnTouchOutside: false,
        btnOkText: 'Restart',
        btnOkOnPress: () {
          currentIndex = 0;
          score = 0;
          emit(TaskNext());
        },
        dialogType: score >= 3 ? DialogType.success : DialogType.error,
      );
    }
  }
}
