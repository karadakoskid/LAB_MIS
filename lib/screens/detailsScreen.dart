import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatelessWidget{
  // final Exam exam;

  const DetailsScreen({super.key});


  @override
  Widget build(BuildContext context){
    final Exam exam = ModalRoute.of(context)!.settings.arguments as Exam;
    final dateFormatter = DateFormat('dd.MM.yyyy HH:mm');
    final now=DateTime.now();
    final diffrence = exam.dateTime.difference(now);

    final remainingDays = diffrence.inDays;
    final remainingHours = diffrence.inHours % 24;

    return Scaffold(
      appBar: AppBar(title: Text(exam.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("📘 Предмет: ${exam.name}", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text("🏫 Простории: ${exam.rooms.join(", ")}"),
            const SizedBox(height: 20),
            Text(
              exam.dateTime.isBefore(now)
              ? "❗ Испитот е завршен."
              : "⏳ Преостанато време до испитот: $remainingDays дена, $remainingHours часа",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ),
    );

  }
}