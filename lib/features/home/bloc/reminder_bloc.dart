import 'package:bloc/bloc.dart';
import 'package:reminders/dataprovider/models/reminder.dart';
import 'package:reminders/features/home/bloc/reminder_event.dart';
import 'package:reminders/features/home/bloc/reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc() : super(ReminderState(dummyReminders)) {
    on<AddReminder>((event, emit) {
      final updatedReminders = List<Reminder>.from(state.reminders)
        ..add(Reminder(text: event.text));
      emit(ReminderState(updatedReminders));
    });

    on<ToggleReminderCompletion>((event, emit) {
      final updatedReminders = List<Reminder>.from(state.reminders);

      updatedReminders[event.index] = updatedReminders[event.index].copyWith(
        isCompleted: !updatedReminders[event.index].isCompleted,
      );

      emit(ReminderState(updatedReminders));
    });
  }
}
