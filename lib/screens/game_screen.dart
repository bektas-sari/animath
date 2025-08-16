import 'package:flutter/material.dart';
import '../models/question.dart';
import '../widgets/draggable_answer.dart';
import 'result_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final List<Question> questions;
  int currentIndex = 0;
  int score = 0;

  String droppedAnswer = '';
  bool answered = false;
  bool isCorrect = false;

  Color targetColor = Colors.grey.shade200;

  @override
  void initState() {
    super.initState();
    questions = generateQuestions(10); // <<< 10 questions
  }

  void _onAcceptAnswer(String data) {
    if (answered) return;

    setState(() {
      droppedAnswer = data;
      answered = true;
      isCorrect = data == questions[currentIndex].correctAnswer;
      targetColor = isCorrect ? Colors.green : Colors.red;
      if (isCorrect) score++;
    });
  }

  void _next() {
    if (currentIndex + 1 >= questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(score: score, total: questions.length),
        ),
      );
      return;
    }
    setState(() {
      currentIndex++;
      droppedAnswer = '';
      answered = false;
      isCorrect = false;
      targetColor = Colors.grey.shade200;
    });
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animath'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text('Score: $score',
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Top progress
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: (currentIndex + 1) / questions.length,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text('${currentIndex + 1}/${questions.length}'),
                  ],
                ),
                const SizedBox(height: 20),

                // Question
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.indigo.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    q.questionText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),

                const SizedBox(height: 20),

                // Options (already shuffled per question)
                Wrap(
                  alignment: WrapAlignment.center,
                  children: q.options
                      .map((opt) => DraggableAnswer(answer: opt, enabled: !answered))
                      .toList(),
                ),

                const SizedBox(height: 22),

                // Drop area
                DragTarget<String>(
                  onAccept: _onAcceptAnswer,
                  builder: (context, candidate, rejected) {
                    final highlight = candidate.isNotEmpty
                        ? Colors.indigo.withOpacity(0.15)
                        : targetColor;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 240),
                      width: 160,
                      height: 100,
                      decoration: BoxDecoration(
                        color: highlight,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        droppedAnswer.isEmpty ? 'Drop Here' : droppedAnswer,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 10),

                // Feedback
                AnimatedOpacity(
                  opacity: answered ? 1 : 0,
                  duration: const Duration(milliseconds: 180),
                  child: Text(
                    answered ? (isCorrect ? 'Correct!' : 'Wrong!') : '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Next / Finish (kept higher on screen)
                SizedBox(
                  width: 220,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: answered ? _next : null,
                    child: Text(
                      currentIndex + 1 >= questions.length ? 'Finish' : 'Next',
                    ),
                  ),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
