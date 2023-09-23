// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> viewChange(
  List<dynamic> list,
  String id,
  int oldIndex,
  int newIndex,
) async {
  // Trova l'elemento con l'ID specifico nella lista
  final element = list.firstWhere((item) => item['id'] == id);

  // Rimuovi l'elemento dalla lista originale
  list.remove(element);

  // Inserisci l'elemento nella nuova posizione
  list.insert(newIndex, element);

  return list;
}
