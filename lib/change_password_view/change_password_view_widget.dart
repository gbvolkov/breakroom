import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordViewWidget extends StatefulWidget {
  const ChangePasswordViewWidget({Key? key}) : super(key: key);

  @override
  _ChangePasswordViewWidgetState createState() =>
      _ChangePasswordViewWidgetState();
}

class _ChangePasswordViewWidgetState extends State<ChangePasswordViewWidget> {
  String? reauthUserResult1;
  bool? isPwdChanged;
  TextEditingController? currentPasswordTextFieldController;

  late bool currentPasswordTextFieldVisibility;
  TextEditingController? newPassword1TextFieldController;

  late bool newPassword1TextFieldVisibility;
  TextEditingController? newPassword2TextFieldController;

  late bool newPassword2TextFieldVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().tmpError = '');
      setState(() {
        currentPasswordTextFieldController?.clear();
        newPassword1TextFieldController?.clear();
        newPassword2TextFieldController?.clear();
      });
    });

    currentPasswordTextFieldController = TextEditingController();
    currentPasswordTextFieldVisibility = false;
    newPassword1TextFieldController = TextEditingController();
    newPassword1TextFieldVisibility = false;
    newPassword2TextFieldController = TextEditingController();
    newPassword2TextFieldVisibility = false;
  }

  @override
  void dispose() {
    currentPasswordTextFieldController?.dispose();
    newPassword1TextFieldController?.dispose();
    newPassword2TextFieldController?.dispose();
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                        child: Text(
                          'Current Password',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                      child: TextFormField(
                        controller: currentPasswordTextFieldController,
                        autofocus: true,
                        obscureText: !currentPasswordTextFieldVisibility,
                        decoration: InputDecoration(
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
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => currentPasswordTextFieldVisibility =
                                  !currentPasswordTextFieldVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              currentPasswordTextFieldVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 22,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).subtitle1,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Text(
                          'New Password',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                      child: TextFormField(
                        controller: newPassword1TextFieldController,
                        autofocus: true,
                        obscureText: !newPassword1TextFieldVisibility,
                        decoration: InputDecoration(
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
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => newPassword1TextFieldVisibility =
                                  !newPassword1TextFieldVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              newPassword1TextFieldVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 22,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).subtitle1,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Text(
                          'New Password Again',
                          style: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                      child: TextFormField(
                        controller: newPassword2TextFieldController,
                        autofocus: true,
                        obscureText: !newPassword2TextFieldVisibility,
                        decoration: InputDecoration(
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
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => newPassword2TextFieldVisibility =
                                  !newPassword2TextFieldVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              newPassword2TextFieldVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 22,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).subtitle1,
                        keyboardType: TextInputType.emailAddress,
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
                      alignment: AlignmentDirectional(1, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('ForgotPasswordView');
                        },
                        text: 'I forgot my old password',
                        options: FFButtonOptions(
                          height: 48,
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                            if (newPassword1TextFieldController!.text ==
                                newPassword2TextFieldController!.text) {
                              setState(() => FFAppState().tmpError = '');
                              reauthUserResult1 = await actions.reauthUser(
                                currentUserEmail,
                                currentPasswordTextFieldController!.text,
                                '-',
                              );
                              _shouldSetState = true;
                              if (reauthUserResult1 != null &&
                                  reauthUserResult1 != '') {
                                setState(() => FFAppState().tmpError =
                                    'Your current password is invalid');
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                              isPwdChanged = await actions.resetUserPassword(
                                currentUserEmail,
                                currentPasswordTextFieldController!.text,
                                newPassword1TextFieldController!.text,
                              );
                              _shouldSetState = true;
                              if (isPwdChanged!) {
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
                                setState(() => FFAppState().tmpError =
                                    'Error occured while changing user password');
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              context.goNamed('LoginDetailsView');
                            } else {
                              setState(() => FFAppState().tmpError =
                                  'Please enter the same new passwords');
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          text: 'Save new password',
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
