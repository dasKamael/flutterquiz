import 'package:flutterquiz/src/domain/enums/question_type.enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_question_types.service.g.dart';

@riverpod
class GetQuestionTypesService extends _$GetQuestionTypesService {
  @override
  FutureOr<List<QuestionType>> build() {
    return [QuestionType.single, QuestionType.multiple];
  }
}
