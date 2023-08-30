import 'package:flutterquiz/src/common/mapper/dto_mapper.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';

class QuizMapper extends Mapper<Quiz, Map> {
  @override
  Quiz toModel(Map dto) {
    return Quiz(
      id: dto['id'],
      title: dto['title'],
      createdBy: dto['created_by'] ?? '',
      createdAt: DateTime.parse(dto['created_at']),
      updatedAt: dto['updated_at'] != null ? DateTime.parse(dto['updated_at']) : null,
      isPrivate: dto['is_private'],
    );
  }
}

class QuestionMapper extends Mapper<Question, Map> {
  @override
  Question toModel(Map dto) {
    return Question(
      id: dto['id'],
      quizId: dto['quiz_id'],
      question: dto['question'],
      type: dto['type'] ?? '',
      explanation: dto['explanation'],
      explanationLink: dto['explanation_link'],
      createdAt: DateTime.parse(dto['created_at']),
      updatedAt: dto['updated_at'] != null ? DateTime.parse(dto['updated_at']) : null,
      answers: dto['answers'],
    );
  }
}

class AnswerMapper extends Mapper<Answer, Map> {
  @override
  Answer toModel(Map dto) {
    return Answer(
      id: dto['id'],
      answer: dto['answer'],
      isCorrect: dto['is_correct'],
      questionId: dto['question_id'],
      createdAt: DateTime.parse(dto['created_at']),
      updatedAt: dto['updated_at'] != null ? DateTime.parse(dto['updated_at']) : null,
    );
  }
}
