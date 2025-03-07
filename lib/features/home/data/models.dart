// class Task {
//   final String question;
//   final List<Answer> answers;
//
//   const Task({required this.question, required this.answers});
//
//   factory Task.fromJson(Map<String, dynamic> json) {
//     return Task(
//       question: json['question'],
//       answers: (json['answers'] as List)
//           .map((answer) => Answer.fromJson(answer))
//           .toList(),
//     );
//   }
// }
//
// class Answer {
//   final String answer;
//   final bool isCorrect;
//
//   const Answer({required this.answer, required this.isCorrect});
//
//   factory Answer.fromJson(Map<String, dynamic> json) {
//     return Answer(
//       answer: json['answer'],
//       isCorrect: json['isCorrect'],
//     );
//   }
// }

// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  String question;
  List<Answer> answers;

  Task({
    required this.question,
    required this.answers,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    question: json["question"],
    answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
  };
}

class Answer {
  String answer;
  bool isCorrect;

  Answer({
    required this.answer,
    required this.isCorrect,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    answer: json["answer"],
    isCorrect: json["isCorrect"],
  );

  Map<String, dynamic> toJson() => {
    "answer": answer,
    "isCorrect": isCorrect,
  };
}

List<String> categories = [
  "Science",
  "History",
  "Sports",
  "Geography",
  "Entertainment",
  "Technology",
  "Literature",
  "Art",
  "Mathematics",
  "Music"
];


List<Task> getTasks() {
  return [
    Task(
      question: 'Which ocean is the largest?',
      answers: [
        Answer(answer: 'Atlantic Ocean', isCorrect: false),
        Answer(answer: 'Indian Ocean', isCorrect: false),
        Answer(answer: 'Arctic Ocean', isCorrect: false),
        Answer(answer: 'Pacific Ocean', isCorrect: true),
      ],
    ),
    Task(
      question: 'What is the largest mammal in the world?',
      answers: [
        Answer(answer: 'Elephant', isCorrect: false),
        Answer(answer: 'Blue whale', isCorrect: true),
        Answer(answer: 'Giraffe', isCorrect: false),
        Answer(answer: 'Great white shark', isCorrect: false),
      ],
    ),
    Task(
      question: 'Which of these is a primary color?',
      answers: [
        Answer(answer: 'Green', isCorrect: false),
        Answer(answer: 'Yellow', isCorrect: true),
        Answer(answer: 'Pink', isCorrect: false),
        Answer(answer: 'Purple', isCorrect: false),
      ],
    ),
    Task(
      question: 'How many legs does a spider have?',
      answers: [
        Answer(answer: '6', isCorrect: false),
        Answer(answer: '10', isCorrect: false),
        Answer(answer: '8', isCorrect: true),
        Answer(answer: '12', isCorrect: false),
      ],
    ),
    Task(
      question: 'What is the chemical symbol for gold?',
      answers: [
        Answer(answer: 'Au', isCorrect: true),
        Answer(answer: 'Ag', isCorrect: false),
        Answer(answer: 'Fe', isCorrect: false),
        Answer(answer: 'Pb', isCorrect: false),
      ],
    ),
  ];
}
