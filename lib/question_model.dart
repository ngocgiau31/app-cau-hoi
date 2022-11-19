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
    "Mỗi học kỳ chính được đăng ký tối đa bao nhiêu tín chỉ",
    [
      Answer("18", false),
      Answer("20", false),
      Answer("8", false),
      Answer("25", true),
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
    "Học phần phát triển ứng dụng di động có mã học phần là",
    [
      Answer("CT112", false),
      Answer("CT300", false),
      Answer("CT484", true),
      Answer("CT449", false),
    ],
  ));

  list.add(Question(
    "Flutter sử dụng dart làm ngôn ngữ?",
    [
      Answer("True", true),
      Answer("False", false),
    ],
  ));

  return list;
}
