// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>?> filterView(
  DateTime date,
  List<dynamic>? tasks,
) async {
  // Add your function code here!
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
