import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _myFlutterAppFamily = 'MyFlutterApp';
  static const String _homeScreenIconsFamily = 'HomeScreenIcons';
  static const String _maleFemaleIconsFamily = 'MaleFemaleIcons';

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
}
