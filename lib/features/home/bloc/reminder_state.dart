import 'package:equatable/equatable.dart';
import 'package:reminders/dataprovider/models/reminder.dart';

class ReminderState extends Equatable {
  final List<Reminder> reminders;

  const ReminderState(this.reminders);

  @override
  List<Object> get props => [reminders];
}
