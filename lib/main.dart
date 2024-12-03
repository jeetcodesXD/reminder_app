import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminders/features/home/bloc/reminder_bloc.dart';
import 'package:reminders/features/home/screen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReminderBloc(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: ReminderScreen()),
    );
  }
}
