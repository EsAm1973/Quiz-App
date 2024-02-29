

class QuizQuestion{
  final String Text;
  final List<String> Answers;

  QuizQuestion(this.Text, this.Answers);

  List <String> getShuffeledAnswers(){
     final ShuffeledList = List.of(Answers);
     ShuffeledList.shuffle();
     return ShuffeledList;
  }
}