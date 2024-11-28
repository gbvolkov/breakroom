import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/SplashScreen.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'SplashScreen': ParameterData.none(),
  'PhoneSignIn': ParameterData.none(),
  'VerifySMS': ParameterData.none(),
  'ChatView': ParameterData.none(),
  'PhotoExpandView': (data) async => ParameterData(
        allParams: {
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.serializer),
          'photoidx': getParameter<int>(data, 'photoidx'),
        },
      ),
  'ProfileView': ParameterData.none(),
  'SignInView': ParameterData.none(),
  'NotificationsView': ParameterData.none(),
  'WelcomeView': ParameterData.none(),
  'PageTest': (data) async => ParameterData(
        allParams: {
          'swipeAction': getParameter<String>(data, 'swipeAction'),
        },
      ),
  'testCheckBox': ParameterData.none(),
  'testAge': ParameterData.none(),
  'EndDrawerTest': ParameterData.none(),
  'PageViewTest': ParameterData.none(),
  'ForgotPasswordView': ParameterData.none(),
  'CreateProfileView': ParameterData.none(),
  'SignUpView': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'VerifyEmailView': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'HomeDetailsView': (data) async => ParameterData(
        allParams: {
          'userProfile': await getDocumentParameter<UsersRecord>(
              data, 'userProfile', UsersRecord.serializer),
          'mode': getParameter<String>(data, 'mode'),
          'backPage': getParameter<String>(data, 'backPage'),
        },
      ),
  'HomeView': ParameterData.none(),
  'EditNameView': ParameterData.none(),
  'EditProfileView': ParameterData.none(),
  'EditBioView': ParameterData.none(),
  'FiltersView': (data) async => ParameterData(
        allParams: {
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.serializer),
        },
      ),
  'FilterIndustriesView': (data) async => ParameterData(
        allParams: {},
      ),
  'ChooseLocationPage': (data) async => ParameterData(
        allParams: {
          'currentLocation': getParameter<LatLng>(data, 'currentLocation'),
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.serializer),
        },
      ),
  'LoginSetNewPasswordView': ParameterData.none(),
  'IntroductionView': ParameterData.none(),
  'Chat': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UsersRecord>(
              data, 'chatUser', UsersRecord.serializer),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
          'route': getParameter<String>(data, 'route'),
        },
      ),
  'AllChats': ParameterData.none(),
  'InviteUser': ParameterData.none(),
  'InviteUsers': ParameterData.none(),
  'AddUsersToGroup': (data) async => ParameterData(
        allParams: {
          'chat': await getDocumentParameter<ChatsRecord>(
              data, 'chat', ChatsRecord.serializer),
        },
      ),
  'NewMatchView': (data) async => ParameterData(
        allParams: {
          'me': await getDocumentParameter<UsersRecord>(
              data, 'me', UsersRecord.serializer),
          'match': await getDocumentParameter<UsersRecord>(
              data, 'match', UsersRecord.serializer),
        },
      ),
  'MatchesView': ParameterData.none(),
  'GetPremiumView': (data) async => ParameterData(
        allParams: {
          'user': await getDocumentParameter<UsersRecord>(
              data, 'user', UsersRecord.serializer),
          'back': getParameter<String>(data, 'back'),
        },
      ),
  'YouHavePaidView': ParameterData.none(),
  'AboutUsView': ParameterData.none(),
  'SettingsView': ParameterData.none(),
  'LoginDetailsView': ParameterData.none(),
  'NotificationSettingsView': ParameterData.none(),
  'PrivacyAndPolicyView': ParameterData.none(),
  'EditIndustryView': ParameterData.none(),
  'EditOccupationView': ParameterData.none(),
  'EditBirthdayView': ParameterData.none(),
  'EditGenderView': ParameterData.none(),
  'EditGenderPrefsView': ParameterData.none(),
  'EditStatusView': ParameterData.none(),
  'EditSmokingPrefsView': ParameterData.none(),
  'testAnythingYouWant': ParameterData.none(),
  'EditInterestsView': ParameterData.none(),
  'EditBasicsView': ParameterData.none(),
  'EditLookingForView': ParameterData.none(),
  'EditHeightView': ParameterData.none(),
  'EditDrinkPrefsView': ParameterData.none(),
  'EditSpiritualStatusView': ParameterData.none(),
  'EditWorkoutPrefsView': ParameterData.none(),
  'EditChildrenPrefsView': ParameterData.none(),
  'EditEducationView': ParameterData.none(),
  'EditBodyTypeView': ParameterData.none(),
  'testPlacePicker': ParameterData.none(),
  'CommunityGuidlinesView': ParameterData.none(),
  'UploadPhotosView': (data) async => ParameterData(
        allParams: {},
      ),
  'UploadPhotosViewCopy': (data) async => ParameterData(
        allParams: {},
      ),
  'SetYourLocationView': ParameterData.none(),
  'testCheckBoxCopy': ParameterData.none(),
  'testNewHome': ParameterData.none(),
  'ChangeEmailView': ParameterData.none(),
  'ChangePasswordView': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
