import 'dart:developer';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/core/gemini_service.dart';
import 'package:tasks_app/features/home/data/models.dart';
import 'package:tasks_app/features/home/presentation/manager/task_cubit/task_states.dart';

import '../../../../../core/widgets/awesome_dialog.dart';

class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(TaskInitial());
  int currentIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  List<Task> tasks = [];
  bool _check = false;
  String? _cat;

  void loadTasks({required String category}) async {
    _cat = category;
    emit(TaskGetListLoading());
    try {
      tasks = await GeminiService.get(category: category);
      emit(TaskGetListSuccess());
    } catch (e) {
      tasks = getTasks();
      emit(TaskGetListFailure());
    }
  }

  void selectAnswer({required Answer answer}) {
    if (selectedAnswer == answer) {
      selectedAnswer = null;
    } else {
      selectedAnswer = answer;
    }

    emit(TaskSelect());
  }

  void check() {
    emit(TaskCheck());
    _check = true;
  }

  void next({required BuildContext context}) {
    if (selectedAnswer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('no selected answer'),
        ),
      );
      return;
    }

    if (_check == false) {
      check();
      return;
    }

    _check = false;
    if (selectedAnswer!.isCorrect) score++;
    selectedAnswer = null;

    if (currentIndex != tasks.length - 1) {
      currentIndex++;
      emit(TaskNext());
    } else {
      showAwesomeDialog(
        context: context,
        title: 'Your score is $score',
        dismissOnTouchOutside: false,
        btnOkText: 'Restart',
        //cancelText: 'Restart',
        btnOkColor: Colors.green,
        btnOkOnPress: () {
          //tasks = [];
          loadTasks(category: categories[Random().nextInt(categories.length)]);
          currentIndex = 0;
          score = 0;
          //emit(TaskNext());
        },
        // btnOkOnPress: () {
        //   // currentIndex = 0;
        //   // score = 0;
        //   // emit(TaskNext());
        //
        //   loadTasks(category: _cat!);
        //   currentIndex = 0;
        //   score = 0;
        // },
        dialogType: score >= 3 ? DialogType.success : DialogType.error,
      );
    }
  }
}
