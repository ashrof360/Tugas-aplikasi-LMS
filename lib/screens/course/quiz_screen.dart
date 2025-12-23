import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../models/quiz_question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.quizTitle});

  final String quizTitle;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  // Tracking selected option for each question: questionId -> optionIndex
  final Map<int, int> _answers = {};

  List<QuizQuestion> get _questions => MockData.quizQuestions;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Custom Header
          Container(
            padding: const EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
            decoration: const BoxDecoration(
              color: Color(0xFFC65252), // Reddish color from design
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Text(
                  widget.quizTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.timer_outlined, color: Colors.white, size: 20),
                    const SizedBox(width: 4),
                    const Text(
                      '15 : 00',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Question Navigation Bubbles
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _questions.map((q) {
                      final isCurrent = q.id - 1 == _currentQuestionIndex;
                       // Mock logic: assume previous ones are "done" or answer exists
                      final isAnswered = _answers.containsKey(q.id);
                      
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentQuestionIndex = q.id - 1;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isCurrent
                                ? Colors.white
                                : (isAnswered ? const Color(0xFF4CAF50) : const Color(0xFF4CAF50)), // All green in design except current
                            border: isCurrent ? Border.all(color: Colors.transparent, width: 2) : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${q.id}',
                            style: TextStyle(
                              color: isCurrent ? const Color(0xFFC65252) : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Soal Nomor ${currentQuestion.id} / ${_questions.length}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    currentQuestion.text,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  ...currentQuestion.options.asMap().entries.map((entry) {
                    final index = entry.key;
                    final text = entry.value;
                    final isSelected = _answers[currentQuestion.id] == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _answers[currentQuestion.id] = index;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFEF5350) : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          text,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.all(20),
             child: Center(
               child: TextButton(
                 style: TextButton.styleFrom(
                   backgroundColor: Colors.grey.shade200,
                   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                 ),
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 child: const Text('Kembali Ke Halaman Review', style: TextStyle(color: Colors.black)),
               ),
             ),
          ),
        ],
      ),
    );
  }
}
