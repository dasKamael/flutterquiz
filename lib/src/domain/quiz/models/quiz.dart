import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    String? id,
    required String title,
    required String description,
    required String createdBy,
    required DateTime createdAt,
    required bool isPrivate,
    required double rating,
    required int userRatedCount,
    DateTime? updatedAt,
    List<Question>? questions,
  }) = _Quiz;
}

@freezed
class Question with _$Question {
  const factory Question({
    required String id,
    required String quizId,
    required String question,
    required String explanation,
    required String explanationLink,
    required DateTime createdAt,
    DateTime? updatedAt,
    required String type,
    List<Answer>? answers,
  }) = _Question;
}

@freezed
class Answer with _$Answer {
  const factory Answer({
    required String id,
    required String answer,
    required bool isCorrect,
    required String questionId,
    required DateTime createdAt,
    required String widgetType,
    DateTime? updatedAt,
  }) = _Answer;
}
