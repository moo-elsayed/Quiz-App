import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:tasks_app/features/home/presentation/manager/task_cubit/task_states.dart';
import 'package:tasks_app/features/home/presentation/widgets/buttons_builder.dart';
import 'package:tasks_app/features/home/presentation/widgets/question_ticket.dart';

import 'button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<TaskCubit>(context);
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: BlocBuilder<TaskCubit, TaskStates>(
            builder: (context, state) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: media.height * .09,
              children: [
                Text(
                  'Simple Quiz App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
                QuestionTicket(
                  question: cubit.tasks[cubit.currentIndex].question,
                ),
                ButtonsBuilder(
                  answersList: cubit.tasks[cubit.currentIndex].answers,
                  itemCount: cubit.tasks[cubit.currentIndex].answers.length,
                ),
                Button(
                  text: cubit.currentIndex == cubit.tasks.length - 1
                      ? 'Get Result'
                      : 'Next',
                  media: media,
                  onPressed: () {
                    cubit.next(context: context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
