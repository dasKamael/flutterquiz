class QuestionType {
  const QuestionType._(this.value);

  final String value;

  static const singleAnwer = QuestionType._('singleAnswer');
  static const multipleAnswer = QuestionType._('multipleAnswer');
  static const fillInblank = QuestionType._('fillInblank');

  static QuestionType fromString(String value) {
    switch (value) {
      case 'single':
        return QuestionType.singleAnwer;
      case 'multiple':
        return QuestionType.multipleAnswer;
      case 'fillInblank':
        return QuestionType.fillInblank;
      default:
        throw Exception('Unknown question type');
    }
  }
}
