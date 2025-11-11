import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';
// import 'detailsScreen.dart';

class ExamCard extends StatelessWidget{
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context){
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');
    final isPastExam = exam.dateTime.isBefore(DateTime.now());
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, "/detailsScreen"
        , arguments: exam);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side:BorderSide(color: isPastExam ? Colors.red.shade50 : Colors.green.shade50, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding : const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              exam.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.calendar_today,size:18),
            const SizedBox(width: 6),
            Text(dateFormat.format(exam.dateTime)),
            const SizedBox(width: 12),
            const Icon(Icons.access_time,size:18),
            const SizedBox(width: 6),
            Text(timeFormat.format(exam.dateTime)),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.room, size: 18),
            const SizedBox(width: 6),
            Text(exam.rooms.join(", ")),
          ],
            ),
        ],
          ),

        ),
      ),
    );
  }
}