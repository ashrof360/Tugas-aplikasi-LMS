import 'dart:async';
import 'package:flutter/material.dart';

import '../../data/mock_data.dart';
import '../../models/quiz_question.dart';
import '../../theme/app_colors.dart';

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
  Timer? _timer;
  int _secondsRemaining = 10;

  List<QuizQuestion> get _questions => MockData.quizQuestions;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _secondsRemaining = 10;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _goToNextQuestion();
      }
    });
  }

  void _goToNextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _startTimer();
      });
    } else {
      _timer?.cancel();
      // Quiz finished - logic can be added here (e.g., show score)
      // For now, just exit as per plan
      Navigator.of(context).pop();
    }
  }

  void _onStepTapped(int index) {
    setState(() {
      _currentQuestionIndex = index;
      _startTimer();
    });
  }

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
              color: AppColors.primary,
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
                    Text(
                      '00 : ${(_secondsRemaining < 10) ? "0$_secondsRemaining" : _secondsRemaining}',
                      style: const TextStyle(
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
                        onTap: () => _onStepTapped(q.id - 1),
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
                              color: isCurrent ? AppColors.primary : Colors.white,
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
                          color: isSelected ? AppColors.primary : Colors.grey.shade100,
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
