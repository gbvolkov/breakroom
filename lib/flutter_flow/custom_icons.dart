import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _myFlutterAppFamily = 'MyFlutterApp';
  static const String _homeScreenIconsFamily = 'HomeScreenIcons';
  static const String _maleFemaleIconsFamily = 'MaleFemaleIcons';
  static const String _introductionIconsFamily = 'IntroductionIcons';
  static const String _breakroomHeartsFamily = 'BreakroomHearts';

  // MyFlutterApp
  static const IconData kicSettings =
      IconData(0xe800, fontFamily: _myFlutterAppFamily);

  // HomeScreenIcons
  static const IconData kicUser =
      IconData(0xe800, fontFamily: _homeScreenIconsFamily);
  static const IconData kicChat =
      IconData(0xe801, fontFamily: _homeScreenIconsFamily);
  static const IconData kicHeart =
      IconData(0xe802, fontFamily: _homeScreenIconsFamily);
  static const IconData kicHome =
      IconData(0xe803, fontFamily: _homeScreenIconsFamily);
  static const IconData kicNotifications =
      IconData(0xe804, fontFamily: _homeScreenIconsFamily);

  // MaleFemaleIcons
  static const IconData kfemale =
      IconData(0xe800, fontFamily: _maleFemaleIconsFamily);
  static const IconData kmale =
      IconData(0xe801, fontFamily: _maleFemaleIconsFamily);

  // IntroductionIcons
  static const IconData kswipeLeft =
      IconData(0xe801, fontFamily: _introductionIconsFamily);
  static const IconData kswipeRight =
      IconData(0xe802, fontFamily: _introductionIconsFamily);
  static const IconData kswipeUp =
      IconData(0xe803, fontFamily: _introductionIconsFamily);
  static const IconData kicDislike =
      IconData(0xe804, fontFamily: _introductionIconsFamily);
  static const IconData kicLike =
      IconData(0xe805, fontFamily: _introductionIconsFamily);

  // breakroom-hearts
  static const IconData kheartsIcons =
      IconData(0xe900, fontFamily: _breakroomHeartsFamily);
}
