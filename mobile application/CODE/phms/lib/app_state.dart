import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _age = 150;
  double get age => _age;
  set age(double _value) {
    _age = _value;
  }

  String _name = 'omar';
  String get name => _name;
  set name(String _value) {
    _name = _value;
  }

  double _height = 350;
  double get height => _height;
  set height(double _value) {
    _height = _value;
  }

  String _blood = 'A+';
  String get blood => _blood;
  set blood(String _value) {
    _blood = _value;
  }

  double _Phone = 0.0;
  double get Phone => _Phone;
  set Phone(double _value) {
    _Phone = _value;
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
