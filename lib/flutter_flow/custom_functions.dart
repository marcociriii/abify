import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

DateTime add1day(DateTime selectedDate) {
  final newDate = selectedDate.add(Duration(days: 1));
  return newDate;
}

DateTime remove1day(DateTime selectedDate) {
  final newDate = selectedDate.subtract(Duration(days: 1));
  return newDate;
}

List<String>? getIcons() {
  return [
    "accessibility",
    "alarm",
    "assignment",
    "bookmark",
    "build",
    "calendar_today",
    "check_circle",
    "child_friendly",
    "code",
    "date_range",
    "directions_run",
    "done",
    "event",
    "explore",
    "favorite",
    "fitness_center",
    "grade",
    "group",
    "highlight",
    "home",
    "inbox",
    "insert_chart",
    "label",
    "local_cafe",
    "local_dining",
    "local_grocery_store",
    "local_hospital",
    "local_pizza",
    "local_shipping",
    "mail",
    "meeting_room",
    "mood",
    "nature_people",
    "note",
    "people",
    "playlist_add_check",
    "receipt",
    "rowing",
    "school",
    "shopping_cart",
    "star",
    "thumb_up",
    "today",
    "touch_app",
    "videocam",
    "weekend",
    "work",
  ];
}

DateTime stabilizeDay(DateTime date) {
  date = DateTime(date.year, date.month, date.day);
  return date;
}

dynamic filter(
  DateTime date,
  List<dynamic>? tasks,
) {
  if (tasks == null) {
    return null;
  }

  var filteredTasks = <dynamic>[];

  for (var task in tasks) {
    var dateStart = DateFormat('dd/MM/yyyy').parse(task['dateStart']);
    var endFrequency = task['endfrequency'] == 'infinite'
        ? DateTime.now()
            .add(Duration(days: 365 * 100)) // Set to a far future date
        : DateFormat('dd/MM/yyyy').parse(task['endfrequency']);

    if (date.isAfter(dateStart.subtract(Duration(days: 1))) &&
        date.isBefore(endFrequency.add(Duration(days: 1)))) {
      switch (task['frequency']) {
        case 'everyDay':
          filteredTasks.add(task);
          break;
        case 'every2weeks':
          var difference = date.difference(dateStart).inDays;
          if (difference % 14 == 0) {
            filteredTasks.add(task);
          }
          break;
        // Add more cases as needed
      }
    }
  }

  // Sort by time-start
  filteredTasks
      .sort((a, b) => DateFormat('hh:mm a').parse(a['timestart']).compareTo(
            DateFormat('hh:mm a').parse(b['timestart']),
          ));

  // Modify completedTasks to only include the specified date
  for (var task in filteredTasks) {
    var completedTasks = task['completedTasks'];
    var specifiedDate = completedTasks[DateFormat('dd/MM/yyyy').format(date)];
    if (specifiedDate != null) {
      task['done'] = specifiedDate['done'];
      task['desc'] = specifiedDate['desc'];
      task['subTasks'] = specifiedDate['subTasks'];
    } else {
      task.remove('done');
      task.remove('desc');
      task.remove('subTasks');
    }
    task.remove('completedTasks');
  }

  return filteredTasks;
}

dynamic returnTheJSON(String? name) {
  return name;
}
