import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  BreakroomFirebaseUser? initialUser;
  BreakroomFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BreakroomFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : WelcomeViewWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : WelcomeViewWidget(),
          routes: [
            FFRoute(
              name: 'SplashScreen',
              path: 'splashScreen',
              requireAuth: true,
              builder: (context, params) => SplashScreenWidget(),
            ),
            FFRoute(
              name: 'PhoneSignIn',
              path: 'phoneSignIn',
              builder: (context, params) => PhoneSignInWidget(),
            ),
            FFRoute(
              name: 'VerifySMS',
              path: 'verifySMS',
              builder: (context, params) => VerifySMSWidget(),
            ),
            FFRoute(
              name: 'ChatView',
              path: 'chatView',
              requireAuth: true,
              builder: (context, params) => ChatViewWidget(),
            ),
            FFRoute(
              name: 'ProfileView',
              path: 'profileView',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'ProfileView')
                  : ProfileViewWidget(),
            ),
            FFRoute(
              name: 'NotificationsView',
              path: 'notificationsView',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'NotificationsView')
                  : NotificationsViewWidget(),
            ),
            FFRoute(
              name: 'SignInView',
              path: 'signInView',
              builder: (context, params) => SignInViewWidget(),
            ),
            FFRoute(
              name: 'HomeView',
              path: 'homeView',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomeView')
                  : HomeViewWidget(),
            ),
            FFRoute(
              name: 'WelcomeView',
              path: 'welcomeView',
              builder: (context, params) => WelcomeViewWidget(),
            ),
            FFRoute(
              name: 'PageTest',
              path: 'pageTest',
              requireAuth: true,
              builder: (context, params) => PageTestWidget(
                swipeAction: params.getParam('swipeAction', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'testCheckBox',
              path: 'testCheckBox',
              requireAuth: true,
              builder: (context, params) => TestCheckBoxWidget(),
            ),
            FFRoute(
              name: 'testAge',
              path: 'testAge',
              requireAuth: true,
              builder: (context, params) => TestAgeWidget(),
            ),
            FFRoute(
              name: 'EndDrawerTest',
              path: 'endDrawerTest',
              requireAuth: true,
              builder: (context, params) => EndDrawerTestWidget(),
            ),
            FFRoute(
              name: 'PageViewTest',
              path: 'pageViewTest',
              requireAuth: true,
              builder: (context, params) => PageViewTestWidget(),
            ),
            FFRoute(
              name: 'ForgotPasswordView',
              path: 'forgotPasswordView',
              requireAuth: true,
              builder: (context, params) => ForgotPasswordViewWidget(),
            ),
            FFRoute(
              name: 'CreateProfileView',
              path: 'createProfileView',
              requireAuth: true,
              builder: (context, params) => CreateProfileViewWidget(),
            ),
            FFRoute(
              name: 'SignUpView',
              path: 'signUpView',
              builder: (context, params) => SignUpViewWidget(
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'HomeDetailsView',
              path: 'homeDetailsView',
              requireAuth: true,
              asyncParams: {
                'userProfile': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => HomeDetailsViewWidget(
                userProfile: params.getParam('userProfile', ParamType.Document),
                mode: params.getParam('mode', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'EditNameView',
              path: 'editNameView',
              requireAuth: true,
              builder: (context, params) => EditNameViewWidget(),
            ),
            FFRoute(
              name: 'EditProfileView',
              path: 'editProfileView',
              requireAuth: true,
              builder: (context, params) => EditProfileViewWidget(),
            ),
            FFRoute(
              name: 'FiltersView',
              path: 'filtersView',
              requireAuth: true,
              builder: (context, params) => FiltersViewWidget(),
            ),
            FFRoute(
              name: 'EditBioView',
              path: 'editBioView',
              requireAuth: true,
              builder: (context, params) => EditBioViewWidget(),
            ),
            FFRoute(
              name: 'GetPremiumView',
              path: 'getPremiumView',
              requireAuth: true,
              builder: (context, params) => GetPremiumViewWidget(),
            ),
            FFRoute(
              name: 'ChooseLocationPage',
              path: 'chooseLocationPage',
              requireAuth: true,
              builder: (context, params) => ChooseLocationPageWidget(
                currentLocation:
                    params.getParam('currentLocation', ParamType.LatLng),
              ),
            ),
            FFRoute(
              name: 'LoginSetNewPasswordView',
              path: 'loginSetNewPasswordView',
              requireAuth: true,
              builder: (context, params) => LoginSetNewPasswordViewWidget(),
            ),
            FFRoute(
              name: 'IntroductionView',
              path: 'introductionView',
              requireAuth: true,
              builder: (context, params) => IntroductionViewWidget(),
            ),
            FFRoute(
              name: 'Chat',
              path: 'chat',
              requireAuth: true,
              asyncParams: {
                'chatUser': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => ChatWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, 'chats'),
              ),
            ),
            FFRoute(
              name: 'AllChats',
              path: 'allChats',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'AllChats')
                  : AllChatsWidget(),
            ),
            FFRoute(
              name: 'InviteUser',
              path: 'inviteUser',
              requireAuth: true,
              builder: (context, params) => InviteUserWidget(),
            ),
            FFRoute(
              name: 'InviteUsers',
              path: 'inviteUsers',
              requireAuth: true,
              builder: (context, params) => InviteUsersWidget(),
            ),
            FFRoute(
              name: 'AddUsersToGroup',
              path: 'addUsersToGroup',
              requireAuth: true,
              asyncParams: {
                'chat': getDoc('chats', ChatsRecord.serializer),
              },
              builder: (context, params) => AddUsersToGroupWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'NewMatchView',
              path: 'newMatchView',
              requireAuth: true,
              builder: (context, params) => NewMatchViewWidget(),
            ),
            FFRoute(
              name: 'MatchesView',
              path: 'matchesView',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MatchesView')
                  : MatchesViewWidget(),
            ),
            FFRoute(
              name: 'GetPremium1View',
              path: 'getPremium1View',
              requireAuth: true,
              builder: (context, params) => GetPremium1ViewWidget(),
            ),
            FFRoute(
              name: 'YouHavePaidView',
              path: 'youHavePaidView',
              requireAuth: true,
              builder: (context, params) => YouHavePaidViewWidget(),
            ),
            FFRoute(
              name: 'AboutUsView',
              path: 'aboutUsView',
              requireAuth: true,
              builder: (context, params) => AboutUsViewWidget(),
            ),
            FFRoute(
              name: 'SettingsView',
              path: 'settingsView',
              requireAuth: true,
              builder: (context, params) => SettingsViewWidget(),
            ),
            FFRoute(
              name: 'LoginDetailsView',
              path: 'loginDetailsView',
              requireAuth: true,
              builder: (context, params) => LoginDetailsViewWidget(),
            ),
            FFRoute(
              name: 'DeleteAccountView',
              path: 'deleteAccountView',
              requireAuth: true,
              builder: (context, params) => DeleteAccountViewWidget(),
            ),
            FFRoute(
              name: 'NotificationSettingsView',
              path: 'notificationSettingsView',
              requireAuth: true,
              builder: (context, params) => NotificationSettingsViewWidget(),
            ),
            FFRoute(
              name: 'PrivacyAndPolicyView',
              path: 'privacyAndPolicyView',
              requireAuth: true,
              builder: (context, params) => PrivacyAndPolicyViewWidget(),
            ),
            FFRoute(
              name: 'EditIndustryView',
              path: 'editIndustryView',
              requireAuth: true,
              builder: (context, params) => EditIndustryViewWidget(),
            ),
            FFRoute(
              name: 'EditOccupationView',
              path: 'editOccupationView',
              requireAuth: true,
              builder: (context, params) => EditOccupationViewWidget(),
            ),
            FFRoute(
              name: 'EditBirthdayView',
              path: 'editBirthdayView',
              requireAuth: true,
              builder: (context, params) => EditBirthdayViewWidget(),
            ),
            FFRoute(
              name: 'EditGenderView',
              path: 'editGenderView',
              requireAuth: true,
              builder: (context, params) => EditGenderViewWidget(),
            ),
            FFRoute(
              name: 'EditGenderPrefsView',
              path: 'editGenderPrefsView',
              requireAuth: true,
              builder: (context, params) => EditGenderPrefsViewWidget(),
            ),
            FFRoute(
              name: 'EditStatusView',
              path: 'editStatusView',
              requireAuth: true,
              builder: (context, params) => EditStatusViewWidget(),
            ),
            FFRoute(
              name: 'EditSmokingPrefsView',
              path: 'editSmokingPrefsView',
              requireAuth: true,
              builder: (context, params) => EditSmokingPrefsViewWidget(),
            ),
            FFRoute(
              name: 'testCheckBoxes',
              path: 'testCheckBoxes',
              requireAuth: true,
              builder: (context, params) => TestCheckBoxesWidget(),
            ),
            FFRoute(
              name: 'EditInterestsView',
              path: 'editInterestsView',
              requireAuth: true,
              builder: (context, params) => EditInterestsViewWidget(),
            ),
            FFRoute(
              name: 'EditBasicsView',
              path: 'editBasicsView',
              requireAuth: true,
              builder: (context, params) => EditBasicsViewWidget(),
            ),
            FFRoute(
              name: 'EditLookingForView',
              path: 'editLookingForView',
              requireAuth: true,
              builder: (context, params) => EditLookingForViewWidget(),
            ),
            FFRoute(
              name: 'EditHeightView',
              path: 'editHeightView',
              requireAuth: true,
              builder: (context, params) => EditHeightViewWidget(),
            ),
            FFRoute(
              name: 'EditDrinkPrefsView',
              path: 'editDrinkPrefsView',
              requireAuth: true,
              builder: (context, params) => EditDrinkPrefsViewWidget(),
            ),
            FFRoute(
              name: 'EditSpiritualStatusView',
              path: 'editSpiritualStatusView',
              requireAuth: true,
              builder: (context, params) => EditSpiritualStatusViewWidget(),
            ),
            FFRoute(
              name: 'EditWorkoutPrefsView',
              path: 'editWorkoutPrefsView',
              requireAuth: true,
              builder: (context, params) => EditWorkoutPrefsViewWidget(),
            ),
            FFRoute(
              name: 'EditChildrenPrefsView',
              path: 'editChildrenPrefsView',
              requireAuth: true,
              builder: (context, params) => EditChildrenPrefsViewWidget(),
            ),
            FFRoute(
              name: 'EditEducationView',
              path: 'editEducationView',
              requireAuth: true,
              builder: (context, params) => EditEducationViewWidget(),
            ),
            FFRoute(
              name: 'EditBodyTypeView',
              path: 'editBodyTypeView',
              requireAuth: true,
              builder: (context, params) => EditBodyTypeViewWidget(),
            ),
            FFRoute(
              name: 'testPlacePicker',
              path: 'testPlacePicker',
              requireAuth: true,
              builder: (context, params) => TestPlacePickerWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    String? collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/welcomeView';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/SplashScreen.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
