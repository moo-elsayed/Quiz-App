import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:tasks_app/features/home/presentation/views/home_view.dart';
import 'package:tasks_app/simple_bloc_observer.dart';
import 'dart:math';
import 'features/home/data/models.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit()
        ..loadTasks(category: categories[Random().nextInt(categories.length)]),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
