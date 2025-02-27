import 'dart:convert';
import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:tasks_app/core/api_keys.dart';

import '../features/home/data/models.dart';

class GeminiService {
  static Future<List<Task>> get() async {
    GenerateContentResponse response = await apiCall();

    String cleanJson =
        response.text!.replaceAll("```json", "").replaceAll("```", "").trim();
    // log("f = -> $cleanJson");

    return List<Task>.from(json.decode(cleanJson).map((x) => Task.fromJson(x)));
  }
}

Future<GenerateContentResponse> apiCall() async {
  final model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey: KApiKey,
  );

  final prompt = '''
      Generate 5 general Hard knowledge questions in JSON format, each with exactly 4 possible answers and one correct answer. Use this structure:
      [
    {
      "question": "What is the capital of France?",
      "answers": [
        {"answer": "Berlin", "isCorrect": false},
        {"answer": "Madrid", "isCorrect": false},
        {"answer": "Paris", "isCorrect": true},
        {"answer": "Rome", "isCorrect": false}
      ]
    }
      ]
      ''';
  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);
  return response;
}
