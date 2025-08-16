import 'package:flutter/material.dart';
import 'home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    final percent = (score / total * 100).round();

    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.emoji_events, size: 80),
                const SizedBox(height: 16),
                Text('Your Score', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Text('$score / $total', style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(height: 8),
                Text('$percent% success', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 24),
                LinearProgressIndicator(value: total == 0 ? 0 : score / total),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (route) => false,
                  );
                },
                child: const Text('Exit'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                        (route) => false,
                  );
                },
                child: const Text('Play Again'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
