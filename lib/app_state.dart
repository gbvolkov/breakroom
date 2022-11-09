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
    _showIntroduction =
        prefs.getBool('ff_showIntroduction') ?? _showIntroduction;
    _whoViewedIntro =
        prefs.getStringList('ff_whoViewedIntro') ?? _whoViewedIntro;
    _build = prefs.getString('ff_build') ?? _build;
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

  List<String> _intentions = ['Dating', 'Social'];
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

  DateTime? userBirthday = DateTime.fromMillisecondsSinceEpoch(33921600000);

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

  List<String> howOftenList = ['Active', 'Sometimes', 'Never', 'Socially'];

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

  DateTime? usrBDay = DateTime.fromMillisecondsSinceEpoch(33921660000);

  String fltrName = '';

  List<String> fltrLookingFor = [];

  LatLng? fltrLocation = LatLng(55.987, 37.202);

  bool fltrAgeRangeExt = false;

  double fltrDistance = 0.0;

  List<String> fltrIndusrtries = [];

  String swipeAction = '';

  String loginDetailsContainerName = '';

  bool agreeCheck = false;

  DateTime? currentBDate = DateTime.fromMillisecondsSinceEpoch(23648220000);

  bool falseconst = false;

  LatLng? mppLocation = LatLng(40.7127753, -74.0059728);

  String mppAddress = '';

  int bioCharCounter = 0;

  String tmpString = '';

  String fltrAddress = '';

  int fltrAgeMin = 0;

  int fltrAgeMax = 0;

  int rangeSliderStart = 0;

  int rangeSliderEnd = 0;

  bool _showIntroduction = true;
  bool get showIntroduction => _showIntroduction;
  set showIntroduction(bool _value) {
    _showIntroduction = _value;
    prefs.setBool('ff_showIntroduction', _value);
  }

  bool tmpBool = false;

  int tmpInteger = 0;

  List<String> _whoViewedIntro = [];
  List<String> get whoViewedIntro => _whoViewedIntro;
  set whoViewedIntro(List<String> _value) {
    _whoViewedIntro = _value;
    prefs.setStringList('ff_whoViewedIntro', _value);
  }

  void addToWhoViewedIntro(String _value) {
    _whoViewedIntro.add(_value);
    prefs.setStringList('ff_whoViewedIntro', _whoViewedIntro);
  }

  void removeFromWhoViewedIntro(String _value) {
    _whoViewedIntro.remove(_value);
    prefs.setStringList('ff_whoViewedIntro', _whoViewedIntro);
  }

  String _build = '20221108.1120.1';
  String get build => _build;
  set build(String _value) {
    _build = _value;
    prefs.setString('ff_build', _value);
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
