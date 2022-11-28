import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/dialog_signup_complete_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpViewWidget extends StatefulWidget {
  const SignUpViewWidget({
    Key? key,
    this.email,
  }) : super(key: key);

  final String? email;

  @override
  _SignUpViewWidgetState createState() => _SignUpViewWidgetState();
}

class _SignUpViewWidgetState extends State<SignUpViewWidget> {
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PageController? signUpPageViewController;
  TextEditingController? emailTextFieldController;
  TextEditingController? confirmPasswordTextFieldController;

  late bool confirmPasswordTextFieldVisibility;
  TextEditingController? passwordTextFieldController;

  late bool passwordTextFieldVisibility;

  @override
  void initState() {
    super.initState();
    confirmPasswordTextFieldController = TextEditingController();
    confirmPasswordTextFieldVisibility = false;
    passwordTextFieldController = TextEditingController();
    passwordTextFieldVisibility = false;
    emailTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    confirmPasswordTextFieldController?.dispose();
    passwordTextFieldController?.dispose();
    emailTextFieldController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            if ((signUpPageViewController?.page?.round() ?? 0) == 0) {
              context.pushNamed('WelcomeView');
            } else {
              await signUpPageViewController?.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          },
        ),
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: signUpPageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 64),
                                    child: Text(
                                      'What is your \nEmail address?',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'Email',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: TextFormField(
                                    controller: emailTextFieldController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'emailTextFieldController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF8F8F9),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 0, 16, 0),
                                      suffixIcon: emailTextFieldController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                emailTextFieldController
                                                    ?.clear();
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Color(0xFF757575),
                                                size: 22,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (FFAppState().agreeCheck)
                                        FlutterFlowIconButton(
                                          borderRadius: 90,
                                          buttonSize: 40,
                                          icon: Icon(
                                            Icons.check_box_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 24,
                                          ),
                                          onPressed: () async {
                                            setState(() => FFAppState()
                                                .agreeCheck = false);
                                          },
                                        ),
                                      if (!FFAppState().agreeCheck)
                                        FlutterFlowIconButton(
                                          borderRadius: 30,
                                          buttonSize: 40,
                                          icon: Icon(
                                            Icons.check_box_outline_blank,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24,
                                          ),
                                          onPressed: () async {
                                            setState(() =>
                                                FFAppState().agreeCheck = true);
                                          },
                                        ),
                                      Text(
                                        'I agree with ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          context.pushNamed(
                                              'PrivacyAndPolicyView');
                                        },
                                        child: Text(
                                          'Privacy and Policy',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFEE837B),
                                              Color(0xFFF95A82),
                                              Color(0xFFEA3C7D)
                                            ],
                                            stops: [0, 0.6, 1],
                                            begin: AlignmentDirectional(0, -1),
                                            end: AlignmentDirectional(0, 1),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (functions.isEmailValid(
                                                emailTextFieldController!
                                                    .text)) {
                                              if (FFAppState().agreeCheck) {
                                                setState(() {
                                                  passwordTextFieldController
                                                      ?.clear();
                                                  confirmPasswordTextFieldController
                                                      ?.clear();
                                                });
                                                setState(() => FFAppState()
                                                    .tmpBool = false);
                                                await signUpPageViewController
                                                    ?.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Privacy and Policy'),
                                                      content: Text(
                                                          'Please accept Privacy and Policy'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Email error'),
                                                    content: Text(
                                                        'Please specify correct email'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          text: 'Next',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48,
                                            color: FlutterFlowTheme.of(context)
                                                .noColor,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .subtitle1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Already have an account?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed('SignInView');
                                        },
                                        text: 'Log in',
                                        options: FFButtonOptions(
                                          width: 65,
                                          height: 40,
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 48),
                                    child: Text(
                                      'Well, let\'s think \nof a password',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 32,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'Password',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: TextFormField(
                                    controller: passwordTextFieldController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'passwordTextFieldController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        if ((passwordTextFieldController!
                                                        .text !=
                                                    null &&
                                                passwordTextFieldController!
                                                        .text !=
                                                    '') &&
                                            (confirmPasswordTextFieldController!
                                                        .text !=
                                                    null &&
                                                confirmPasswordTextFieldController!
                                                        .text !=
                                                    '') &&
                                            (passwordTextFieldController!
                                                    .text ==
                                                confirmPasswordTextFieldController!
                                                    .text)) {
                                          setState(() =>
                                              FFAppState().tmpBool = true);
                                        } else {
                                          setState(() =>
                                              FFAppState().tmpBool = false);
                                        }
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText: !passwordTextFieldVisibility,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .textFieldBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 0, 16, 0),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => passwordTextFieldVisibility =
                                              !passwordTextFieldVisibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          passwordTextFieldVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'Repeat Password',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: TextFormField(
                                    controller:
                                        confirmPasswordTextFieldController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'confirmPasswordTextFieldController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        if ((passwordTextFieldController!
                                                        .text !=
                                                    null &&
                                                passwordTextFieldController!
                                                        .text !=
                                                    '') &&
                                            (confirmPasswordTextFieldController!
                                                        .text !=
                                                    null &&
                                                confirmPasswordTextFieldController!
                                                        .text !=
                                                    '') &&
                                            (passwordTextFieldController!
                                                    .text ==
                                                confirmPasswordTextFieldController!
                                                    .text)) {
                                          setState(() =>
                                              FFAppState().tmpBool = true);
                                        } else {
                                          setState(() =>
                                              FFAppState().tmpBool = false);
                                        }
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText:
                                        !confirmPasswordTextFieldVisibility,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .textFieldBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 0, 16, 0),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => confirmPasswordTextFieldVisibility =
                                              !confirmPasswordTextFieldVisibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          confirmPasswordTextFieldVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0xFF757575),
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).subtitle1,
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 32),
                              child: Stack(
                                children: [
                                  if (!FFAppState().tmpBool)
                                    Container(
                                      width: double.infinity,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5E5E5),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: SelectionArea(
                                            child: Text(
                                          'Create account',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1,
                                        )),
                                      ),
                                    ),
                                  if (FFAppState().tmpBool)
                                    Container(
                                      width: double.infinity,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFEE837B),
                                            Color(0xFFF95A82),
                                            Color(0xFFEA3C7D)
                                          ],
                                          stops: [0, 0.6, 1],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  if (FFAppState().tmpBool)
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          currentUserLocationValue =
                                              await getCurrentUserLocation(
                                                  defaultLocation:
                                                      LatLng(0.0, 0.0));
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          if (passwordTextFieldController
                                                  ?.text !=
                                              confirmPasswordTextFieldController
                                                  ?.text) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Passwords don\'t match!',
                                                ),
                                              ),
                                            );
                                            return;
                                          }

                                          final user =
                                              await createAccountWithEmail(
                                            context,
                                            emailTextFieldController!.text,
                                            passwordTextFieldController!.text,
                                          );
                                          if (user == null) {
                                            return;
                                          }

                                          final usersCreateData =
                                              createUsersRecordData(
                                            geoposition:
                                                currentUserLocationValue,
                                            filter: createFilterStruct(
                                              ageRangeExt: false,
                                              distance: 50.0,
                                              ageRange: createIntRangeStruct(
                                                min: 18,
                                                max: 100,
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            isComplete: false,
                                          );
                                          await UsersRecord.collection
                                              .doc(user.uid)
                                              .update(usersCreateData);

                                          await sendEmailVerification();
                                          await actions.initializeUserDataState(
                                            valueOrDefault(
                                                currentUserDocument?.bodyType,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument
                                                    ?.childfreeStatus,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument
                                                    ?.drinkingStatus,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument?.education,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument?.gender,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument
                                                    ?.genderPreference,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument?.height, 0),
                                            valueOrDefault(
                                                currentUserDocument?.weight, 0),
                                            valueOrDefault(
                                                currentUserDocument?.intention,
                                                ''),
                                            (currentUserDocument?.lookingFor
                                                        ?.toList() ??
                                                    [])
                                                .toList(),
                                            valueOrDefault(
                                                currentUserDocument?.religion,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument
                                                    ?.smokingStatus,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument
                                                    ?.spiritualStatus,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument
                                                    ?.workoutStatus,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument?.firstName,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument?.lastName,
                                                ''),
                                            currentUserDocument!.birthDay,
                                            valueOrDefault(
                                                currentUserDocument?.bio, ''),
                                            valueOrDefault(
                                                currentUserDocument?.industry,
                                                ''),
                                            valueOrDefault(
                                                currentUserDocument?.occupation,
                                                ''),
                                            (currentUserDocument?.interests
                                                        ?.toList() ??
                                                    [])
                                                .toList(),
                                          );
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child:
                                                    DialogSignupCompleteWidget(),
                                              );
                                            },
                                          ).then((value) => setState(() {}));

                                          setState(() => FFAppState()
                                              .preventIntroduction = true);

                                          context.goNamedAuth(
                                              'CreateProfileView', mounted);
                                        },
                                        text: 'Create account',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48,
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
