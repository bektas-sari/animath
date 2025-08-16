import 'dart:math';

class Question {
  final String questionText;
  final String correctAnswer;
  final List<String> options; // already shuffled

  Question({
    required this.questionText,
    required this.correctAnswer,
    required this.options,
  });
}

final _rnd = Random();

List<Question> generateQuestions(int count) {
  final List<Question> out = [];
  while (out.length < count) {
    final opType = _rnd.nextInt(4); // 0:+ 1:- 2:* 3:/
    int a, b, correct;
    String symbol;

    switch (opType) {
      case 0: // addition
        a = _rnd.nextInt(9) + 1; // 1..9
        b = _rnd.nextInt(9) + 1; // 1..9
        correct = a + b;
        symbol = '+';
        break;
      case 1: // subtraction (non-negative result)
        b = _rnd.nextInt(9) + 1;                   // 1..9
        a = b + (_rnd.nextInt(9) + 1);             // ensures a > b
        correct = a - b;
        symbol = '-';
        break;
      case 2: // multiplication
        a = _rnd.nextInt(9) + 1; // 1..9
        b = _rnd.nextInt(9) + 1; // 1..9
        correct = a * b;
        symbol = '×';
        break;
      default: // division (integer quotient)
        b = _rnd.nextInt(9) + 1; // divisor 1..9
        final q = _rnd.nextInt(9) + 1; // quotient 1..9
        a = b * q; // dividend
        correct = q;
        symbol = '÷';
        break;
    }

    final questionText = '$a $symbol $b = ?';

    // Build options: correct + 2 unique distractors near the correct
    final Set<int> opts = {correct};
    while (opts.length < 3) {
      final sign = _rnd.nextBool() ? 1 : -1;
      final delta = (_rnd.nextInt(3) + 1) * sign; // ±1..±3
      int cand = correct + delta;
      if (cand < 0) cand = correct + (_rnd.nextInt(3) + 1);
      opts.add(cand);
    }

    final options = opts.map((e) => e.toString()).toList()..shuffle(_rnd);

    out.add(Question(
      questionText: questionText,
      correctAnswer: correct.toString(),
      options: options,
    ));
  }
  return out;
}
