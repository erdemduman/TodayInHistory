import 'package:flutter/material.dart';

class HistoryCalendar extends StatefulWidget {
  final void Function()? onPressed;

  const HistoryCalendar({
    super.key,
    this.onPressed,
  });

  @override
  State<HistoryCalendar> createState() => _HistoryCalendarState();
}

class _HistoryCalendarState extends State<HistoryCalendar> {
  final List<String> months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
  ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MonthItem extends StatelessWidget {
  final String month;

  const MonthItem({Key? key, required this.month}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
