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

  List<String> maleFemaleList = ['Male', 'Female'];

  List<String> statusList = ['Social status', 'Dating status'];

  List<String> childrenOptionsList = [
    'Don\'t want',
    'Want someday',
    'Have and want more',
    'Have and do not want more'
  ];

  List<String> educationList = [
    'High school',
    'Associates',
    'Bachelors',
    'Graduate',
    'PHD / Doctorate',
    'Some college'
  ];

  List<String> religionList = [
    'Agonistic',
    'Atheist',
    'Buddhist',
    'Christian / Catholic',
    'Jewish',
    'Muslim',
    'Spiritual not religious'
  ];

  List<String> bodyTypeList = ['Average', 'Fit', 'Curve', 'Slim', 'Chubby'];

  List<String> interestList = [
    'Blogging',
    'Photography',
    'Food',
    'Sport',
    'Karaoke',
    'Traveling'
  ];

  List<String> lookingForList = ['Relationship', 'Date', 'Friendship'];

  List<String> howOftenList = ['Active', 'Sometimes', 'Never'];

  List<String> selectedValues = [
    'gender',
    'genderPreference',
    'intention',
    'childfreeStatus',
    'religion',
    'education',
    'bodytype',
    'workoutStatus',
    'drinkingStatus',
    'smokingStatus',
    'spiritualStatus',
    'listLookingFor'
  ];

  String profileContainerName = '';

  List<String> industryList = [
    'Health',
    'Agriculture',
    'Environment',
    'Consumer Tech',
    'Medicine',
    'Legal',
    'Education',
    'Finance',
    'Automotive',
    'Int. Development',
    'Property',
    'Other'
  ];

  List<String> occupationList = ['Surgeon', 'Front-end developer', 'Soldier'];

  List<String> areYouSpiritualList = ['Spiritual', 'Agnostic', 'Atheist'];

  List<String> workoutRegularityList = ['Never', 'Sometimes', 'Active'];

  List<String> datingOrSocialRadio = ['Dating', 'Social'];

  List<String> lookingForSelection = [];

  List<String> interestedInList = ['Man', 'Woman', 'Everyone'];

  double rangeSliderStart = 0.0;

  double rangeSliderEnd = 0.0;

  String filterName = 'Filter';

  String advancedFilterName = '';

  List<String> currentIndustrySelection = [];

  bool isSelectAllVisible = true;

  int introductionPageNo = 1;

  String mrbSelectedValue = '';

  List<String> mcbSelectedValues = [];

  String usrGender = '';

  String usrGenderPreference = '';

  String usrIntention = '';

  String usrChildfreeStatus = '';

  String usrReligion = '';

  String usrEducation = '';

  String usrBodyType = '';

  List<String> usrLookingFor = [];

  int nmpPickedNumber = 0;

  int usrHeight = 0;

  String usrWorkoutStatus = '';

  String usrDrinkingStatus = '';

  String usrSmokingStatus = '';

  String usrSpiritualStatus = '';

  String usrFirstName = '';

  String usrLastName = '';

  String usrIndustry = '';

  String usrOccupation = '';

  String usrBio = '';

  List<String> usrInterests = [];

  DateTime? usrBDay;
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
