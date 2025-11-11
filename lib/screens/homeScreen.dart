import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'detailsScreen.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    final List<Exam> exams = [
      Exam(name: "Математика", dateTime: DateTime(2025, 12, 10, 9, 0), rooms: ["A1"]),
      Exam(name: "Програмирање", dateTime: DateTime(2025, 1, 12, 11, 0), rooms: ["B3"]),
      Exam(name: "Физика", dateTime: DateTime(2025, 11, 8, 8, 0), rooms: ["C1"]),
      Exam(name: "Бази на податоци", dateTime: DateTime(2025, 11, 15, 10, 0), rooms: ["A2"]),
      Exam(name: "ОС", dateTime: DateTime(2025, 1, 9, 12, 0), rooms: ["D4"]),
      Exam(name: "Веб дизајн", dateTime: DateTime(2025, 1, 18, 13, 0), rooms: ["A3"]),
      Exam(name: "Мрежи", dateTime: DateTime(2025, 9, 22, 10, 0), rooms: ["B1"]),
      Exam(name: "АИ", dateTime: DateTime(2025, 5, 25, 9, 0), rooms: ["C2"]),
      Exam(name: "Мобилни апликации", dateTime: DateTime(2025, 1, 27, 14, 0), rooms: ["A1"]),
      Exam(name: "Софтверско инженерство", dateTime: DateTime(2025, 1, 30, 11, 0), rooms: ["D1"]),
    ];

    exams.sort((a,b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title:const Text("Распоред на испити -223029"),
        centerTitle:true,
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: exams.length,
              itemBuilder: (context, index){
                final exam = exams[index];
                return ExamCard(exam: exam);

              },
            ),
          ),
          Container(
            color: Colors.blue.shade50,
            padding: const EdgeInsets.all(12),
              child: Text(
                "Вкупно испити: ${exams.length}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          )
        ]
      )
    );
  }
}