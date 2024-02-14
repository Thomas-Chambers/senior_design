import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui'; // Import this for ImageFilter.

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  // Define random workout days for the sake of this implementation
  List<DateTime> workoutDays = [
    DateTime.now().subtract(Duration(days: 2)), // Example workout day
    DateTime.now().subtract(Duration(days: 4)), // Another example
    DateTime.now().add(Duration(days: 3)), // Future workout day
  ];

  bool isWorkoutDay(DateTime day) {
    // Check if 'day' is a workout day
    return workoutDays.any((workoutDay) =>
    day.year == workoutDay.year &&
        day.month == workoutDay.month &&
        day.day == workoutDay.day
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Align(
        alignment: Alignment.topCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // Rounded corners for the glass effect
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white.withOpacity(0.2), // Slight border color for better definition
                width: 1.0, // Border width
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today, color: Colors.black), // Adjust icon color for visibility
                      SizedBox(width: 8),
                      Text(
                        'Calendar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Text color for visibility
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true, // Ensure the title is centered
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Adjust for visibility
                      ),
                      leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
                      rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(color: Colors.black),
                    ),
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      todayTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: TextStyle(color: Colors.black), // Adjust for better visibility
                      defaultTextStyle: TextStyle(color: Colors.black), // Adjust for better visibility
                    ),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        if (isWorkoutDay(day)) {
                          return Container(
                            margin: const EdgeInsets.all(4.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        } else if (day == DateTime.now()) {
                          return Container(
                            margin: const EdgeInsets.all(4.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        return null; // Use default appearance for other days
                      },
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      if (isWorkoutDay(selectedDay)) {
                        // Handle workout day selection
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Workout day selected!')));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
