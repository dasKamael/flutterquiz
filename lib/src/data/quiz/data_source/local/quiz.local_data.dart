import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'quiz.local_data.g.dart';

class QuizLocalData {
  static const String _keyQuizCompleted = 'quiz_completed';

  Future<bool> isQuizAlreadyCompleted({required String quizId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? quizList = prefs.getStringList(_keyQuizCompleted);
    if (quizList != null) {
      return quizList.contains(quizId);
    }
    return false;
  }

  Future<void> setQuizCompleted({required String quizId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? quizList = prefs.getStringList(_keyQuizCompleted);
    prefs.setStringList(_keyQuizCompleted, [...quizList ?? [], quizId]);
  }
}

@riverpod
QuizLocalData quizLocalData(QuizLocalDataRef ref) {
  return QuizLocalData();
}
