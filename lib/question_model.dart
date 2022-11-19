class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Ai là chủ sở hữu của Flutter?",
    [
      Answer("Nokia", false),
      Answer("Samsung", false),
      Answer("Google", true),
      Answer("Apple", false),
    ],
  ));

  list.add(Question(
    "Tổ chức sở hữu Iphone?",
    [
      Answer("Apple", true),
      Answer("Microsoft", false),
      Answer("Google", false),
      Answer("Nokia", false),
    ],
  ));

  list.add(Question(
    " Nền tảng Youtube là _________  ?",
    [
      Answer("Chia sẻ âm nhạc", false),
      Answer("Chia sẻ video", false),
      Answer("Phát trực tiếp", false),
      Answer("Tất cả ý trên", true),
    ],
  ));

  list.add(Question(
    "Flutter sử dụng dart làm ngôn ngũ?",
    [
      Answer("True", true),
      Answer("False", false),
    ],
  ));

  return list;
}
