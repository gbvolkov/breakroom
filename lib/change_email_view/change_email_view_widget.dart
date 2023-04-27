import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_email_view_model.dart';
export 'change_email_view_model.dart';

class ChangeEmailViewWidget extends StatefulWidget {
  const ChangeEmailViewWidget({Key? key}) : super(key: key);

  @override
  _ChangeEmailViewWidgetState createState() => _ChangeEmailViewWidgetState();
}

class _ChangeEmailViewWidgetState extends State<ChangeEmailViewWidget> {
  late ChangeEmailViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeEmailViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().tmpError = '';
      });
      setState(() {
        _model.emailTextFieldController?.clear();
        _model.passwordTextFieldController?.clear();
      });
    });

    _model.emailTextFieldController ??= TextEditingController();
    _model.passwordTextFieldController ??= TextEditingController();
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
              color: FlutterFlowTheme.of(context).alternate,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Login details',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 64.0),
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
                            0.0, 32.0, 0.0, 16.0),
                        child: Text(
                          'Enter new email and your current password',
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
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
                          labelText: 'new email',
                          labelStyle: FlutterFlowTheme.of(context).titleSmall,
                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFEFEFEF),
                          suffixIcon: _model
                                  .emailTextFieldController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.emailTextFieldController?.clear();
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
                        style: FlutterFlowTheme.of(context).titleMedium,
                        keyboardType: TextInputType.emailAddress,
                        validator: _model.emailTextFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: TextFormField(
                        controller: _model.passwordTextFieldController,
                        autofocus: true,
                        obscureText: !_model.passwordTextFieldVisibility,
                        decoration: InputDecoration(
                          labelText: 'current password',
                          labelStyle: FlutterFlowTheme.of(context).titleSmall,
                          hintStyle: FlutterFlowTheme.of(context).bodySmall,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: Color(0xFFEFEFEF),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model.passwordTextFieldVisibility =
                                  !_model.passwordTextFieldVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.passwordTextFieldVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFF757575),
                              size: 22.0,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).titleMedium,
                        keyboardType: TextInputType.visiblePassword,
                        validator: _model.passwordTextFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    if (FFAppState().tmpError != '')
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 16.0),
                          child: Text(
                            FFAppState().tmpError,
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Roboto',
                                  color:
                                      FlutterFlowTheme.of(context).systemError,
                                ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'We will send a confirmation link to this  Email',
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
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
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            FFAppState().update(() {
                              FFAppState().tmpError = '';
                            });
                            if (currentUserEmail ==
                                _model.emailTextFieldController.text) {
                              FFAppState().update(() {
                                FFAppState().tmpError =
                                    'New email shouldn\'t be equal to old email';
                              });
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                            if (!functions.isEmailValid(
                                _model.emailTextFieldController.text)) {
                              FFAppState().update(() {
                                FFAppState().tmpError =
                                    'Please specify a valid email';
                              });
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                            _model.reauthUserResult = await actions.reauthUser(
                              currentUserEmail,
                              _model.passwordTextFieldController.text,
                              _model.emailTextFieldController.text,
                            );
                            _shouldSetState = true;
                            if (!(_model.reauthUserResult == null ||
                                _model.reauthUserResult == '')) {
                              FFAppState().update(() {
                                FFAppState().tmpError =
                                    'Password validation failed';
                              });
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                            _model.isOK = await actions.resetUserEmail(
                              currentUserEmail,
                              _model.passwordTextFieldController.text,
                              _model.emailTextFieldController.text,
                            );
                            _shouldSetState = true;
                            if (_model.isOK!) {
                              final usersUpdateData = createUsersRecordData(
                                email: _model.emailTextFieldController.text,
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
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).noColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
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
