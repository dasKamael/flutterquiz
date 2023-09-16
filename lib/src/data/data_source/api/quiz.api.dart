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
      List list = await supabaseClient.from('quizzes').select();
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

  Future<Map<String, dynamic>> createQuiz({required Quiz quiz}) async {
    final userId = supabaseClient.auth.currentUser?.id;
    // TODO createQuiz
    return await supabaseClient.from('quizzes').insert(quiz).select().single();
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

  Future<Map<String, dynamic>> createUpdateQuestionWithAnswers({required Question question}) async {
    final userId = supabaseClient.auth.currentUser?.id;
    supabaseClient.rpc('create_update_question_with_answers', params: {
      'question_id': question.id,
      'question_title': question.question,
      'quiz_id': question.quizId,
      'answers': question.answers,
      'user_id': userId,
    });
    return {};
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
}

/// Providers
@riverpod
QuizApi quizApi(QuizApiRef ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return QuizApi(supabaseClient: supabaseClient);
}
