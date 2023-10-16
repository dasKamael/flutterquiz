import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'rating.local_data.g.dart';

class RatingLocalData {
  static const String _key = 'rated_quiz';

  Future<bool> isQuizAlreadyRated({required String quizId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? quizList = prefs.getStringList(_key);
    if (quizList != null) {
      return quizList.contains(quizId);
    }
    return false;
  }

  Future<void> setQuizRated({required String quizId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? quizList = prefs.getStringList(_key);
    await prefs.setStringList(_key, [...quizList ?? [], quizId]);
  }
}

@riverpod
RatingLocalData ratingLocalData(RatingLocalDataRef ref) {
  return RatingLocalData();
}
