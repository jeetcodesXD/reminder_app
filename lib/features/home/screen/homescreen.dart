import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminders/features/home/bloc/reminder_bloc.dart';
import 'package:reminders/features/home/bloc/reminder_event.dart';
import 'package:reminders/features/home/bloc/reminder_state.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reminders"),
        centerTitle: true,
      ),
      body: BlocBuilder<ReminderBloc, ReminderState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.reminders.length,
            itemBuilder: (context, index) {
              final reminder = state.reminders[index];
              return ListTile(
                leading: Checkbox(
                  value: reminder.isCompleted,
                  onChanged: (value) {
                    context
                        .read<ReminderBloc>()
                        .add(ToggleReminderCompletion(index));
                  },
                ),
                title: Text(
                  reminder.text,
                  style: TextStyle(
                    decoration: reminder.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              TextEditingController controller = TextEditingController();
              return AlertDialog(
                title: const Text("Add Reminder"),
                content: TextField(
                  controller: controller,
                  decoration:
                      const InputDecoration(hintText: "Enter reminder text"),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        context
                            .read<ReminderBloc>()
                            .add(AddReminder(controller.text));
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
