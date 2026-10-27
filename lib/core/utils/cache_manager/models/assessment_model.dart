class AssessmentModel {
  final List<AssessmentAnswerModel> answers;

  const AssessmentModel({required this.answers});

  factory AssessmentModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Assessment request cannot be null');
    }

    final answersJson = json['answers'];

    if (answersJson == null) {
      throw const FormatException('The "answers" field is required');
    }

    if (answersJson is! List) {
      throw const FormatException('The "answers" field must be a list');
    }

    return AssessmentModel(
      answers: answersJson
          .whereType<Map<String, dynamic>>()
          .map(AssessmentAnswerModel.fromJson)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'answers': answers.map((answer) => answer.toJson()).toList()};
  }

  /// Validates the complete request.
  ///
  /// Returns a list of validation errors.
  /// An empty list means the DTO is valid.
  List<String> validate() {
    final errors = <String>[];

    if (answers.isEmpty) {
      errors.add('At least one answer is required');
    }

    final questionIds = <int>{};

    for (var i = 0; i < answers.length; i++) {
      final answerErrors = answers[i].validate();

      for (final error in answerErrors) {
        errors.add('answers[$i]: $error');
      }

      if (!questionIds.add(answers[i].questionId)) {
        errors.add(
          'answers[$i]: Duplicate question_id ${answers[i].questionId}',
        );
      }
    }

    return errors;
  }

  /// Throws a [FormatException] when the request is invalid.
  void validateOrThrow() {
    final errors = validate();

    if (errors.isNotEmpty) {
      throw FormatException(errors.join('\n'));
    }
  }

  bool get isValid => validate().isEmpty;
}

class AssessmentAnswerModel {
  final int questionId;
  final String answer;

  const AssessmentAnswerModel({required this.questionId, required this.answer});

  factory AssessmentAnswerModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw const FormatException('Answer cannot be null');
    }

    final questionIdValue = json['question_id'];
    final answerValue = json['answer'];

    if (questionIdValue == null) {
      throw const FormatException('The "question_id" field is required');
    }

    if (answerValue == null) {
      throw const FormatException('The "answer" field is required');
    }

    final questionId = _parseQuestionId(questionIdValue);
    final answer = _parseAnswer(answerValue);

    return AssessmentAnswerModel(questionId: questionId, answer: answer);
  }

  Map<String, dynamic> toJson() {
    return {'question_id': questionId, 'answer': answer};
  }

  List<String> validate() {
    final errors = <String>[];

    if (questionId <= 0) {
      errors.add('question_id must be greater than zero');
    }

    if (answer.trim().isEmpty) {
      errors.add('answer cannot be empty');
    }

    return errors;
  }

  bool get isValid => validate().isEmpty;

  static int _parseQuestionId(dynamic value) {
    if (value is int) {
      return value;
    }

    if (value is String) {
      final parsedValue = int.tryParse(value);

      if (parsedValue != null) {
        return parsedValue;
      }
    }

    throw const FormatException('"question_id" must be an integer');
  }

  static String _parseAnswer(dynamic value) {
    if (value is String) {
      return value;
    }

    throw const FormatException('"answer" must be a string');
  }
}
