class TestAnswarModel {
  String? answerId;
  String? questionId;
  String? answerText;
  String? personalityId;
  String? createdAt;

  TestAnswarModel(
      {this.answerId,
        this.questionId,
        this.answerText,
        this.personalityId,
        this.createdAt});

  TestAnswarModel.fromJson(Map<String, dynamic> json) {
    answerId = json['answer_id'];
    questionId = json['question_id'];
    answerText = json['answer_text'];
    personalityId = json['personality_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer_id'] = this.answerId;
    data['question_id'] = this.questionId;
    data['answer_text'] = this.answerText;
    data['personality_id'] = this.personalityId;
    data['created_at'] = this.createdAt;
    return data;
  }
}