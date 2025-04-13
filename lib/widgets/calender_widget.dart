import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 284,
        padding: const EdgeInsets.all(8), // Reduced internal padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TableCalendar(
          firstDay: DateTime.utc(2010, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: CalendarFormat.month,
          rowHeight: 32, // Reduced row height
          daysOfWeekHeight: 24, // Reduce day labels height
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.deepPurpleAccent.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              shape: BoxShape.circle,
            ),
            defaultTextStyle: const TextStyle(color: Color(0xFF2E293D)),
            weekendTextStyle: const TextStyle(color: Color(0xFF2E293D)),
            selectedTextStyle: const TextStyle(color: Colors.white),
            todayTextStyle: const TextStyle(color: Color(0xFF2E293D)),
            outsideDaysVisible: true,
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: const TextStyle(
              color: Color(0xFF2E293D),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            leftChevronIcon: const Icon(
              Icons.chevron_left,
              color: Color(0xFF2E293D),
            ),
            rightChevronIcon: const Icon(
              Icons.chevron_right,
              color: Color(0xFF2E293D),
            ),
          ),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
        ),
      ),
    );
  }
}
