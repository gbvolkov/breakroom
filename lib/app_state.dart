import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _genders = prefs.getStringList('ff_genders') ?? _genders;
    _intentions = prefs.getStringList('ff_intentions') ?? _intentions;
  }

  late SharedPreferences prefs;

  List<String> _genders = ['Male', 'Female'];
  List<String> get genders => _genders;
  set genders(List<String> _value) {
    _genders = _value;
    prefs.setStringList('ff_genders', _value);
  }

  void addToGenders(String _value) {
    _genders.add(_value);
    prefs.setStringList('ff_genders', _genders);
  }

  void removeFromGenders(String _value) {
    _genders.remove(_value);
    prefs.setStringList('ff_genders', _genders);
  }

  List<String> _intentions = ['Social', 'Dating'];
  List<String> get intentions => _intentions;
  set intentions(List<String> _value) {
    _intentions = _value;
    prefs.setStringList('ff_intentions', _value);
  }

  void addToIntentions(String _value) {
    _intentions.add(_value);
    prefs.setStringList('ff_intentions', _intentions);
  }

  void removeFromIntentions(String _value) {
    _intentions.remove(_value);
    prefs.setStringList('ff_intentions', _intentions);
  }

  DateTime? userBirthday;

  int userHeight = 12;

  int option = 1;

  String firstName = 'Jane';

  String lastName = 'Cooper';

  bool backArrowVisible = false;

  List<String> testOptions = ['Option1', 'Option2'];
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
