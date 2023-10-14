import 'dart:developer';

import 'package:flutterquiz/src/common/supabase/supabase.provider.dart';
import 'package:flutterquiz/src/data/quiz/data_source/api/dto/answer_response.dto.dart';
import 'package:flutterquiz/src/data/quiz/data_source/api/dto/question_response.dto.dart';
import 'package:flutterquiz/src/data/quiz/data_source/api/dto/quiz_response.dto.dart';
import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

part 'quiz.api.g.dart';

class QuizApi {
  QuizApi({required this.supabaseClient});

  final SupabaseClient supabaseClient;

  final Logger _logger = Logger('QuizApi');

  // Quizzes #################################################################
  Future<List<QuizResponseDto>> getQuizzes() async {
    try {
      final response = await supabaseClient.from('quizzes').select().eq('is_private', false);

      List<QuizResponseDto> list = [];

      for (var item in response) {
        log(item.toString());
        list.add(QuizResponseDto.fromJson(item));
      }

      return list;
    } catch (e) {
      _logger.info('GetQuizzes error: $e');
      return [];
    }
  }

  Future<List<QuizResponseDto>> getQuizzesByUserId({required String userId}) async {
    try {
      final response = await supabaseClient.from('quizzes').select().eq('created_by', userId);

      List<QuizResponseDto> list = [];

      for (var item in response) {
        list.add(QuizResponseDto.fromJson(item));
      }

      return list;
    } catch (e) {
      _logger.info('GetQuizzes error: $e');
      return [];
    }
  }

  Future<QuizResponseDto?> getQuizById({required String quizId}) async {
    try {
      final response = await supabaseClient.from('quizzes').select().eq('id', quizId).single();
      return QuizResponseDto.fromJson(response);
    } catch (e) {
      _logger.info('GetQuizById error: $e');
    }
    return null;
  }

  Future<QuizResponseDto?> createOrUpdateQuiz({required Quiz quiz}) async {
    final userId = supabaseClient.auth.currentUser?.id;
    try {
      final bool quizExists = await supabaseClient.rpc(
        'check_quiz_exists',
        params: {'quiz_id': double.tryParse(quiz.id!) != null ? null : quiz.id},
      );
      final dynamic response;
      if (quizExists) {
        response = await supabaseClient
            .from('quizzes')
            .update({
              'id': quiz.id!,
              'title': quiz.title,
              'description': quiz.description,
              'created_by': userId,
              'is_private': quiz.isPrivate,
            })
            .eq('id', quiz.id)
            .select()
            .single();
      } else {
        response = await supabaseClient
            .from('quizzes')
            .insert({
              'title': quiz.title,
              'description': quiz.description,
              'created_by': userId,
              'is_private': quiz.isPrivate,
            })
            .select()
            .single();
      }
      return QuizResponseDto.fromJson(response);
    } catch (e, s) {
      _logger.info('CreateOrUpdateQuiz error: $e $s');
      return null;
    }
  }

  Future<void> increamentQuizPassedCount({required String quizId}) async {
    try {
      await supabaseClient.rpc('increase_completed_count', params: {'quiz_id': quizId});
    } catch (e) {
      _logger.info('IncreamentQuizPassedCount error: $e');
    }
  }

  // Questions ###############################################################
  Future<List<QuestionResponseDto>> getQuestionsByQuizId({required String quizId}) async {
    try {
      final response = await supabaseClient.from('questions').select().eq('quiz_id', quizId);

      List<QuestionResponseDto> list = [];

      for (var item in response) {
        list.add(QuestionResponseDto.fromJson(item));
      }

      return list;
    } catch (e) {
      _logger.info('GetQuestionsByQuizId error: $e');
      return [];
    }
  }

  Future<QuestionResponseDto?> getQuestionById({required String questionId}) async {
    try {
      final response = await supabaseClient.from('questions').select().eq('id', questionId).single();
      return QuestionResponseDto.fromJson(response);
    } catch (e) {
      _logger.info('GetQuestionById error: $e');
      return null;
    }
  }

  Future<QuestionResponseDto?> createOrUpdateQuestion({required Question question}) async {
    try {
      final bool questionExists = await supabaseClient.rpc(
        'check_question_exists',
        params: {'question_id': double.tryParse(question.id) != null ? null : question.id},
      );

      final dynamic response;

      if (questionExists) {
        response = await supabaseClient
            .from('questions')
            .update({
              'quiz_id': question.quizId,
              'question': question.question,
              'type': question.type,
              'explanation': question.explanation,
              'explanation_link': question.explanationLink,
            })
            .eq('id', question.id)
            .select()
            .single();
      } else {
        response = await supabaseClient
            .from('questions')
            .insert({
              'quiz_id': question.quizId,
              'question': question.question,
              'type': question.type,
              'explanation': question.explanation,
              'explanation_link': question.explanationLink,
            })
            .select()
            .single();
      }

      return QuestionResponseDto.fromJson(response);
    } catch (e, s) {
      _logger.info('CreateOrUpdateQuestion error: $e $s');
      return null;
    }
  }

  Future<void> deleteQuestionWithId({required String questionId}) async {
    try {
      await supabaseClient.rpc('delete_question', params: {'questionid': questionId});
    } catch (e) {
      _logger.info('DeleteQuestionWithId error: $e');
    }
  }

  // Answers #################################################################
  Future<List<AnswerResponseDto>> getAnswersByQuestionId({required String questionId}) async {
    try {
      final response = await supabaseClient.from('answers').select().eq('question_id', questionId);

      List<AnswerResponseDto> list = [];

      for (var item in response) {
        list.add(AnswerResponseDto.fromJson(item));
      }
      return list;
    } catch (e) {
      _logger.info('GetAnswersByQuestionId error: $e');
      return [];
    }
  }

  Future<AnswerResponseDto?> createOrUpdateAnswer({required Answer answer}) async {
    try {
      final bool answerExists = await supabaseClient.rpc(
        'check_answer_exists',
        params: {'answer_id': double.tryParse(answer.id) != null || answer.id == '' ? null : answer.id},
      );

      final dynamic response;

      if (answerExists) {
        response = await supabaseClient
            .from('answers')
            .update({
              'question_id': answer.questionId,
              'answer': answer.answer,
              'is_correct': answer.isCorrect,
              'widget_type': answer.widgetType,
            })
            .eq('id', answer.id)
            .select()
            .single();
      } else {
        response = await supabaseClient
            .from('answers')
            .insert({
              'question_id': answer.questionId,
              'answer': answer.answer,
              'is_correct': answer.isCorrect,
              'widget_type': answer.widgetType,
            })
            .select()
            .single();
      }
      return AnswerResponseDto.fromJson(response);
    } catch (e) {
      _logger.info('CreateOrUpdateAnswer error: $e');
      return null;
    }
  }

  Future<void> deleteAnswerWithId({required String answerId}) async {
    try {
      await supabaseClient.from('answers').delete().eq('id', answerId);
    } catch (e) {
      _logger.info('DeleteAnswer error: $e');
    }
  }

  Future<void> deleteQuizWithId({String? quizId}) async {
    try {
      await supabaseClient.rpc('delete_quiz', params: {'quizid': quizId});
    } catch (e) {
      _logger.info('DeleteQuiz error: $e');
    }
  }
}

/// Providers
@riverpod
QuizApi quizApi(QuizApiRef ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return QuizApi(supabaseClient: supabaseClient);
}
