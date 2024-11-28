import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dialog_signup_complete_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_view_model.dart';
export 'sign_up_view_model.dart';

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
  late SignUpViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;
  int get signUpPageViewCurrentIndex =>
      _model.signUpPageViewController != null &&
              _model.signUpPageViewController!.hasClients &&
              _model.signUpPageViewController!.page != null
          ? _model.signUpPageViewController!.page!.round()
          : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpViewModel());

    _model.emailTextFieldController ??= TextEditingController();
    _model.passwordTextFieldController ??= TextEditingController();
    _model.confirmPasswordTextFieldController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              if (signUpPageViewCurrentIndex == 0) {
                context.pushNamed('WelcomeView');
              } else {
                await _model.signUpPageViewController?.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _model.signUpPageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 64.0),
                                    child: Text(
                                      'What is your \nEmail address?',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      'Email',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: TextFormField(
                                    controller: _model.emailTextFieldController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.emailTextFieldController',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF8F8F9),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 0.0, 16.0, 0.0),
                                      suffixIcon: _model
                                              .emailTextFieldController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.emailTextFieldController
                                                    ?.clear();
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Color(0xFF757575),
                                                size: 22.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: _model
                                        .emailTextFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (FFAppState().agreeCheck)
                                        FlutterFlowIconButton(
                                          borderRadius: 90.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.check_box_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            FFAppState().update(() {
                                              FFAppState().agreeCheck = false;
                                            });
                                          },
                                        ),
                                      if (!FFAppState().agreeCheck)
                                        FlutterFlowIconButton(
                                          borderRadius: 30.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.check_box_outline_blank,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            FFAppState().update(() {
                                              FFAppState().agreeCheck = true;
                                            });
                                          },
                                        ),
                                      Text(
                                        'I agree with ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              'PrivacyAndPolicyView');
                                        },
                                        child: Text(
                                          'Privacy and Policy',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
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
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFEE837B),
                                              Color(0xFFF95A82),
                                              Color(0xFFEA3C7D)
                                            ],
                                            stops: [0.0, 0.6, 1.0],
                                            begin:
                                                AlignmentDirectional(0.0, -1.0),
                                            end: AlignmentDirectional(0, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (functions.isEmailValid(_model
                                                .emailTextFieldController
                                                .text)) {
                                              if (FFAppState().agreeCheck) {
                                                setState(() {
                                                  _model
                                                      .passwordTextFieldController
                                                      ?.clear();
                                                  _model
                                                      .confirmPasswordTextFieldController
                                                      ?.clear();
                                                });
                                                FFAppState().update(() {
                                                  FFAppState().tmpBool = false;
                                                });
                                                await _model
                                                    .signUpPageViewController
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
                                            height: 48.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .noColor,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                                      0.0, 0.0, 0.0, 32.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Already have an account?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
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
                                          width: 65.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 48.0),
                                    child: Text(
                                      'Well, let\'s think \nof a password',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 32.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      'Password',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: TextFormField(
                                    controller:
                                        _model.passwordTextFieldController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.passwordTextFieldController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        if ((_model.passwordTextFieldController
                                                        .text !=
                                                    null &&
                                                _model.passwordTextFieldController
                                                        .text !=
                                                    '') &&
                                            (_model.confirmPasswordTextFieldController
                                                        .text !=
                                                    null &&
                                                _model.confirmPasswordTextFieldController
                                                        .text !=
                                                    '') &&
                                            (_model.passwordTextFieldController
                                                    .text ==
                                                _model
                                                    .confirmPasswordTextFieldController
                                                    .text)) {
                                          FFAppState().update(() {
                                            FFAppState().tmpBool = true;
                                          });
                                        } else {
                                          FFAppState().update(() {
                                            FFAppState().tmpBool = false;
                                          });
                                        }
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText:
                                        !_model.passwordTextFieldVisibility,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .textFieldBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 0.0, 16.0, 0.0),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => _model
                                                  .passwordTextFieldVisibility =
                                              !_model
                                                  .passwordTextFieldVisibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.passwordTextFieldVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: _model
                                        .passwordTextFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      'Repeat Password',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: TextFormField(
                                    controller: _model
                                        .confirmPasswordTextFieldController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.confirmPasswordTextFieldController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        if ((_model.passwordTextFieldController
                                                        .text !=
                                                    null &&
                                                _model.passwordTextFieldController
                                                        .text !=
                                                    '') &&
                                            (_model.confirmPasswordTextFieldController
                                                        .text !=
                                                    null &&
                                                _model.confirmPasswordTextFieldController
                                                        .text !=
                                                    '') &&
                                            (_model.passwordTextFieldController
                                                    .text ==
                                                _model
                                                    .confirmPasswordTextFieldController
                                                    .text)) {
                                          FFAppState().update(() {
                                            FFAppState().tmpBool = true;
                                          });
                                        } else {
                                          FFAppState().update(() {
                                            FFAppState().tmpBool = false;
                                          });
                                        }
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText: !_model
                                        .confirmPasswordTextFieldVisibility,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .textFieldBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 0.0, 16.0, 0.0),
                                      suffixIcon: InkWell(
                                        onTap: () => setState(
                                          () => _model
                                                  .confirmPasswordTextFieldVisibility =
                                              !_model
                                                  .confirmPasswordTextFieldVisibility,
                                        ),
                                        focusNode:
                                            FocusNode(skipTraversal: true),
                                        child: Icon(
                                          _model.confirmPasswordTextFieldVisibility
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color: Color(0xFF757575),
                                          size: 22.0,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: _model
                                        .confirmPasswordTextFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 32.0),
                              child: Stack(
                                children: [
                                  if (!FFAppState().tmpBool)
                                    Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5E5E5),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: SelectionArea(
                                            child: Text(
                                          'Create account',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium,
                                        )),
                                      ),
                                    ),
                                  if (FFAppState().tmpBool)
                                    Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFEE837B),
                                            Color(0xFFF95A82),
                                            Color(0xFFEA3C7D)
                                          ],
                                          stops: [0.0, 0.6, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  if (FFAppState().tmpBool)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          currentUserLocationValue =
                                              await getCurrentUserLocation(
                                                  defaultLocation:
                                                      LatLng(0.0, 0.0));
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          if (_model.passwordTextFieldController
                                                  .text !=
                                              _model
                                                  .confirmPasswordTextFieldController
                                                  .text) {
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

                                          final user = await authManager
                                              .createAccountWithEmail(
                                            context,
                                            _model
                                                .emailTextFieldController.text,
                                            _model.passwordTextFieldController
                                                .text,
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
                                              gender: 'Everyone',
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            isComplete: false,
                                          );
                                          await UsersRecord.collection
                                              .doc(user.uid)
                                              .update(usersCreateData);

                                          await authManager
                                              .sendEmailVerification();
                                          if (currentUserEmailVerified) {
                                            await actions
                                                .initializeUserDataState(
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
                                                  currentUserDocument
                                                      ?.education,
                                                  ''),
                                              valueOrDefault(
                                                  currentUserDocument?.gender,
                                                  ''),
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.genderPreference,
                                                  ''),
                                              valueOrDefault(
                                                  currentUserDocument?.height,
                                                  0),
                                              valueOrDefault(
                                                  currentUserDocument?.weight,
                                                  0),
                                              valueOrDefault(
                                                  currentUserDocument
                                                      ?.intention,
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
                                                  currentUserDocument
                                                      ?.firstName,
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
                                                  currentUserDocument
                                                      ?.occupation,
                                                  ''),
                                              (currentUserDocument?.interests
                                                          ?.toList() ??
                                                      [])
                                                  .toList(),
                                            );
                                            FFAppState().update(() {
                                              FFAppState().cHomeVisits = 0;
                                            });
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Color(0x00000000),
                                              context: context,
                                              builder: (bottomSheetContext) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              _unfocusNode),
                                                  child: Padding(
                                                    padding: MediaQuery.of(
                                                            bottomSheetContext)
                                                        .viewInsets,
                                                    child:
                                                        DialogSignupCompleteWidget(),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));

                                            FFAppState().update(() {
                                              FFAppState().preventIntroduction =
                                                  true;
                                            });

                                            context.goNamedAuth(
                                                'CreateProfileView', mounted);
                                          } else {
                                            context.pushNamedAuth(
                                              'VerifyEmailView',
                                              mounted,
                                              queryParams: {
                                                'email': serializeParam(
                                                  currentUserEmail,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        },
                                        text: 'Create account',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
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
