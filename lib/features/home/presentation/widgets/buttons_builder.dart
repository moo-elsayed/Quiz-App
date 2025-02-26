import 'package:flutter/material.dart';
import 'package:tasks_app/features/home/presentation/widgets/answer_button.dart';

import '../../data/models.dart';

class ButtonsBuilder extends StatelessWidget {
  const ButtonsBuilder(
      {super.key, required this.answersList, required this.itemCount});

  final List<Answer> answersList;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child: Container(
    //     color: Colors.green,
    //     child: ListView.builder(
    //       physics: NeverScrollableScrollPhysics(),
    //       itemCount: itemCount,
    //       itemBuilder: (context, index) {
    //         return Padding(
    //           padding: EdgeInsets.only(bottom: index == 3 ? 0 : 12),
    //           child: ElevatedButton(
    //             style: ElevatedButton.styleFrom(
    //               foregroundColor: Colors.black,
    //               padding: EdgeInsets.all(16),
    //             ),
    //             onPressed: () {},
    //             child: Text(
    //               answersList[index].answer,
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );

    // return BlocBuilder<TaskCubit, TaskStates>(
    //   builder: (context, state) => Column(
    //     children: List.generate(
    //       itemCount,
    //       (index) {
    //         return Padding(
    //           padding: EdgeInsets.only(bottom: index == 3 ? 0 : 12),
    //           child: ElevatedButton(
    //             style: ElevatedButton.styleFrom(
    //               minimumSize: Size(double.infinity, 0),
    //               foregroundColor: Colors.black,
    //               padding: EdgeInsets.all(16),
    //               backgroundColor:
    //                   BlocProvider.of<TaskCubit>(context).selectedAnswer ==
    //                           answersList[index]
    //                       ? Colors.white60
    //                       : Colors.white,
    //             ),
    //             onPressed: () {
    //               BlocProvider.of<TaskCubit>(context).selectAnswer(
    //                 answer: answersList[index],
    //               );
    //             },
    //             child: Text(
    //               answersList[index].answer,
    //               style: TextStyle(fontSize: 16),
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );

    return Column(
      children: List.generate(
        itemCount,
        (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: index == 3 ? 0 : 12),
            child: AnswerButton(answer: answersList[index]),
          );
        },
      ),
    );
  }
}
