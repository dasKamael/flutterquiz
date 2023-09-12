import 'package:flutterquiz/src/domain/quiz/models/quiz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_quiz.state.freezed.dart';

@freezed
class EditQuizState with _$EditQuizState {
  const factory EditQuizState({
    @Default('') String title,
    @Default([]) List<Question> questions,
  }) = _EditQuizState;
}
