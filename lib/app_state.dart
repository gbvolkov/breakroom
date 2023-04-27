import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
    _genders = prefs.getStringList('ff_genders') ?? _genders;
    _intentions = prefs.getStringList('ff_intentions') ?? _intentions;
    _showIntroduction =
        prefs.getBool('ff_showIntroduction') ?? _showIntroduction;
    _whoViewedIntro =
        prefs.getStringList('ff_whoViewedIntro') ?? _whoViewedIntro;
    _build = prefs.getString('ff_build') ?? _build;
    _recentChats = prefs
            .getStringList('ff_recentChats')
            ?.map((path) => path.ref)
            .toList() ??
        _recentChats;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
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

  void removeAtIndexFromGenders(int _index) {
    _genders.removeAt(_index);
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

  void removeAtIndexFromIntentions(int _index) {
    _intentions.removeAt(_index);
    prefs.setStringList('ff_intentions', _intentions);
  }

  DateTime? _userBirthday = DateTime.fromMillisecondsSinceEpoch(33921600000);
  DateTime? get userBirthday => _userBirthday;
  set userBirthday(DateTime? _value) {
    _userBirthday = _value;
  }

  int _userHeight = 12;
  int get userHeight => _userHeight;
  set userHeight(int _value) {
    _userHeight = _value;
  }

  int _option = 1;
  int get option => _option;
  set option(int _value) {
    _option = _value;
  }

  String _firstName = 'Jane';
  String get firstName => _firstName;
  set firstName(String _value) {
    _firstName = _value;
  }

  String _lastName = 'Cooper';
  String get lastName => _lastName;
  set lastName(String _value) {
    _lastName = _value;
  }

  bool _backArrowVisible = false;
  bool get backArrowVisible => _backArrowVisible;
  set backArrowVisible(bool _value) {
    _backArrowVisible = _value;
  }

  List<String> _testOptions = ['Option1', 'Option2'];
  List<String> get testOptions => _testOptions;
  set testOptions(List<String> _value) {
    _testOptions = _value;
  }

  void addToTestOptions(String _value) {
    _testOptions.add(_value);
  }

  void removeFromTestOptions(String _value) {
    _testOptions.remove(_value);
  }

  void removeAtIndexFromTestOptions(int _index) {
    _testOptions.removeAt(_index);
  }

  List<String> _maleFemaleList = ['Male', 'Female'];
  List<String> get maleFemaleList => _maleFemaleList;
  set maleFemaleList(List<String> _value) {
    _maleFemaleList = _value;
  }

  void addToMaleFemaleList(String _value) {
    _maleFemaleList.add(_value);
  }

  void removeFromMaleFemaleList(String _value) {
    _maleFemaleList.remove(_value);
  }

  void removeAtIndexFromMaleFemaleList(int _index) {
    _maleFemaleList.removeAt(_index);
  }

  List<String> _statusList = ['Social status', 'Dating status'];
  List<String> get statusList => _statusList;
  set statusList(List<String> _value) {
    _statusList = _value;
  }

  void addToStatusList(String _value) {
    _statusList.add(_value);
  }

  void removeFromStatusList(String _value) {
    _statusList.remove(_value);
  }

  void removeAtIndexFromStatusList(int _index) {
    _statusList.removeAt(_index);
  }

  List<String> _childrenOptionsList = [
    'Don\'t want',
    'Want someday',
    'Have and want more',
    'Have and do not want more'
  ];
  List<String> get childrenOptionsList => _childrenOptionsList;
  set childrenOptionsList(List<String> _value) {
    _childrenOptionsList = _value;
  }

  void addToChildrenOptionsList(String _value) {
    _childrenOptionsList.add(_value);
  }

  void removeFromChildrenOptionsList(String _value) {
    _childrenOptionsList.remove(_value);
  }

  void removeAtIndexFromChildrenOptionsList(int _index) {
    _childrenOptionsList.removeAt(_index);
  }

  List<String> _educationList = [
    'High school',
    'Associates',
    'Bachelors',
    'Graduate',
    'PHD / Doctorate',
    'Some college'
  ];
  List<String> get educationList => _educationList;
  set educationList(List<String> _value) {
    _educationList = _value;
  }

  void addToEducationList(String _value) {
    _educationList.add(_value);
  }

  void removeFromEducationList(String _value) {
    _educationList.remove(_value);
  }

  void removeAtIndexFromEducationList(int _index) {
    _educationList.removeAt(_index);
  }

  List<String> _religionList = [
    'Agonistic',
    'Atheist',
    'Buddhist',
    'Christian / Catholic',
    'Jewish',
    'Muslim',
    'Spiritual not religious'
  ];
  List<String> get religionList => _religionList;
  set religionList(List<String> _value) {
    _religionList = _value;
  }

  void addToReligionList(String _value) {
    _religionList.add(_value);
  }

  void removeFromReligionList(String _value) {
    _religionList.remove(_value);
  }

  void removeAtIndexFromReligionList(int _index) {
    _religionList.removeAt(_index);
  }

  List<String> _bodyTypeList = ['Average', 'Fit', 'Curve', 'Slim', 'Chubby'];
  List<String> get bodyTypeList => _bodyTypeList;
  set bodyTypeList(List<String> _value) {
    _bodyTypeList = _value;
  }

  void addToBodyTypeList(String _value) {
    _bodyTypeList.add(_value);
  }

  void removeFromBodyTypeList(String _value) {
    _bodyTypeList.remove(_value);
  }

  void removeAtIndexFromBodyTypeList(int _index) {
    _bodyTypeList.removeAt(_index);
  }

  List<String> _interestList = [
    'Blogging',
    'Photography',
    'Food',
    'Sport',
    'Karaoke',
    'Traveling'
  ];
  List<String> get interestList => _interestList;
  set interestList(List<String> _value) {
    _interestList = _value;
  }

  void addToInterestList(String _value) {
    _interestList.add(_value);
  }

  void removeFromInterestList(String _value) {
    _interestList.remove(_value);
  }

  void removeAtIndexFromInterestList(int _index) {
    _interestList.removeAt(_index);
  }

  List<String> _lookingForList = ['Relationship', 'Date', 'Friendship'];
  List<String> get lookingForList => _lookingForList;
  set lookingForList(List<String> _value) {
    _lookingForList = _value;
  }

  void addToLookingForList(String _value) {
    _lookingForList.add(_value);
  }

  void removeFromLookingForList(String _value) {
    _lookingForList.remove(_value);
  }

  void removeAtIndexFromLookingForList(int _index) {
    _lookingForList.removeAt(_index);
  }

  List<String> _howOftenList = ['Active', 'Sometimes', 'Never', 'Socially'];
  List<String> get howOftenList => _howOftenList;
  set howOftenList(List<String> _value) {
    _howOftenList = _value;
  }

  void addToHowOftenList(String _value) {
    _howOftenList.add(_value);
  }

  void removeFromHowOftenList(String _value) {
    _howOftenList.remove(_value);
  }

  void removeAtIndexFromHowOftenList(int _index) {
    _howOftenList.removeAt(_index);
  }

  List<String> _selectedValues = [
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
  List<String> get selectedValues => _selectedValues;
  set selectedValues(List<String> _value) {
    _selectedValues = _value;
  }

  void addToSelectedValues(String _value) {
    _selectedValues.add(_value);
  }

  void removeFromSelectedValues(String _value) {
    _selectedValues.remove(_value);
  }

  void removeAtIndexFromSelectedValues(int _index) {
    _selectedValues.removeAt(_index);
  }

  String _profileContainerName = '';
  String get profileContainerName => _profileContainerName;
  set profileContainerName(String _value) {
    _profileContainerName = _value;
  }

  List<String> _industryList = [
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
  List<String> get industryList => _industryList;
  set industryList(List<String> _value) {
    _industryList = _value;
  }

  void addToIndustryList(String _value) {
    _industryList.add(_value);
  }

  void removeFromIndustryList(String _value) {
    _industryList.remove(_value);
  }

  void removeAtIndexFromIndustryList(int _index) {
    _industryList.removeAt(_index);
  }

  List<String> _occupationList = ['Surgeon', 'Front-end developer', 'Soldier'];
  List<String> get occupationList => _occupationList;
  set occupationList(List<String> _value) {
    _occupationList = _value;
  }

  void addToOccupationList(String _value) {
    _occupationList.add(_value);
  }

  void removeFromOccupationList(String _value) {
    _occupationList.remove(_value);
  }

  void removeAtIndexFromOccupationList(int _index) {
    _occupationList.removeAt(_index);
  }

  List<String> _areYouSpiritualList = ['Spiritual', 'Agnostic', 'Atheist'];
  List<String> get areYouSpiritualList => _areYouSpiritualList;
  set areYouSpiritualList(List<String> _value) {
    _areYouSpiritualList = _value;
  }

  void addToAreYouSpiritualList(String _value) {
    _areYouSpiritualList.add(_value);
  }

  void removeFromAreYouSpiritualList(String _value) {
    _areYouSpiritualList.remove(_value);
  }

  void removeAtIndexFromAreYouSpiritualList(int _index) {
    _areYouSpiritualList.removeAt(_index);
  }

  List<String> _workoutRegularityList = ['Never', 'Sometimes', 'Active'];
  List<String> get workoutRegularityList => _workoutRegularityList;
  set workoutRegularityList(List<String> _value) {
    _workoutRegularityList = _value;
  }

  void addToWorkoutRegularityList(String _value) {
    _workoutRegularityList.add(_value);
  }

  void removeFromWorkoutRegularityList(String _value) {
    _workoutRegularityList.remove(_value);
  }

  void removeAtIndexFromWorkoutRegularityList(int _index) {
    _workoutRegularityList.removeAt(_index);
  }

  List<String> _datingOrSocialRadio = ['Dating', 'Social'];
  List<String> get datingOrSocialRadio => _datingOrSocialRadio;
  set datingOrSocialRadio(List<String> _value) {
    _datingOrSocialRadio = _value;
  }

  void addToDatingOrSocialRadio(String _value) {
    _datingOrSocialRadio.add(_value);
  }

  void removeFromDatingOrSocialRadio(String _value) {
    _datingOrSocialRadio.remove(_value);
  }

  void removeAtIndexFromDatingOrSocialRadio(int _index) {
    _datingOrSocialRadio.removeAt(_index);
  }

  List<String> _lookingForSelection = [];
  List<String> get lookingForSelection => _lookingForSelection;
  set lookingForSelection(List<String> _value) {
    _lookingForSelection = _value;
  }

  void addToLookingForSelection(String _value) {
    _lookingForSelection.add(_value);
  }

  void removeFromLookingForSelection(String _value) {
    _lookingForSelection.remove(_value);
  }

  void removeAtIndexFromLookingForSelection(int _index) {
    _lookingForSelection.removeAt(_index);
  }

  List<String> _interestedInList = ['Men', 'Women', 'Everyone'];
  List<String> get interestedInList => _interestedInList;
  set interestedInList(List<String> _value) {
    _interestedInList = _value;
  }

  void addToInterestedInList(String _value) {
    _interestedInList.add(_value);
  }

  void removeFromInterestedInList(String _value) {
    _interestedInList.remove(_value);
  }

  void removeAtIndexFromInterestedInList(int _index) {
    _interestedInList.removeAt(_index);
  }

  String _filterName = 'Filter';
  String get filterName => _filterName;
  set filterName(String _value) {
    _filterName = _value;
  }

  String _advancedFilterName = '';
  String get advancedFilterName => _advancedFilterName;
  set advancedFilterName(String _value) {
    _advancedFilterName = _value;
  }

  List<String> _currentIndustrySelection = [];
  List<String> get currentIndustrySelection => _currentIndustrySelection;
  set currentIndustrySelection(List<String> _value) {
    _currentIndustrySelection = _value;
  }

  void addToCurrentIndustrySelection(String _value) {
    _currentIndustrySelection.add(_value);
  }

  void removeFromCurrentIndustrySelection(String _value) {
    _currentIndustrySelection.remove(_value);
  }

  void removeAtIndexFromCurrentIndustrySelection(int _index) {
    _currentIndustrySelection.removeAt(_index);
  }

  bool _isSelectAllVisible = true;
  bool get isSelectAllVisible => _isSelectAllVisible;
  set isSelectAllVisible(bool _value) {
    _isSelectAllVisible = _value;
  }

  int _introductionPageNo = 1;
  int get introductionPageNo => _introductionPageNo;
  set introductionPageNo(int _value) {
    _introductionPageNo = _value;
  }

  String _mrbSelectedValue = '';
  String get mrbSelectedValue => _mrbSelectedValue;
  set mrbSelectedValue(String _value) {
    _mrbSelectedValue = _value;
  }

  List<String> _mcbSelectedValues = [];
  List<String> get mcbSelectedValues => _mcbSelectedValues;
  set mcbSelectedValues(List<String> _value) {
    _mcbSelectedValues = _value;
  }

  void addToMcbSelectedValues(String _value) {
    _mcbSelectedValues.add(_value);
  }

  void removeFromMcbSelectedValues(String _value) {
    _mcbSelectedValues.remove(_value);
  }

  void removeAtIndexFromMcbSelectedValues(int _index) {
    _mcbSelectedValues.removeAt(_index);
  }

  String _usrGender = '';
  String get usrGender => _usrGender;
  set usrGender(String _value) {
    _usrGender = _value;
  }

  String _usrGenderPreference = '';
  String get usrGenderPreference => _usrGenderPreference;
  set usrGenderPreference(String _value) {
    _usrGenderPreference = _value;
  }

  String _usrIntention = '';
  String get usrIntention => _usrIntention;
  set usrIntention(String _value) {
    _usrIntention = _value;
  }

  String _usrChildfreeStatus = '';
  String get usrChildfreeStatus => _usrChildfreeStatus;
  set usrChildfreeStatus(String _value) {
    _usrChildfreeStatus = _value;
  }

  String _usrReligion = '';
  String get usrReligion => _usrReligion;
  set usrReligion(String _value) {
    _usrReligion = _value;
  }

  String _usrEducation = '';
  String get usrEducation => _usrEducation;
  set usrEducation(String _value) {
    _usrEducation = _value;
  }

  String _usrBodyType = '';
  String get usrBodyType => _usrBodyType;
  set usrBodyType(String _value) {
    _usrBodyType = _value;
  }

  List<String> _usrLookingFor = [];
  List<String> get usrLookingFor => _usrLookingFor;
  set usrLookingFor(List<String> _value) {
    _usrLookingFor = _value;
  }

  void addToUsrLookingFor(String _value) {
    _usrLookingFor.add(_value);
  }

  void removeFromUsrLookingFor(String _value) {
    _usrLookingFor.remove(_value);
  }

  void removeAtIndexFromUsrLookingFor(int _index) {
    _usrLookingFor.removeAt(_index);
  }

  int _nmpPickedNumber = 0;
  int get nmpPickedNumber => _nmpPickedNumber;
  set nmpPickedNumber(int _value) {
    _nmpPickedNumber = _value;
  }

  int _usrHeight = 0;
  int get usrHeight => _usrHeight;
  set usrHeight(int _value) {
    _usrHeight = _value;
  }

  String _usrWorkoutStatus = '';
  String get usrWorkoutStatus => _usrWorkoutStatus;
  set usrWorkoutStatus(String _value) {
    _usrWorkoutStatus = _value;
  }

  String _usrDrinkingStatus = '';
  String get usrDrinkingStatus => _usrDrinkingStatus;
  set usrDrinkingStatus(String _value) {
    _usrDrinkingStatus = _value;
  }

  String _usrSmokingStatus = '';
  String get usrSmokingStatus => _usrSmokingStatus;
  set usrSmokingStatus(String _value) {
    _usrSmokingStatus = _value;
  }

  String _usrSpiritualStatus = '';
  String get usrSpiritualStatus => _usrSpiritualStatus;
  set usrSpiritualStatus(String _value) {
    _usrSpiritualStatus = _value;
  }

  String _usrFirstName = '';
  String get usrFirstName => _usrFirstName;
  set usrFirstName(String _value) {
    _usrFirstName = _value;
  }

  String _usrLastName = '';
  String get usrLastName => _usrLastName;
  set usrLastName(String _value) {
    _usrLastName = _value;
  }

  String _usrIndustry = '';
  String get usrIndustry => _usrIndustry;
  set usrIndustry(String _value) {
    _usrIndustry = _value;
  }

  String _usrOccupation = '';
  String get usrOccupation => _usrOccupation;
  set usrOccupation(String _value) {
    _usrOccupation = _value;
  }

  String _usrBio = '';
  String get usrBio => _usrBio;
  set usrBio(String _value) {
    _usrBio = _value;
  }

  List<String> _usrInterests = [];
  List<String> get usrInterests => _usrInterests;
  set usrInterests(List<String> _value) {
    _usrInterests = _value;
  }

  void addToUsrInterests(String _value) {
    _usrInterests.add(_value);
  }

  void removeFromUsrInterests(String _value) {
    _usrInterests.remove(_value);
  }

  void removeAtIndexFromUsrInterests(int _index) {
    _usrInterests.removeAt(_index);
  }

  DateTime? _usrBDay = DateTime.fromMillisecondsSinceEpoch(33921660000);
  DateTime? get usrBDay => _usrBDay;
  set usrBDay(DateTime? _value) {
    _usrBDay = _value;
  }

  String _fltrName = '';
  String get fltrName => _fltrName;
  set fltrName(String _value) {
    _fltrName = _value;
  }

  List<String> _fltrLookingFor = [];
  List<String> get fltrLookingFor => _fltrLookingFor;
  set fltrLookingFor(List<String> _value) {
    _fltrLookingFor = _value;
  }

  void addToFltrLookingFor(String _value) {
    _fltrLookingFor.add(_value);
  }

  void removeFromFltrLookingFor(String _value) {
    _fltrLookingFor.remove(_value);
  }

  void removeAtIndexFromFltrLookingFor(int _index) {
    _fltrLookingFor.removeAt(_index);
  }

  LatLng? _fltrLocation = LatLng(55.987, 37.202);
  LatLng? get fltrLocation => _fltrLocation;
  set fltrLocation(LatLng? _value) {
    _fltrLocation = _value;
  }

  bool _fltrAgeRangeExt = false;
  bool get fltrAgeRangeExt => _fltrAgeRangeExt;
  set fltrAgeRangeExt(bool _value) {
    _fltrAgeRangeExt = _value;
  }

  double _fltrDistance = 0.0;
  double get fltrDistance => _fltrDistance;
  set fltrDistance(double _value) {
    _fltrDistance = _value;
  }

  List<String> _fltrIndusrtries = [];
  List<String> get fltrIndusrtries => _fltrIndusrtries;
  set fltrIndusrtries(List<String> _value) {
    _fltrIndusrtries = _value;
  }

  void addToFltrIndusrtries(String _value) {
    _fltrIndusrtries.add(_value);
  }

  void removeFromFltrIndusrtries(String _value) {
    _fltrIndusrtries.remove(_value);
  }

  void removeAtIndexFromFltrIndusrtries(int _index) {
    _fltrIndusrtries.removeAt(_index);
  }

  String _swipeAction = '';
  String get swipeAction => _swipeAction;
  set swipeAction(String _value) {
    _swipeAction = _value;
  }

  String _loginDetailsContainerName = '';
  String get loginDetailsContainerName => _loginDetailsContainerName;
  set loginDetailsContainerName(String _value) {
    _loginDetailsContainerName = _value;
  }

  bool _agreeCheck = false;
  bool get agreeCheck => _agreeCheck;
  set agreeCheck(bool _value) {
    _agreeCheck = _value;
  }

  DateTime? _currentBDate = DateTime.fromMillisecondsSinceEpoch(23648220000);
  DateTime? get currentBDate => _currentBDate;
  set currentBDate(DateTime? _value) {
    _currentBDate = _value;
  }

  LatLng? _mppLocation = LatLng(40.7127753, -74.0059728);
  LatLng? get mppLocation => _mppLocation;
  set mppLocation(LatLng? _value) {
    _mppLocation = _value;
  }

  String _mppAddress = '';
  String get mppAddress => _mppAddress;
  set mppAddress(String _value) {
    _mppAddress = _value;
  }

  int _bioCharCounter = 0;
  int get bioCharCounter => _bioCharCounter;
  set bioCharCounter(int _value) {
    _bioCharCounter = _value;
  }

  String _tmpString = '';
  String get tmpString => _tmpString;
  set tmpString(String _value) {
    _tmpString = _value;
  }

  String _fltrAddress = '';
  String get fltrAddress => _fltrAddress;
  set fltrAddress(String _value) {
    _fltrAddress = _value;
  }

  int _fltrAgeMin = 0;
  int get fltrAgeMin => _fltrAgeMin;
  set fltrAgeMin(int _value) {
    _fltrAgeMin = _value;
  }

  int _fltrAgeMax = 0;
  int get fltrAgeMax => _fltrAgeMax;
  set fltrAgeMax(int _value) {
    _fltrAgeMax = _value;
  }

  int _rangeSliderStart = 0;
  int get rangeSliderStart => _rangeSliderStart;
  set rangeSliderStart(int _value) {
    _rangeSliderStart = _value;
  }

  int _rangeSliderEnd = 0;
  int get rangeSliderEnd => _rangeSliderEnd;
  set rangeSliderEnd(int _value) {
    _rangeSliderEnd = _value;
  }

  bool _showIntroduction = true;
  bool get showIntroduction => _showIntroduction;
  set showIntroduction(bool _value) {
    _showIntroduction = _value;
    prefs.setBool('ff_showIntroduction', _value);
  }

  bool _tmpBool = false;
  bool get tmpBool => _tmpBool;
  set tmpBool(bool _value) {
    _tmpBool = _value;
  }

  int _tmpInteger = 0;
  int get tmpInteger => _tmpInteger;
  set tmpInteger(int _value) {
    _tmpInteger = _value;
  }

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

  void removeAtIndexFromWhoViewedIntro(int _index) {
    _whoViewedIntro.removeAt(_index);
    prefs.setStringList('ff_whoViewedIntro', _whoViewedIntro);
  }

  String _build = '20221118.0140.1';
  String get build => _build;
  set build(String _value) {
    _build = _value;
    prefs.setString('ff_build', _value);
  }

  LatLng? _zeropoint = LatLng(0, 0);
  LatLng? get zeropoint => _zeropoint;
  set zeropoint(LatLng? _value) {
    _zeropoint = _value;
  }

  String _usrAddress = '';
  String get usrAddress => _usrAddress;
  set usrAddress(String _value) {
    _usrAddress = _value;
  }

  List<String> _initPhotoCollection = ['', '', '', '', '', ''];
  List<String> get initPhotoCollection => _initPhotoCollection;
  set initPhotoCollection(List<String> _value) {
    _initPhotoCollection = _value;
  }

  void addToInitPhotoCollection(String _value) {
    _initPhotoCollection.add(_value);
  }

  void removeFromInitPhotoCollection(String _value) {
    _initPhotoCollection.remove(_value);
  }

  void removeAtIndexFromInitPhotoCollection(int _index) {
    _initPhotoCollection.removeAt(_index);
  }

  List<String> _photosCollection = [];
  List<String> get photosCollection => _photosCollection;
  set photosCollection(List<String> _value) {
    _photosCollection = _value;
  }

  void addToPhotosCollection(String _value) {
    _photosCollection.add(_value);
  }

  void removeFromPhotosCollection(String _value) {
    _photosCollection.remove(_value);
  }

  void removeAtIndexFromPhotosCollection(int _index) {
    _photosCollection.removeAt(_index);
  }

  String _tmpIntention = '';
  String get tmpIntention => _tmpIntention;
  set tmpIntention(String _value) {
    _tmpIntention = _value;
  }

  bool _preventIntroduction = false;
  bool get preventIntroduction => _preventIntroduction;
  set preventIntroduction(bool _value) {
    _preventIntroduction = _value;
  }

  bool _blnImageDeleteMode = false;
  bool get blnImageDeleteMode => _blnImageDeleteMode;
  set blnImageDeleteMode(bool _value) {
    _blnImageDeleteMode = _value;
  }

  List<bool> _photosToDelete = [];
  List<bool> get photosToDelete => _photosToDelete;
  set photosToDelete(List<bool> _value) {
    _photosToDelete = _value;
  }

  void addToPhotosToDelete(bool _value) {
    _photosToDelete.add(_value);
  }

  void removeFromPhotosToDelete(bool _value) {
    _photosToDelete.remove(_value);
  }

  void removeAtIndexFromPhotosToDelete(int _index) {
    _photosToDelete.removeAt(_index);
  }

  List<int> _markedElements = [];
  List<int> get markedElements => _markedElements;
  set markedElements(List<int> _value) {
    _markedElements = _value;
  }

  void addToMarkedElements(int _value) {
    _markedElements.add(_value);
  }

  void removeFromMarkedElements(int _value) {
    _markedElements.remove(_value);
  }

  void removeAtIndexFromMarkedElements(int _index) {
    _markedElements.removeAt(_index);
  }

  String _tmpError = '';
  String get tmpError => _tmpError;
  set tmpError(String _value) {
    _tmpError = _value;
  }

  String _lastUploadedURL = '';
  String get lastUploadedURL => _lastUploadedURL;
  set lastUploadedURL(String _value) {
    _lastUploadedURL = _value;
  }

  String _fltrGender = '';
  String get fltrGender => _fltrGender;
  set fltrGender(String _value) {
    _fltrGender = _value;
  }

  List<String> _dislikedUsers = [];
  List<String> get dislikedUsers => _dislikedUsers;
  set dislikedUsers(List<String> _value) {
    _dislikedUsers = _value;
  }

  void addToDislikedUsers(String _value) {
    _dislikedUsers.add(_value);
  }

  void removeFromDislikedUsers(String _value) {
    _dislikedUsers.remove(_value);
  }

  void removeAtIndexFromDislikedUsers(int _index) {
    _dislikedUsers.removeAt(_index);
  }

  String _resetPwdSendState = 'Send';
  String get resetPwdSendState => _resetPwdSendState;
  set resetPwdSendState(String _value) {
    _resetPwdSendState = _value;
  }

  bool _resetLinkAvailability = true;
  bool get resetLinkAvailability => _resetLinkAvailability;
  set resetLinkAvailability(bool _value) {
    _resetLinkAvailability = _value;
  }

  LatLng? _tmpLocation = LatLng(50.4501, 30.5234);
  LatLng? get tmpLocation => _tmpLocation;
  set tmpLocation(LatLng? _value) {
    _tmpLocation = _value;
  }

  bool _isFirstAtHome = true;
  bool get isFirstAtHome => _isFirstAtHome;
  set isFirstAtHome(bool _value) {
    _isFirstAtHome = _value;
  }

  String _selectedPackage = '';
  String get selectedPackage => _selectedPackage;
  set selectedPackage(String _value) {
    _selectedPackage = _value;
  }

  String _entRewindDisliked = 'rewind_disliked';
  String get entRewindDisliked => _entRewindDisliked;
  set entRewindDisliked(String _value) {
    _entRewindDisliked = _value;
  }

  String _entSeeNotiff = 'see_notiff';
  String get entSeeNotiff => _entSeeNotiff;
  set entSeeNotiff(String _value) {
    _entSeeNotiff = _value;
  }

  String _entSeeWhoLikes = 'see_who_likes';
  String get entSeeWhoLikes => _entSeeWhoLikes;
  set entSeeWhoLikes(String _value) {
    _entSeeWhoLikes = _value;
  }

  String _entAdvFilter = 'adv_filter';
  String get entAdvFilter => _entAdvFilter;
  set entAdvFilter(String _value) {
    _entAdvFilter = _value;
  }

  String _entUnlimLikes = 'unlim_likes';
  String get entUnlimLikes => _entUnlimLikes;
  set entUnlimLikes(String _value) {
    _entUnlimLikes = _value;
  }

  String _entPremium = 'premium';
  String get entPremium => _entPremium;
  set entPremium(String _value) {
    _entPremium = _value;
  }

  String _entChatToNotMatched = 'chat_to_not_matched';
  String get entChatToNotMatched => _entChatToNotMatched;
  set entChatToNotMatched(String _value) {
    _entChatToNotMatched = _value;
  }

  String _entResetLocation = 'reset_location';
  String get entResetLocation => _entResetLocation;
  set entResetLocation(String _value) {
    _entResetLocation = _value;
  }

  int _cHomeVisits = 0;
  int get cHomeVisits => _cHomeVisits;
  set cHomeVisits(int _value) {
    _cHomeVisits = _value;
  }

  List<String> _imgCollection = [];
  List<String> get imgCollection => _imgCollection;
  set imgCollection(List<String> _value) {
    _imgCollection = _value;
  }

  void addToImgCollection(String _value) {
    _imgCollection.add(_value);
  }

  void removeFromImgCollection(String _value) {
    _imgCollection.remove(_value);
  }

  void removeAtIndexFromImgCollection(int _index) {
    _imgCollection.removeAt(_index);
  }

  String _chatSearchStr = '';
  String get chatSearchStr => _chatSearchStr;
  set chatSearchStr(String _value) {
    _chatSearchStr = _value;
  }

  List<DocumentReference> _recentChats = [];
  List<DocumentReference> get recentChats => _recentChats;
  set recentChats(List<DocumentReference> _value) {
    _recentChats = _value;
    prefs.setStringList('ff_recentChats', _value.map((x) => x.path).toList());
  }

  void addToRecentChats(DocumentReference _value) {
    _recentChats.add(_value);
    prefs.setStringList(
        'ff_recentChats', _recentChats.map((x) => x.path).toList());
  }

  void removeFromRecentChats(DocumentReference _value) {
    _recentChats.remove(_value);
    prefs.setStringList(
        'ff_recentChats', _recentChats.map((x) => x.path).toList());
  }

  void removeAtIndexFromRecentChats(int _index) {
    _recentChats.removeAt(_index);
    prefs.setStringList(
        'ff_recentChats', _recentChats.map((x) => x.path).toList());
  }

  bool _canResendVerification = false;
  bool get canResendVerification => _canResendVerification;
  set canResendVerification(bool _value) {
    _canResendVerification = _value;
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
