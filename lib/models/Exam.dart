class Exam {
  String name;
  DateTime dateTime;
  List<String> rooms;

  Exam({required this.name, required this.dateTime, required this.rooms});

  Exam.fromJson(Map<String,dynamic> data)
  : name = data['name'],
    dateTime = DateTime.parse(data['dateTime']),
    rooms = List<String>.from(data['rooms']);

  Map<String,dynamic> toJson() => {"name": name, "dateTime": dateTime.toIso8601String(), "rooms": rooms};
}