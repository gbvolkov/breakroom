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
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
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

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'SplashScreen': (data) async => SplashScreenWidget(),
  'PhoneSignIn': (data) async => PhoneSignInWidget(),
  'VerifySMS': (data) async => VerifySMSWidget(),
  'ChatView': (data) async => ChatViewWidget(),
  'ProfileView': (data) async => NavBarPage(initialPage: 'ProfileView'),
  'NotificationsView': (data) async =>
      NavBarPage(initialPage: 'NotificationsView'),
  'SignInView': (data) async => SignInViewWidget(),
  'WelcomeView': (data) async => WelcomeViewWidget(),
  'PageTest': (data) async => PageTestWidget(
        swipeAction: getParameter(data, 'swipeAction'),
      ),
  'testCheckBox': (data) async => TestCheckBoxWidget(),
  'testAge': (data) async => TestAgeWidget(),
  'EndDrawerTest': (data) async => EndDrawerTestWidget(),
  'PageViewTest': (data) async => PageViewTestWidget(),
  'ForgotPasswordView': (data) async => ForgotPasswordViewWidget(),
  'CreateProfileView': (data) async => CreateProfileViewWidget(),
  'SignUpView': (data) async => SignUpViewWidget(
        email: getParameter(data, 'email'),
      ),
  'HomeDetailsView': (data) async => HomeDetailsViewWidget(
        userProfile: await getDocumentParameter(
            data, 'userProfile', UsersRecord.serializer),
        mode: getParameter(data, 'mode'),
      ),
  'EditNameView': (data) async => EditNameViewWidget(),
  'EditProfileView': (data) async => EditProfileViewWidget(),
  'FiltersView': (data) async => FiltersViewWidget(),
  'EditBioView': (data) async => EditBioViewWidget(),
  'GetPremiumView': (data) async => GetPremiumViewWidget(),
  'ChooseLocationPage': (data) async => ChooseLocationPageWidget(
        currentLocation: getParameter(data, 'currentLocation'),
      ),
  'LoginSetNewPasswordView': (data) async => LoginSetNewPasswordViewWidget(),
  'IntroductionView': (data) async => IntroductionViewWidget(),
  'Chat': (data) async => ChatWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'AllChats': (data) async => NavBarPage(initialPage: 'AllChats'),
  'InviteUser': (data) async => InviteUserWidget(),
  'InviteUsers': (data) async => InviteUsersWidget(),
  'AddUsersToGroup': (data) async => AddUsersToGroupWidget(
        chat: await getDocumentParameter(data, 'chat', ChatsRecord.serializer),
      ),
  'NewMatchView': (data) async => NewMatchViewWidget(),
  'MatchesView': (data) async => NavBarPage(initialPage: 'MatchesView'),
  'GetPremium1View': (data) async => GetPremium1ViewWidget(),
  'YouHavePaidView': (data) async => YouHavePaidViewWidget(),
  'AboutUsView': (data) async => AboutUsViewWidget(),
  'SettingsView': (data) async => SettingsViewWidget(),
  'LoginDetailsView': (data) async => LoginDetailsViewWidget(),
  'NotificationSettingsView': (data) async => NotificationSettingsViewWidget(),
  'PrivacyAndPolicyView': (data) async => PrivacyAndPolicyViewWidget(),
  'EditIndustryView': (data) async => EditIndustryViewWidget(),
  'EditOccupationView': (data) async => EditOccupationViewWidget(),
  'EditBirthdayView': (data) async => EditBirthdayViewWidget(),
  'EditGenderView': (data) async => EditGenderViewWidget(),
  'EditGenderPrefsView': (data) async => EditGenderPrefsViewWidget(),
  'EditStatusView': (data) async => EditStatusViewWidget(),
  'EditSmokingPrefsView': (data) async => EditSmokingPrefsViewWidget(),
  'testCheckBoxes': (data) async => TestCheckBoxesWidget(),
  'EditInterestsView': (data) async => EditInterestsViewWidget(),
  'EditBasicsView': (data) async => EditBasicsViewWidget(),
  'EditLookingForView': (data) async => EditLookingForViewWidget(),
  'EditHeightView': (data) async => EditHeightViewWidget(),
  'EditDrinkPrefsView': (data) async => EditDrinkPrefsViewWidget(),
  'EditSpiritualStatusView': (data) async => EditSpiritualStatusViewWidget(),
  'EditWorkoutPrefsView': (data) async => EditWorkoutPrefsViewWidget(),
  'EditChildrenPrefsView': (data) async => EditChildrenPrefsViewWidget(),
  'EditEducationView': (data) async => EditEducationViewWidget(),
  'EditBodyTypeView': (data) async => EditBodyTypeViewWidget(),
  'testPlacePicker': (data) async => TestPlacePickerWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

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
