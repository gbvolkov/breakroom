import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeEmailViewWidget extends StatefulWidget {
  const ChangeEmailViewWidget({Key? key}) : super(key: key);

  @override
  _ChangeEmailViewWidgetState createState() => _ChangeEmailViewWidgetState();
}

class _ChangeEmailViewWidgetState extends State<ChangeEmailViewWidget> {
  String? reauthUserResult;
  bool? isOK;
  TextEditingController? emailTextFieldController;
  TextEditingController? passwordTextFieldController;

  late bool passwordTextFieldVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().tmpError = '');
      setState(() {
        emailTextFieldController?.clear();
        passwordTextFieldController?.clear();
      });
    });

    emailTextFieldController = TextEditingController();
    passwordTextFieldController = TextEditingController();
    passwordTextFieldVisibility = false;
  }

  @override
  void dispose() {
    emailTextFieldController?.dispose();
    passwordTextFieldController?.dispose();
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
            color: FlutterFlowTheme.of(context).alternate,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Login details',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 64),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 16),
                        child: Text(
                          'Enter new email and your current password',
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
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
                          labelText: 'new email',
                          labelStyle: FlutterFlowTheme.of(context).subtitle2,
                          hintStyle: FlutterFlowTheme.of(context).bodyText2,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: Color(0xFFEFEFEF),
                          suffixIcon: emailTextFieldController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    emailTextFieldController?.clear();
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
                        style: FlutterFlowTheme.of(context).subtitle1,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: TextFormField(
                        controller: passwordTextFieldController,
                        autofocus: true,
                        obscureText: !passwordTextFieldVisibility,
                        decoration: InputDecoration(
                          labelText: 'current password',
                          labelStyle: FlutterFlowTheme.of(context).subtitle2,
                          hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                          fillColor: Color(0xFFEFEFEF),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordTextFieldVisibility =
                                  !passwordTextFieldVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              passwordTextFieldVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFF757575),
                              size: 22,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).subtitle1,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    if (FFAppState().tmpError != '')
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 16),
                          child: Text(
                            FFAppState().tmpError,
                            style: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).systemError,
                                ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Text(
                        'We will send a confirmation link to this  Email',
                        style: FlutterFlowTheme.of(context).bodyText2,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            setState(() => FFAppState().tmpError = '');
                            if (currentUserEmail ==
                                emailTextFieldController!.text) {
                              setState(() => FFAppState().tmpError =
                                  'New email shouldn\'t be equal to old email');
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                            if (!functions
                                .isEmailValid(emailTextFieldController!.text)) {
                              setState(() => FFAppState().tmpError =
                                  'Please specify a valid email');
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                            reauthUserResult = await actions.reauthUser(
                              currentUserEmail,
                              passwordTextFieldController!.text,
                              emailTextFieldController!.text,
                            );
                            _shouldSetState = true;
                            if (!(reauthUserResult == null ||
                                reauthUserResult == '')) {
                              setState(() => FFAppState().tmpError =
                                  'Password validation failed');
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                            isOK = await actions.resetUserEmail(
                              currentUserEmail,
                              passwordTextFieldController!.text,
                              emailTextFieldController!.text,
                            );
                            _shouldSetState = true;
                            if (isOK!) {
                              final usersUpdateData = createUsersRecordData(
                                email: emailTextFieldController!.text,
                              );
                              await currentUserReference!
                                  .update(usersUpdateData);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Your email has been changed succesfully',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0x00000000),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'An error happened while changing an email',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                ),
                              );
                            }

                            context.goNamed('LoginDetailsView');

                            if (_shouldSetState) setState(() {});
                          },
                          text: 'Change your Email',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48,
                            color: FlutterFlowTheme.of(context).noColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle1
                                .override(
                                  fontFamily: 'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                            elevation: 0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
