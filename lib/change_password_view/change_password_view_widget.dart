import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_password_view_model.dart';
export 'change_password_view_model.dart';

class ChangePasswordViewWidget extends StatefulWidget {
  const ChangePasswordViewWidget({Key? key}) : super(key: key);

  @override
  _ChangePasswordViewWidgetState createState() =>
      _ChangePasswordViewWidgetState();
}

class _ChangePasswordViewWidgetState extends State<ChangePasswordViewWidget> {
  late ChangePasswordViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePasswordViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().tmpError = '';
      });
      setState(() {
        _model.currentPasswordTextFieldController?.clear();
        _model.newPassword1TextFieldController?.clear();
        _model.newPassword2TextFieldController?.clear();
      });
    });

    _model.currentPasswordTextFieldController ??= TextEditingController();
    _model.newPassword1TextFieldController ??= TextEditingController();
    _model.newPassword2TextFieldController ??= TextEditingController();
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
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Text(
                          'Current Password',
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                      child: TextFormField(
                        controller: _model.currentPasswordTextFieldController,
                        autofocus: true,
                        obscureText: !_model.currentPasswordTextFieldVisibility,
                        decoration: InputDecoration(
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
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model.currentPasswordTextFieldVisibility =
                                  !_model.currentPasswordTextFieldVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.currentPasswordTextFieldVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 22.0,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).titleMedium,
                        keyboardType: TextInputType.emailAddress,
                        validator: _model
                            .currentPasswordTextFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'New Password',
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                      child: TextFormField(
                        controller: _model.newPassword1TextFieldController,
                        autofocus: true,
                        obscureText: !_model.newPassword1TextFieldVisibility,
                        decoration: InputDecoration(
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
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model.newPassword1TextFieldVisibility =
                                  !_model.newPassword1TextFieldVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.newPassword1TextFieldVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 22.0,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).titleMedium,
                        keyboardType: TextInputType.emailAddress,
                        validator: _model
                            .newPassword1TextFieldControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'New Password Again',
                          style: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                      child: TextFormField(
                        controller: _model.newPassword2TextFieldController,
                        autofocus: true,
                        obscureText: !_model.newPassword2TextFieldVisibility,
                        decoration: InputDecoration(
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
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => _model.newPassword2TextFieldVisibility =
                                  !_model.newPassword2TextFieldVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              _model.newPassword2TextFieldVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 22.0,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).titleMedium,
                        keyboardType: TextInputType.emailAddress,
                        validator: _model
                            .newPassword2TextFieldControllerValidator
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
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('ForgotPasswordView');
                        },
                        text: 'I forgot my old password',
                        options: FFButtonOptions(
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
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
                            if (_model.newPassword1TextFieldController.text ==
                                _model.newPassword2TextFieldController.text) {
                              FFAppState().update(() {
                                FFAppState().tmpError = '';
                              });
                              _model.reauthUserResult1 =
                                  await actions.reauthUser(
                                currentUserEmail,
                                _model.currentPasswordTextFieldController.text,
                                '-',
                              );
                              _shouldSetState = true;
                              if (_model.reauthUserResult1 != null &&
                                  _model.reauthUserResult1 != '') {
                                FFAppState().update(() {
                                  FFAppState().tmpError =
                                      'Your current password is invalid';
                                });
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                              _model.isPwdChanged =
                                  await actions.resetUserPassword(
                                currentUserEmail,
                                _model.currentPasswordTextFieldController.text,
                                _model.newPassword1TextFieldController.text,
                              );
                              _shouldSetState = true;
                              if (_model.isPwdChanged!) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Your password has been changed succesfully',
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
                                FFAppState().update(() {
                                  FFAppState().tmpError =
                                      'Error occured while changing user password';
                                });
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamed('LoginDetailsView');
                            } else {
                              FFAppState().update(() {
                                FFAppState().tmpError =
                                    'Please enter the same new passwords';
                              });
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          text: 'Save new password',
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
