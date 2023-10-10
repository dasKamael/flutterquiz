import 'package:flutterquiz/src/common/mapper/dto_mapper.dart';
import 'package:flutterquiz/src/data/quiz/data_source/api/dto/answer_response.dto.dart';
import 'package:flutterquiz/src/data/quiz/data_source/api/dto/question_response.dto.dart';
import 'package:flutterquiz/src/data/quiz/data_source/api/dto/quiz_response.dto.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';

class QuizMapper extends Mapper<Quiz, QuizResponseDto> {
  @override
  Quiz toModel(QuizResponseDto dto) {
    return Quiz(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      createdBy: dto.createdBy,
      rating: dto.rating,
      userRatedCount: dto.userRatedCount,
      isPrivate: dto.isPrivate,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: dto.updatedAt != null ? DateTime.parse(dto.updatedAt!) : null,
    );
  }
}

class QuestionMapper extends Mapper<Question, QuestionResponseDto> {
  @override
  Question toModel(QuestionResponseDto dto) {
    return Question(
      id: dto.id,
      question: dto.question,
      explanation: dto.explanation,
      explanationLink: dto.explanationLink,
      quizId: dto.quizId,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: dto.updatedAt != null ? DateTime.parse(dto.updatedAt!) : null,
      type: dto.type,
      widgetType: dto.widgetType,
    );
  }
}

class AnswerMapper extends Mapper<Answer, AnswerResponseDto> {
  @override
  Answer toModel(AnswerResponseDto dto) {
    return Answer(
      id: dto.id,
      answer: dto.answer,
      isCorrect: dto.isCorrect,
      questionId: dto.questionId,
      createdAt: DateTime.parse(dto.createdAt),
      updatedAt: dto.updatedAt != null ? DateTime.parse(dto.updatedAt!) : null,
      widgetType: dto.widgetType,
    );
  }
}
