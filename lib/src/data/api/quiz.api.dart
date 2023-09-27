import 'package:flutterquiz/src/common/supabase/supabase.provider.dart';
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
  Future<List> getQuizzes() async {
    try {
      List list = await supabaseClient.from('quizzes').select().eq('is_private', false);
      return list;
    } catch (e) {
      _logger.info('GetQuizzes error: $e');
      return [];
    }
  }

  Future<List> getQuizzesByUserId({required String userId}) async {
    try {
      List list = await supabaseClient.from('quizzes').select().eq('created_by', userId);
      return list;
    } catch (e) {
      _logger.info('GetQuizzes error: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>> getQuizById({required String quizId}) async {
    try {
      return await supabaseClient.from('quizzes').select().eq('id', quizId).single();
    } catch (e) {
      _logger.info('GetQuizById error: $e');
    }
    return {};
  }

  Future<Map<String, dynamic>> createOrUpdateQuiz({required Quiz quiz}) async {
    final userId = supabaseClient.auth.currentUser?.id;
    try {
      final bool quizExists = await supabaseClient.rpc(
        'check_quiz_exists',
        params: {'quiz_id': double.tryParse(quiz.id!) != null ? null : quiz.id},
      );
      if (quizExists) {
        return await supabaseClient
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
      }

      return await supabaseClient
          .from('quizzes')
          .insert({
            'title': quiz.title,
            'description': quiz.description,
            'created_by': userId,
            'is_private': quiz.isPrivate,
          })
          .select()
          .single();
    } catch (e, s) {
      _logger.info('CreateOrUpdateQuiz error: $e $s');
      return {};
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
  Future<List> getQuestionsByQuizId({required String quizId}) async {
    try {
      List list = await supabaseClient.from('questions').select().eq('quiz_id', quizId);
      return list;
    } catch (e) {
      _logger.info('GetQuestionsByQuizId error: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>> getQuestionById({required String questionId}) async {
    try {
      return await supabaseClient.from('questions').select().eq('id', questionId).single();
    } catch (e) {
      _logger.info('GetQuestionById error: $e');
      return {};
    }
  }

  // Future<Map<String, dynamic>> createUpdateQuestionWithAnswers({required Question question}) async {
  //   final List<Map<String, dynamic>> answers = question.answers!
  //       .map(
  //         (e) => {
  //           'id': e.id,
  //           'answer': e.answer,
  //           'is_correct': e.isCorrect,
  //         },
  //       )
  //       .toList();

  //   try {
  //     await supabaseClient.rpc(
  //       'create_update_question_with_answers',
  //       params: {
  //         'quiz_id': question.quizId,
  //         'question_id': question.id,
  //         'question_type': question.type,
  //         'question_title': question.question,
  //         'answers': answers,
  //       },
  //     );
  //   } catch (e) {
  //     _logger.info('CreateUpdateQuestionWithAnswers error: $e');
  //   }
  //   return {};
  // }

  Future<Map<String, dynamic>> createOrUpdateQuestion({required Question question}) async {
    try {
      final bool questionExists = await supabaseClient.rpc(
        'check_question_exists',
        params: {'question_id': double.tryParse(question.id) != null ? null : question.id},
      );

      if (questionExists) {
        return await supabaseClient
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
      }

      return await supabaseClient
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
    } catch (e, s) {
      _logger.info('CreateOrUpdateQuestion error: $e $s');
      return {};
    }
  }

  // Answers #################################################################
  Future<List> getAnswersByQuestionId({required String questionId}) async {
    try {
      List list = await supabaseClient.from('answers').select().eq('question_id', questionId);
      return list;
    } catch (e) {
      _logger.info('GetAnswersByQuestionId error: $e');
      return [];
    }
  }

  Future<void> createOrUpdateAnswer({required Answer answer}) async {
    try {
      final bool answerExists = await supabaseClient.rpc(
        'check_answer_exists',
        params: {'answer_id': double.tryParse(answer.id) != null ? null : answer.id},
      );

      if (answerExists) {
        await supabaseClient
            .from('answers')
            .update({
              'question_id': answer.questionId,
              'answer': answer.answer,
              'is_correct': answer.isCorrect,
            })
            .eq('id', answer.id)
            .select()
            .single();
      }

      await supabaseClient
          .from('answers')
          .insert({
            'question_id': answer.questionId,
            'answer': answer.answer,
            'is_correct': answer.isCorrect,
          })
          .select()
          .single();
    } catch (e) {
      _logger.info('CreateOrUpdateAnswer error: $e');
    }
  }
}

/// Providers
@riverpod
QuizApi quizApi(QuizApiRef ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return QuizApi(supabaseClient: supabaseClient);
}
