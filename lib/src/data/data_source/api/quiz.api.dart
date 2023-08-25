import 'dart:developer';

import 'package:flutterquiz/src/common/supabase/supabase.provider.dart';
import 'package:flutterquiz/src/domain/models/quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

part 'quiz.api.g.dart';

class QuizApi {
  QuizApi({required this.supabaseClient});

  final SupabaseClient supabaseClient;

  // Quizzes #################################################################
  Future<List> getQuizzes() async {
    try {
      List list = await supabaseClient.from('quizzes').select();
      return list;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<Map<String, dynamic>> getQuizById({required String quizId}) async {
    try {
      return await supabaseClient.from('quizzes').select().eq('id', quizId).single();
    } catch (e) {
      log(e.toString());
    }
    return {};
  }

  Future<void> createQuiz({required Quiz quiz}) async {
    final userId = supabaseClient.auth.currentUser?.id;
    // TODO createQuiz
    await supabaseClient.from('quizzes').insert(quiz);
  }

  // Questions ###############################################################
  Future<List> getQuestionsByQuizId({required String quizId}) async {
    try {
      List list = await supabaseClient.from('questions').select().eq('quiz_id', quizId);
      return list;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<Map<String, dynamic>> getQuestionById({required String questionId}) async {
    try {
      return await supabaseClient.from('questions').select().eq('id', questionId).single();
    } catch (e) {
      log(e.toString());
      return {};
    }
  }

  // Answers #################################################################
  Future<List> getAnswersByQuestionId({required String questionId}) async {
    try {
      List list = await supabaseClient.from('answers').select().eq('question_id', questionId);
      return list;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}

/// Providers
@Riverpod(keepAlive: true)
QuizApi quizApi(QuizApiRef ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return QuizApi(supabaseClient: supabaseClient);
}
