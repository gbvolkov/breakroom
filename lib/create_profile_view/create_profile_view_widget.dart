import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_profile_view_model.dart';
export 'create_profile_view_model.dart';

class CreateProfileViewWidget extends StatefulWidget {
  const CreateProfileViewWidget({Key? key}) : super(key: key);

  @override
  _CreateProfileViewWidgetState createState() =>
      _CreateProfileViewWidgetState();
}

class _CreateProfileViewWidgetState extends State<CreateProfileViewWidget> {
  late CreateProfileViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProfileViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!currentUserEmailVerified) {
        context.pushNamed(
          'VerifyEmailView',
          queryParams: {
            'email': serializeParam(
              currentUserEmail,
              ParamType.String,
            ),
          }.withoutNulls,
        );
      }
    });

    _model.txtFirstNameController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.firstName, ''));
    _model.txtSecondNameController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.lastName, ''));
    _model.txtOccupationController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.occupation, ''));
    _model.txtBioController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.bio, ''));
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
              Function() _navigate = () {};
              if (pageViewCurrentIndex == 0) {
                var confirmDialogResponse = await showDialog<bool>(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Set up is not complete'),
                          content: Text(
                              'Do you really want to leave the app before seting up your account?'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, false),
                              child: Text('No'),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext, true),
                              child: Text('Yes'),
                            ),
                          ],
                        );
                      },
                    ) ??
                    false;
                if (confirmDialogResponse) {
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  _navigate = () => context.goNamedAuth('WelcomeView', mounted);
                }
              } else {
                await _model.pageViewController?.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }

              _navigate();
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      scrollDirection: Axis.horizontal,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 48.0),
                                  child: Text(
                                    'Personal Information',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Roboto',
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
                                    'First Name*',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => TextFormField(
                                    controller: _model.txtFirstNameController,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFEFEFEF),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    keyboardType: TextInputType.name,
                                    validator: _model
                                        .txtFirstNameControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Last Name*',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => TextFormField(
                                    controller: _model.txtSecondNameController,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFEFEFEF),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                    keyboardType: TextInputType.name,
                                    validator: _model
                                        .txtSecondNameControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Date of birth*',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 42.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 8.0),
                                            child: Text(
                                              _model.userBDay != null
                                                  ? dateTimeFormat('yMd',
                                                      FFAppState().usrBDay)
                                                  : '',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.calendar_today_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 22.0,
                                          ),
                                          onPressed: () async {
                                            _model.userBDay =
                                                await actions.vvShowDatePicker(
                                              context,
                                              FFAppState().usrBDay,
                                              'Birthday',
                                              'Enter your birthday',
                                              'Birthday',
                                            );
                                            if (_model.userBDay != null) {
                                              FFAppState().update(() {
                                                FFAppState().usrBDay =
                                                    _model.userBDay;
                                              });
                                            }

                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Industry*',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: FutureBuilder<List<IndustriesRecord>>(
                                    future: queryIndustriesRecordOnce(
                                      queryBuilder: (industriesRecord) =>
                                          industriesRecord.orderBy('industry'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      List<IndustriesRecord>
                                          ddIndustryIndustriesRecordList =
                                          snapshot.data!;
                                      return FlutterFlowDropDown<String>(
                                        controller:
                                            _model.ddIndustryValueController ??=
                                                FormFieldController<String>(
                                          _model.ddIndustryValue ??=
                                              FFAppState().usrIndustry,
                                        ),
                                        options: ddIndustryIndustriesRecordList
                                            .map((e) => e.industry)
                                            .withoutNulls
                                            .toList()
                                            .toList(),
                                        onChanged: (val) => setState(
                                            () => _model.ddIndustryValue = val),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                        hintText: 'Please select...',
                                        fillColor: Color(0xFFEFEFEF),
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Occupation*',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                              AuthUserStreamWidget(
                                builder: (context) => TextFormField(
                                  controller: _model.txtOccupationController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFEFEFEF),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                  validator: _model
                                      .txtOccupationControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Bio*',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                  ),
                                ),
                              ),
                              AuthUserStreamWidget(
                                builder: (context) => TextFormField(
                                  controller: _model.txtBioController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle:
                                        FlutterFlowTheme.of(context).titleSmall,
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
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
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                  maxLines: 5,
                                  validator: _model.txtBioControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
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
                                          if ((_model.txtFirstNameController.text == null ||
                                                  _model.txtFirstNameController
                                                          .text ==
                                                      '') ||
                                              (_model.txtSecondNameController.text == null ||
                                                  _model.txtSecondNameController
                                                          .text ==
                                                      '') ||
                                              (_model.userBDay == null) ||
                                              (FFAppState().usrBDay! >=
                                                  functions.addYearsToDate(
                                                      getCurrentTimestamp,
                                                      18,
                                                      -1,
                                                      0)) ||
                                              (_model.ddIndustryValue == null ||
                                                  _model.ddIndustryValue ==
                                                      '') ||
                                              (_model.txtBioController.text ==
                                                      null ||
                                                  _model.txtBioController
                                                          .text ==
                                                      '') ||
                                              (_model.txtOccupationController
                                                          .text ==
                                                      null ||
                                                  _model.txtOccupationController
                                                          .text ==
                                                      '')) {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Input invalid.'),
                                                  content: Text(
                                                      'Please check your input parameters. Only adult users are allowed'),
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
                                          } else {
                                            await _model.pageViewController
                                                ?.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
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
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 48.0),
                                    child: Text(
                                      'Gender',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      'Your Gender',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 32.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 50.0,
                                    child: custom_widgets.MyRadioButton(
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height: 50.0,
                                      buttonLabels:
                                          FFAppState().genders.toList(),
                                      buttonValues:
                                          FFAppState().genders.toList(),
                                      horizontal: false,
                                      buttonWidth: 150.0,
                                      buttonHeight: 50.0,
                                      defaultSelected: FFAppState().usrGender,
                                      onValue: () async {
                                        FFAppState().update(() {
                                          FFAppState().usrGender =
                                              FFAppState().mrbSelectedValue;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      'Gender Preference',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height: 50.0,
                                  child: custom_widgets.MyRadioButton(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    height: 50.0,
                                    buttonLabels: FFAppState().genders.toList(),
                                    buttonValues: FFAppState().genders.toList(),
                                    horizontal: false,
                                    buttonWidth: 150.0,
                                    buttonHeight: 50.0,
                                    defaultSelected:
                                        FFAppState().usrGenderPreference,
                                    onValue: () async {
                                      FFAppState().update(() {
                                        FFAppState().usrGenderPreference =
                                            FFAppState().mrbSelectedValue;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
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
                                        if ((FFAppState().usrGender == null ||
                                                FFAppState().usrGender == '') ||
                                            (FFAppState().usrGenderPreference ==
                                                    null ||
                                                FFAppState()
                                                        .usrGenderPreference ==
                                                    '')) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Input invalid.'),
                                                content: Text(
                                                    'Please check your input parameters. '),
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
                                        } else {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                          width: 0.0,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Choose your status',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 200.0,
                                child: custom_widgets.MyRadioButton(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height: 200.0,
                                  buttonLabels:
                                      FFAppState().intentions.toList(),
                                  buttonValues:
                                      FFAppState().intentions.toList(),
                                  horizontal: true,
                                  buttonWidth: 150.0,
                                  buttonHeight: 50.0,
                                  defaultSelected: FFAppState().usrIntention,
                                  onValue: () async {
                                    FFAppState().update(() {
                                      FFAppState().usrIntention =
                                          FFAppState().mrbSelectedValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
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
                                        if (FFAppState().usrIntention == null ||
                                            FFAppState().usrIntention == '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Input invalid.'),
                                                content: Text(
                                                    'Please check your input parameters. '),
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
                                        } else {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                        textStyle: FlutterFlowTheme.of(context)
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Do you want children?',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: custom_widgets.MyRadioButton(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  buttonLabels:
                                      FFAppState().childrenOptionsList.toList(),
                                  buttonValues:
                                      FFAppState().childrenOptionsList.toList(),
                                  horizontal: true,
                                  buttonWidth: 150.0,
                                  buttonHeight: 50.0,
                                  defaultSelected:
                                      FFAppState().usrChildfreeStatus,
                                  onValue: () async {
                                    FFAppState().update(() {
                                      FFAppState().usrChildfreeStatus =
                                          FFAppState().mrbSelectedValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
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
                                        if (FFAppState().usrChildfreeStatus ==
                                                null ||
                                            FFAppState().usrChildfreeStatus ==
                                                '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Input invalid.'),
                                                content: Text(
                                                    'Please check your input parameters. '),
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
                                        } else {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                        textStyle: FlutterFlowTheme.of(context)
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Religion',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 1.0,
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: custom_widgets.MyRadioButton(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                buttonLabels:
                                    FFAppState().religionList.toList(),
                                buttonValues:
                                    FFAppState().religionList.toList(),
                                horizontal: true,
                                buttonWidth: 150.0,
                                buttonHeight: 50.0,
                                defaultSelected: FFAppState().usrReligion,
                                onValue: () async {
                                  FFAppState().update(() {
                                    FFAppState().usrReligion =
                                        FFAppState().mrbSelectedValue;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
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
                                        if (FFAppState().usrReligion == null ||
                                            FFAppState().usrReligion == '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Input invalid.'),
                                                content: Text(
                                                    'Please check your input parameters. '),
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
                                        } else {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                        textStyle: FlutterFlowTheme.of(context)
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Education',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                child: custom_widgets.MyRadioButton(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  buttonLabels:
                                      FFAppState().educationList.toList(),
                                  buttonValues:
                                      FFAppState().educationList.toList(),
                                  horizontal: true,
                                  buttonWidth: 150.0,
                                  buttonHeight: 50.0,
                                  defaultSelected: FFAppState().usrEducation,
                                  onValue: () async {
                                    FFAppState().update(() {
                                      FFAppState().usrEducation =
                                          FFAppState().mrbSelectedValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
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
                                        if (FFAppState().usrEducation == null ||
                                            FFAppState().usrEducation == '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Input invalid.'),
                                                content: Text(
                                                    'Please check your input parameters. '),
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
                                        } else {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                        textStyle: FlutterFlowTheme.of(context)
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Body type',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                child: custom_widgets.MyRadioButton(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  buttonLabels:
                                      FFAppState().bodyTypeList.toList(),
                                  buttonValues:
                                      FFAppState().bodyTypeList.toList(),
                                  horizontal: true,
                                  buttonWidth: 150.0,
                                  buttonHeight: 50.0,
                                  defaultSelected: FFAppState().usrBodyType,
                                  onValue: () async {
                                    FFAppState().update(() {
                                      FFAppState().usrBodyType =
                                          FFAppState().mrbSelectedValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
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
                                        if (FFAppState().usrBodyType == null ||
                                            FFAppState().usrBodyType == '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Input invalid.'),
                                                content: Text(
                                                    'Please check your input parameters. '),
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
                                        } else {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                        textStyle: FlutterFlowTheme.of(context)
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: Text(
                                  'What are you \ninterested in?',
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) =>
                                      FutureBuilder<List<InterestsRecord>>(
                                    future: queryInterestsRecordOnce(
                                      queryBuilder: (interestsRecord) =>
                                          interestsRecord.orderBy('interest'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      List<InterestsRecord>
                                          choiceChipsInterestsRecordList =
                                          snapshot.data!;
                                      return FlutterFlowChoiceChips(
                                        options: choiceChipsInterestsRecordList
                                            .map((e) => e.interest)
                                            .withoutNulls
                                            .toList()
                                            .map((label) => ChipData(label))
                                            .toList(),
                                        onChanged: (val) => setState(() =>
                                            _model.choiceChipsValues = val),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                              ),
                                          iconColor: Colors.white,
                                          iconSize: 18.0,
                                          labelPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 8.0),
                                          elevation: 0.0,
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall,
                                          iconColor: Color(0xFF323B45),
                                          iconSize: 18.0,
                                          labelPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 8.0),
                                          elevation: 0.0,
                                        ),
                                        chipSpacing: 15.0,
                                        rowSpacing: 10.0,
                                        multiselect: true,
                                        initialized:
                                            _model.choiceChipsValues != null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                          (currentUserDocument?.interests
                                                  ?.toList() ??
                                              []),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
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
                                        if (_model.choiceChipsValues!.length <=
                                            0) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Input invalid.'),
                                                content: Text(
                                                    'Please check your input parameters. '),
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
                                        } else {
                                          FFAppState().update(() {
                                            FFAppState().usrInterests = _model
                                                .choiceChipsValues!
                                                .toList();
                                          });
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                        textStyle: FlutterFlowTheme.of(context)
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'What are you\nlooking for?',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                child: custom_widgets.MyCheckBoxGroup(
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  buttonLabels:
                                      FFAppState().lookingForList.toList(),
                                  buttonValues:
                                      FFAppState().lookingForList.toList(),
                                  horizontal: true,
                                  buttonWidth: 150.0,
                                  buttonHeight: 50.0,
                                  defaultSelected:
                                      FFAppState().usrLookingFor.toList(),
                                  onValue: () async {
                                    FFAppState().update(() {
                                      FFAppState().usrLookingFor = FFAppState()
                                          .mcbSelectedValues
                                          .toList();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
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
                                        if (FFAppState()
                                                .mcbSelectedValues
                                                .length <=
                                            0) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Input invalid.'),
                                                content: Text(
                                                    'Please check your input parameters. '),
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
                                        } else {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                        textStyle: FlutterFlowTheme.of(context)
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
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'How tall are you?',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 260.0,
                                  child: custom_widgets.MyNumberPicker(
                                    width: 80.0,
                                    height: 260.0,
                                    personHeight: FFAppState().usrHeight,
                                    onValueChanged: () async {
                                      FFAppState().update(() {
                                        FFAppState().usrHeight =
                                            FFAppState().nmpPickedNumber;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'in',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
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
                                        if (FFAppState().usrHeight == null) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Input invalid.'),
                                                content: Text(
                                                    'Please check your input parameters. '),
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
                                        } else {
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        }
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                        textStyle: FlutterFlowTheme.of(context)
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
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Lifestyle',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      'Do you work out?',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 32.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: 50.0,
                                      child: custom_widgets.MyRadioButton(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height: 50.0,
                                        buttonLabels:
                                            FFAppState().howOftenList.toList(),
                                        buttonValues:
                                            FFAppState().howOftenList.toList(),
                                        horizontal: false,
                                        buttonWidth: 100.0,
                                        buttonHeight: 50.0,
                                        defaultSelected:
                                            FFAppState().usrWorkoutStatus,
                                        onValue: () async {
                                          FFAppState().update(() {
                                            FFAppState().usrWorkoutStatus =
                                                FFAppState().mrbSelectedValue;
                                          });
                                        },
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
                                      'Do you drink?',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 32.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: 50.0,
                                      child: custom_widgets.MyRadioButton(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height: 50.0,
                                        buttonLabels:
                                            FFAppState().howOftenList.toList(),
                                        buttonValues:
                                            FFAppState().howOftenList.toList(),
                                        horizontal: false,
                                        buttonWidth: 100.0,
                                        buttonHeight: 50.0,
                                        defaultSelected:
                                            FFAppState().usrDrinkingStatus,
                                        onValue: () async {
                                          FFAppState().update(() {
                                            FFAppState().usrDrinkingStatus =
                                                FFAppState().mrbSelectedValue;
                                          });
                                        },
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
                                      'Do you smoke?',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 32.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: 50.0,
                                      child: custom_widgets.MyRadioButton(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height: 50.0,
                                        buttonLabels:
                                            FFAppState().howOftenList.toList(),
                                        buttonValues:
                                            FFAppState().howOftenList.toList(),
                                        horizontal: false,
                                        buttonWidth: 100.0,
                                        buttonHeight: 50.0,
                                        defaultSelected:
                                            FFAppState().usrSmokingStatus,
                                        onValue: () async {
                                          FFAppState().update(() {
                                            FFAppState().usrSmokingStatus =
                                                FFAppState().mrbSelectedValue;
                                          });
                                        },
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
                                      'Are you spiritual?',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 32.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height: 50.0,
                                      child: custom_widgets.MyRadioButton(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height: 50.0,
                                        buttonLabels:
                                            FFAppState().howOftenList.toList(),
                                        buttonValues:
                                            FFAppState().howOftenList.toList(),
                                        horizontal: false,
                                        buttonWidth: 100.0,
                                        buttonHeight: 50.0,
                                        defaultSelected:
                                            FFAppState().usrSpiritualStatus,
                                        onValue: () async {
                                          FFAppState().update(() {
                                            FFAppState().usrSpiritualStatus =
                                                FFAppState().mrbSelectedValue;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 32.0),
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
                                        if ((FFAppState().usrWorkoutStatus == null || FFAppState().usrWorkoutStatus == '') ||
                                            (FFAppState().usrDrinkingStatus ==
                                                    null ||
                                                FFAppState()
                                                        .usrDrinkingStatus ==
                                                    '') ||
                                            (FFAppState().usrSmokingStatus ==
                                                    null ||
                                                FFAppState().usrSmokingStatus ==
                                                    '') ||
                                            (FFAppState().usrSpiritualStatus ==
                                                    null ||
                                                FFAppState()
                                                        .usrSpiritualStatus ==
                                                    '')) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Input invalid.'),
                                                content: Text(
                                                    'Please check your input parameters. '),
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
                                        } else {
                                          final usersUpdateData = {
                                            ...createUsersRecordData(
                                              firstName: _model
                                                  .txtFirstNameController.text,
                                              lastName: _model
                                                  .txtSecondNameController.text,
                                              birthDay: FFAppState().usrBDay,
                                              industry: _model.ddIndustryValue,
                                              occupation: _model
                                                  .txtOccupationController.text,
                                              bio: _model.txtBioController.text,
                                              gender: FFAppState().usrGender,
                                              genderPreference: FFAppState()
                                                  .usrGenderPreference,
                                              intention:
                                                  FFAppState().usrIntention,
                                              childfreeStatus: FFAppState()
                                                  .usrChildfreeStatus,
                                              religion:
                                                  FFAppState().usrReligion,
                                              education:
                                                  FFAppState().usrEducation,
                                              bodyType:
                                                  FFAppState().usrBodyType,
                                              height: FFAppState().usrHeight,
                                              weight: 70,
                                              workoutStatus:
                                                  FFAppState().usrWorkoutStatus,
                                              drinkingStatus: FFAppState()
                                                  .usrDrinkingStatus,
                                              smokingStatus:
                                                  FFAppState().usrSmokingStatus,
                                              spiritualStatus: FFAppState()
                                                  .usrSpiritualStatus,
                                              displayName:
                                                  '${_model.txtFirstNameController.text}, ${functions.getAge(FFAppState().usrBDay).toString()}',
                                              isComplete: true,
                                            ),
                                            'interests':
                                                FFAppState().usrInterests,
                                            'lookingFor':
                                                FFAppState().usrLookingFor,
                                          };
                                          await currentUserReference!
                                              .update(usersUpdateData);

                                          context.pushNamed(
                                            'UploadPhotosView',
                                            queryParams: {
                                              'photos': serializeParam(
                                                FFAppState()
                                                    .initPhotoCollection,
                                                ParamType.String,
                                                true,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                      text: 'Save',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .noColor,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                          width: 0.0,
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
                      ],
                    ),
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
