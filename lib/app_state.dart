import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? _value) {
    _selectedDate = _value;
  }

  DocumentReference? _selectedCustomer;
  DocumentReference? get selectedCustomer => _selectedCustomer;
  set selectedCustomer(DocumentReference? _value) {
    _selectedCustomer = _value;
  }

  String _selectedCustomerName = '';
  String get selectedCustomerName => _selectedCustomerName;
  set selectedCustomerName(String _value) {
    _selectedCustomerName = _value;
  }

  String _selectedCustomerAddress = '';
  String get selectedCustomerAddress => _selectedCustomerAddress;
  set selectedCustomerAddress(String _value) {
    _selectedCustomerAddress = _value;
  }

  DocumentReference? _selectedRanger;
  DocumentReference? get selectedRanger => _selectedRanger;
  set selectedRanger(DocumentReference? _value) {
    _selectedRanger = _value;
  }

  String _selectedRangerName = '';
  String get selectedRangerName => _selectedRangerName;
  set selectedRangerName(String _value) {
    _selectedRangerName = _value;
  }

  String _selectedCustomerPhone = '';
  String get selectedCustomerPhone => _selectedCustomerPhone;
  set selectedCustomerPhone(String _value) {
    _selectedCustomerPhone = _value;
  }

  LatLng? _selectedCustomerLatLng;
  LatLng? get selectedCustomerLatLng => _selectedCustomerLatLng;
  set selectedCustomerLatLng(LatLng? _value) {
    _selectedCustomerLatLng = _value;
  }

  String _selectedRangerPhone = '';
  String get selectedRangerPhone => _selectedRangerPhone;
  set selectedRangerPhone(String _value) {
    _selectedRangerPhone = _value;
  }

  String _selectedRangerPicture = '';
  String get selectedRangerPicture => _selectedRangerPicture;
  set selectedRangerPicture(String _value) {
    _selectedRangerPicture = _value;
  }

  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  set searchQuery(String _value) {
    _searchQuery = _value;
  }

  DocumentReference? _assignedRanger;
  DocumentReference? get assignedRanger => _assignedRanger;
  set assignedRanger(DocumentReference? _value) {
    _assignedRanger = _value;
  }

  String _assignedRangerName = '';
  String get assignedRangerName => _assignedRangerName;
  set assignedRangerName(String _value) {
    _assignedRangerName = _value;
  }

  String _assignedRangerPicture = '';
  String get assignedRangerPicture => _assignedRangerPicture;
  set assignedRangerPicture(String _value) {
    _assignedRangerPicture = _value;
  }

  List<DocumentReference> _groomerList = [
    FirebaseFirestore.instance.doc('/rangers/Q5BvEteqpThJrenAzga36UCdQei2'),
    FirebaseFirestore.instance.doc('/rangers/i8VUfLEhKmPYS9NgoisxHgueTgl2'),
    FirebaseFirestore.instance.doc('/rangers/pUgDOviQ0jPbDBPgvpsCvUtrTA32')
  ];
  
  List<DocumentReference> get groomerList => _groomerList;
  set groomerList(List<DocumentReference> _value) {
    _groomerList = _value;
  }

  void addToGroomerList(DocumentReference _value) {
    _groomerList.add(_value);
  }

  void removeFromGroomerList(DocumentReference _value) {
    _groomerList.remove(_value);
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
