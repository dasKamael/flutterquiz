class QuestionType {
  const QuestionType._(this.value);

  final String value;

  static const singleAnwer = QuestionType._('singleAnswer');
  static const multipleAnswer = QuestionType._('multipleAnswer');

  static QuestionType fromString(String value) {
    switch (value) {
      case 'single':
        return QuestionType.singleAnwer;
      case 'multiple':
        return QuestionType.multipleAnswer;
      default:
        throw Exception('Unknown question type');
    }
  }
}
