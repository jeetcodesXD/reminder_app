class Reminder {
  final String text;
  bool isCompleted;

  Reminder({required this.text, this.isCompleted = false});

  Reminder copyWith({String? text, bool? isCompleted}) {
    return Reminder(
      text: text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}

final List<Reminder> dummyReminders = [
  Reminder(text: "Buy groceries"),
  Reminder(text: "Meeting with team at 3 PM", isCompleted: true),
  Reminder(text: "Call mom"),
  Reminder(text: "Finish Flutter project"),
  Reminder(text: "Workout for 30 minutes", isCompleted: true),
];
