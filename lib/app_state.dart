import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _tagList = await secureStorage.getStringList('ff_tagList') ?? _tagList;
    });
    await _safeInitAsync(() async {
      _prmm = await secureStorage.getBool('ff_prmm') ?? _prmm;
    });
    await _safeInitAsync(() async {
      _tasksList =
          (await secureStorage.getStringList('ff_tasksList'))?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _tasksList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    _selectedDate = _value;
  }

  List<String> _tagList = [];
  List<String> get tagList => _tagList;
  set tagList(List<String> _value) {
    _tagList = _value;
    secureStorage.setStringList('ff_tagList', _value);
  }

  void deleteTagList() {
    secureStorage.delete(key: 'ff_tagList');
  }

  void addToTagList(String _value) {
    _tagList.add(_value);
    secureStorage.setStringList('ff_tagList', _tagList);
  }

  void removeFromTagList(String _value) {
    _tagList.remove(_value);
    secureStorage.setStringList('ff_tagList', _tagList);
  }

  void removeAtIndexFromTagList(int _index) {
    _tagList.removeAt(_index);
    secureStorage.setStringList('ff_tagList', _tagList);
  }

  void updateTagListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _tagList[_index] = updateFn(_tagList[_index]);
    secureStorage.setStringList('ff_tagList', _tagList);
  }

  void insertAtIndexInTagList(int _index, String _value) {
    _tagList.insert(_index, _value);
    secureStorage.setStringList('ff_tagList', _tagList);
  }

  bool _prmm = false;
  bool get prmm => _prmm;
  set prmm(bool _value) {
    _prmm = _value;
    secureStorage.setBool('ff_prmm', _value);
  }

  void deletePrmm() {
    secureStorage.delete(key: 'ff_prmm');
  }

  List<dynamic> _tasksList = [
    jsonDecode(
        '{\"title\":\"Comprare i pomodori\",\"icon\":\"done\",\"description\":\"La descrizione è comprare le pummarole\",\"color\":\"#FFFFFF\",\"iconColor\":\"#FFFFFF\",\"timestart\":\"12:30 AM\",\"timeend\":\"5:00 PM\",\"frequency\":\"everyDay\",\"endfrequency\":\"infinite\",\"type\":\"normal\",\"notification\":\"5minutesBefore\",\"boldIcon\":false,\"completedTasks\":{\"23/09/2023\":{\"done\":\"true\",\"desc\":\"gay\",\"subTasks\":{\"id333\":true,\"id321\":false}},\"24/09/2023\":{\"done\":\"false\",\"desc\":\"Andata bene\",\"subTasks\":{\"id333\":false,\"id321\":false}}},\"subTasksIDs\":{\"id333\":\"Comprarle acerbe\",\"id321\":\"Per insalata\"},\"dateStart\":\"22/09/2023\"}'),
    jsonDecode(
        '{\"title\":\"Comprare le fragole\",\"icon\":\"done\",\"description\":\"La descrizione è comprare le fragole\",\"color\":\"#FFFFFF\",\"iconColor\":\"#FFFFFF\",\"timestart\":\"8:30 AM\",\"timeend\":\"2:00 PM\",\"frequency\":\"every2weeks\",\"endfrequency\":\"23/07/2024\",\"type\":\"oneOption\",\"notification\":\"5minutesBefore\",\"boldIcon\":false,\"completedTasks\":{\"23/09/2023\":{\"done\":\"true\",\"desc\":\"gayy\",\"subTasks\":{\"id3dfwe\":true}},\"24/09/2023\":{\"done\":\"false\",\"desc\":\"Andata bene\",\"subTasks\":{\"id3334213\":true}}},\"subTasksIDs\":{\"id3dfwe\":\"Poco rosse\",\"id3334213\":\"Molto rosse\"},\"dateStart\":\"22/09/2023\"}')
  ];
  List<dynamic> get tasksList => _tasksList;
  set tasksList(List<dynamic> _value) {
    _tasksList = _value;
    secureStorage.setStringList(
        'ff_tasksList', _value.map((x) => jsonEncode(x)).toList());
  }

  void deleteTasksList() {
    secureStorage.delete(key: 'ff_tasksList');
  }

  void addToTasksList(dynamic _value) {
    _tasksList.add(_value);
    secureStorage.setStringList(
        'ff_tasksList', _tasksList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTasksList(dynamic _value) {
    _tasksList.remove(_value);
    secureStorage.setStringList(
        'ff_tasksList', _tasksList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTasksList(int _index) {
    _tasksList.removeAt(_index);
    secureStorage.setStringList(
        'ff_tasksList', _tasksList.map((x) => jsonEncode(x)).toList());
  }

  void updateTasksListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _tasksList[_index] = updateFn(_tasksList[_index]);
    secureStorage.setStringList(
        'ff_tasksList', _tasksList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTasksList(int _index, dynamic _value) {
    _tasksList.insert(_index, _value);
    secureStorage.setStringList(
        'ff_tasksList', _tasksList.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _view = [
    jsonDecode(
        '{\"title\":\"Comprare i pomodori\",\"icon\":\"done\",\"description\":\"La descrizione è comprare le pummarole\",\"color\":\"#FFFFFF\",\"iconColor\":\"#FFFFFF\",\"timestart\":\"12:30 AM\",\"timeend\":\"5:00 PM\",\"frequency\":\"everyDay\",\"endfrequency\":\"infinite\",\"type\":\"normal\",\"notification\":\"5minutesBefore\",\"boldIcon\":false,\"completedTasks\":{\"23/09/2023\":{\"done\":\"true\",\"desc\":\"gay\",\"subTasks\":{\"id333\":true,\"id321\":false}},\"24/09/2023\":{\"done\":\"false\",\"desc\":\"Andata bene\",\"subTasks\":{\"id333\":false,\"id321\":false}}},\"subTasksIDs\":{\"id333\":\"Comprarle acerbe\",\"id321\":\"Per insalata\"},\"dateStart\":\"22/09/2023\"}')
  ];
  List<dynamic> get view => _view;
  set view(List<dynamic> _value) {
    _view = _value;
  }

  void addToView(dynamic _value) {
    _view.add(_value);
  }

  void removeFromView(dynamic _value) {
    _view.remove(_value);
  }

  void removeAtIndexFromView(int _index) {
    _view.removeAt(_index);
  }

  void updateViewAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _view[_index] = updateFn(_view[_index]);
  }

  void insertAtIndexInView(int _index, dynamic _value) {
    _view.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
