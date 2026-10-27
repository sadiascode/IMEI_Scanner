class QuestionModel {
  final int id;
  final String questionKey;
  final String question;
  final String type;
  final List<QuestionOptionModel>? options;
  final int scoreWeight;
  final int sortOrder;
  final bool isActive;

  QuestionModel({
    required this.id,
    required this.questionKey,
    required this.question,
    required this.type,
    required this.options,
    required this.scoreWeight,
    required this.sortOrder,
    required this.isActive,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'] as int,
      questionKey: json['question_key'] as String,
      question: json['question'] as String,
      type: json['type'] as String,
      options: json['options'] == null
          ? null
          : (json['options'] as List<dynamic>)
                .map(
                  (item) => QuestionOptionModel.fromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList(),
      scoreWeight: json['score_weight'] as int,
      sortOrder: json['sort_order'] as int,
      isActive: json['is_active'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_key': questionKey,
      'question': question,
      'type': type,
      'options': options?.map((option) => option.toJson()).toList(),
      'score_weight': scoreWeight,
      'sort_order': sortOrder,
      'is_active': isActive,
    };
  }
}

class QuestionOptionModel {
  final String label;
  final int score;
  final String value;

  QuestionOptionModel({
    required this.label,
    required this.score,
    required this.value,
  });

  factory QuestionOptionModel.fromJson(Map<String, dynamic> json) {
    return QuestionOptionModel(
      label: json['label'] as String,
      score: json['score'] as int,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'score': score, 'value': value};
  }
}
