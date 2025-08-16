import 'package:flutter/material.dart';

class DraggableAnswer extends StatelessWidget {
  final String answer;
  final bool enabled;

  const DraggableAnswer({super.key, required this.answer, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    final box = _buildBox(color: enabled ? Colors.indigo : Colors.grey.shade300);
    if (!enabled) return box;

    return Draggable<String>(
      data: answer,
      feedback: Material(color: Colors.transparent, child: _buildBox(color: Colors.indigo.withOpacity(0.85))),
      childWhenDragging: _buildBox(color: Colors.indigo.withOpacity(0.25)),
      child: box,
    );
  }

  Widget _buildBox({required Color color}) {
    return Container(
      width: 96,
      height: 64,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
