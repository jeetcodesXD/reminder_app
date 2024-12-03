import 'package:equatable/equatable.dart';

abstract class ReminderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddReminder extends ReminderEvent {
  final String text;

  AddReminder(this.text);

  @override
  List<Object> get props => [text];
}

class ToggleReminderCompletion extends ReminderEvent {
  final int index;

  ToggleReminderCompletion(this.index);

  @override
  List<Object> get props => [index];
}
