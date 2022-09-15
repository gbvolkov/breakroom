import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProfileViewWidget extends StatefulWidget {
  const CreateProfileViewWidget({Key? key}) : super(key: key);

  @override
  _CreateProfileViewWidgetState createState() =>
      _CreateProfileViewWidgetState();
}

class _CreateProfileViewWidgetState extends State<CreateProfileViewWidget> {
  TextEditingController? txtBioController;

  TextEditingController? txtFirstNameController;

  TextEditingController? txtSecondNameController;

  DateTime? datePicked;
  String? ddIndustryValue;
  String? ddOccupationValue;
  PageController? pageViewController;
  List<String>? choiceChipsValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            await pageViewController?.previousPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: StreamBuilder<List<UserProfilesRecord>>(
          stream: queryUserProfilesRecord(
            queryBuilder: (userProfilesRecord) => userProfilesRecord
                .where('user', isEqualTo: currentUserReference),
            singleRecord: true,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
              );
            }
            List<UserProfilesRecord> columnUserProfilesRecordList =
                snapshot.data!;
            // Return an empty Container when the document does not exist.
            if (snapshot.data!.isEmpty) {
              return Container();
            }
            final columnUserProfilesRecord =
                columnUserProfilesRecordList.isNotEmpty
                    ? columnUserProfilesRecordList.first
                    : null;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 48),
                                    child: Text(
                                      'Personal Information',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Roboto',
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
                                      'First Name*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: TextFormField(
                                    controller: txtFirstNameController ??=
                                        TextEditingController(
                                      text: columnUserProfilesRecord!.firstName,
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFEFEFEF),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'Last Name*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: TextFormField(
                                    controller: txtSecondNameController ??=
                                        TextEditingController(
                                      text: columnUserProfilesRecord!.lastName,
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFEFEFEF),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'Date of birth*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Text(
                                            valueOrDefault<String>(
                                              dateTimeFormat(
                                                  'd/M/y', datePicked),
                                              '1/1/1975',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 40,
                                        icon: Icon(
                                          Icons.calendar_today_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 22,
                                        ),
                                        onPressed: () async {
                                          await DatePicker.showDatePicker(
                                            context,
                                            showTitleActions: true,
                                            onConfirm: (date) {
                                              setState(() => datePicked = date);
                                            },
                                            currentTime:
                                                columnUserProfilesRecord!
                                                    .birthDay!,
                                            minTime: DateTime(0, 0, 0),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'Industry*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child:
                                        FutureBuilder<List<IndustriesRecord>>(
                                      future: queryIndustriesRecordOnce(
                                        queryBuilder: (industriesRecord) =>
                                            industriesRecord
                                                .orderBy('industry'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<IndustriesRecord>
                                            ddIndustryIndustriesRecordList =
                                            snapshot.data!;
                                        return FlutterFlowDropDown(
                                          initialOption: ddIndustryValue ??=
                                              columnUserProfilesRecord!
                                                  .industry,
                                          options:
                                              ddIndustryIndustriesRecordList
                                                  .map((e) => e.industry!)
                                                  .toList()
                                                  .toList(),
                                          onChanged: (val) => setState(
                                              () => ddIndustryValue = val),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          hintText: 'Please select...',
                                          fillColor: Color(0xFFEFEFEF),
                                          elevation: 2,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          borderRadius: 0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          hidesUnderline: true,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'Occupation*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child:
                                        FutureBuilder<List<OccupationsRecord>>(
                                      future: queryOccupationsRecordOnce(
                                        queryBuilder: (occupationsRecord) =>
                                            occupationsRecord
                                                .where('industry',
                                                    isEqualTo: ddIndustryValue)
                                                .orderBy('occupation'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OccupationsRecord>
                                            ddOccupationOccupationsRecordList =
                                            snapshot.data!;
                                        return FlutterFlowDropDown(
                                          initialOption: ddOccupationValue ??=
                                              columnUserProfilesRecord!
                                                  .occupation,
                                          options:
                                              ddOccupationOccupationsRecordList
                                                  .map((e) => e.occupation!)
                                                  .toList()
                                                  .toList(),
                                          onChanged: (val) => setState(
                                              () => ddOccupationValue = val),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          hintText: 'Please select...',
                                          fillColor: Color(0xFFEFEFEF),
                                          elevation: 2,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          borderRadius: 0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          hidesUnderline: true,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Text(
                                      'Bio*',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: txtBioController ??=
                                      TextEditingController(
                                    text: columnUserProfilesRecord!.bio,
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle:
                                        FlutterFlowTheme.of(context).subtitle2,
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFEFEFEF),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  maxLines: 4,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Text(
                                      '96/150',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 12,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 32),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await pageViewController?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
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
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 48),
                                      child: Text(
                                        'Gender',
                                        style:
                                            FlutterFlowTheme.of(context).title1,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: Text(
                                        'Your Gender',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 32),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: custom_widgets.MyRadioButton(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        buttonLabels:
                                            FFAppState().genders.toList(),
                                        buttonValues:
                                            FFAppState().genders.toList(),
                                        horizontal: false,
                                        buttonHeight: 50.0,
                                        defaultSelected:
                                            columnUserProfilesRecord!.gender,
                                        optionNo: 0,
                                        onValue: () async {
                                          setState(() =>
                                              FFAppState().selectedValues =
                                                  FFAppState()
                                                      .selectedValues
                                                      .toList());
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: Text(
                                        'Gender Preference',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    child: custom_widgets.MyRadioButton(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      buttonLabels:
                                          FFAppState().genders.toList(),
                                      buttonValues:
                                          FFAppState().genders.toList(),
                                      horizontal: false,
                                      buttonHeight: 50.0,
                                      defaultSelected: columnUserProfilesRecord!
                                          .genderPreference,
                                      optionNo: 1,
                                      onValue: () async {
                                        setState(() =>
                                            FFAppState().selectedValues =
                                                FFAppState()
                                                    .selectedValues
                                                    .toList());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'Choose your status',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: custom_widgets.MyRadioButton(
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    buttonLabels:
                                        FFAppState().intentions.toList(),
                                    buttonValues:
                                        FFAppState().intentions.toList(),
                                    horizontal: true,
                                    buttonHeight: 50.0,
                                    defaultSelected:
                                        columnUserProfilesRecord!.intention,
                                    optionNo: 2,
                                    onValue: () async {
                                      setState(() => FFAppState()
                                              .selectedValues =
                                          FFAppState().selectedValues.toList());
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'Do you want children?',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: custom_widgets.MyRadioButton(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    buttonLabels: FFAppState()
                                        .childrenOptionsList
                                        .toList(),
                                    buttonValues: FFAppState()
                                        .childrenOptionsList
                                        .toList(),
                                    horizontal: true,
                                    buttonHeight: 50.0,
                                    defaultSelected: columnUserProfilesRecord!
                                        .childfreeStatus,
                                    optionNo: 3,
                                    onValue: () async {
                                      setState(() => FFAppState()
                                              .selectedValues =
                                          FFAppState().selectedValues.toList());
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'Religion',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: custom_widgets.MyRadioButton(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    buttonLabels:
                                        FFAppState().religionList.toList(),
                                    buttonValues:
                                        FFAppState().religionList.toList(),
                                    horizontal: true,
                                    buttonHeight: 50.0,
                                    defaultSelected:
                                        columnUserProfilesRecord!.religion,
                                    optionNo: 4,
                                    onValue: () async {
                                      setState(() => FFAppState()
                                              .selectedValues =
                                          FFAppState().selectedValues.toList());
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'Education',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: custom_widgets.MyRadioButton(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    buttonLabels:
                                        FFAppState().educationList.toList(),
                                    buttonValues:
                                        FFAppState().educationList.toList(),
                                    horizontal: true,
                                    buttonHeight: 50.0,
                                    defaultSelected:
                                        columnUserProfilesRecord!.education,
                                    optionNo: 5,
                                    onValue: () async {
                                      setState(() => FFAppState()
                                              .selectedValues =
                                          FFAppState().selectedValues.toList());
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'Body type',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  child: custom_widgets.MyRadioButton(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    buttonLabels:
                                        FFAppState().bodyTypeList.toList(),
                                    buttonValues:
                                        FFAppState().bodyTypeList.toList(),
                                    horizontal: true,
                                    buttonHeight: 50.0,
                                    defaultSelected:
                                        columnUserProfilesRecord!.bodyType,
                                    optionNo: 6,
                                    onValue: () async {
                                      setState(() => FFAppState()
                                              .selectedValues =
                                          FFAppState().selectedValues.toList());
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 32),
                                    child: Text(
                                      'What are you \ninterested in?',
                                      style:
                                          FlutterFlowTheme.of(context).title1,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 32),
                                    child: FutureBuilder<List<InterestsRecord>>(
                                      future: queryInterestsRecordOnce(
                                        queryBuilder: (interestsRecord) =>
                                            interestsRecord.orderBy('interest'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        List<InterestsRecord>
                                            choiceChipsInterestsRecordList =
                                            snapshot.data!;
                                        return FlutterFlowChoiceChips(
                                          initiallySelected:
                                              choiceChipsValues != null
                                                  ? choiceChipsValues
                                                  : columnUserProfilesRecord!
                                                      .interests!
                                                      .toList(),
                                          options:
                                              choiceChipsInterestsRecordList
                                                  .map((e) => e.interest!)
                                                  .toList()
                                                  .map((label) =>
                                                      ChipData(label))
                                                  .toList(),
                                          onChanged: (val) => setState(
                                              () => choiceChipsValues = val),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                    ),
                                            iconColor: Colors.white,
                                            iconSize: 18,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 0, 16, 8),
                                            elevation: 2,
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor: Colors.white,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2,
                                            iconColor: Color(0xFF323B45),
                                            iconSize: 18,
                                            labelPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 8, 16, 8),
                                            elevation: 2,
                                          ),
                                          chipSpacing: 15,
                                          rowSpacing: 10,
                                          multiselect: true,
                                          initialized:
                                              choiceChipsValues != null,
                                          alignment: WrapAlignment.start,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 32),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await pageViewController?.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.ease,
                                        );
                                      },
                                      text: 'Next',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'What are you\nlooking for?',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: InkWell(
                                  onTap: () async {
                                    setState(() =>
                                        FFAppState().lookingForSelection =
                                            FFAppState()
                                                .lookingForSelection
                                                .toList());
                                    setState(() => FFAppState().selectedValues =
                                        FFAppState().selectedValues.toList());
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('HoHoHo'),
                                          content: Text('222'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.35,
                                    child: custom_widgets.MyCheckBoxGroup(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.35,
                                      buttonLabels:
                                          FFAppState().lookingForList.toList(),
                                      buttonValues:
                                          FFAppState().lookingForList.toList(),
                                      horizontal: true,
                                      defaultSelected: columnUserProfilesRecord!
                                          .lookingFor!
                                          .toList(),
                                      optionNo: 11,
                                      onValue: () async {
                                        setState(() =>
                                            FFAppState().lookingForSelection =
                                                FFAppState()
                                                    .lookingForSelection
                                                    .toList());
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'How tall are you?',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                              Container(
                                width: 100,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: custom_widgets.MyNumberPicker(
                                  width: 100,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  personHeight:
                                      columnUserProfilesRecord!.height,
                                  onValueChanged: () async {},
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Text(
                                  'Gender',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: Text(
                                        'Do you work out?',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 32),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: custom_widgets.MyRadioButton(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        buttonLabels:
                                            FFAppState().howOftenList.toList(),
                                        buttonValues:
                                            FFAppState().howOftenList.toList(),
                                        horizontal: false,
                                        buttonWidth: 120.0,
                                        buttonHeight: 50.0,
                                        defaultSelected:
                                            columnUserProfilesRecord!
                                                .workoutStatus,
                                        optionNo: 7,
                                        onValue: () async {
                                          setState(() =>
                                              FFAppState().selectedValues =
                                                  FFAppState()
                                                      .selectedValues
                                                      .toList());
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: Text(
                                        'Do you drink?',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 32),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: custom_widgets.MyRadioButton(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        buttonLabels:
                                            FFAppState().howOftenList.toList(),
                                        buttonValues:
                                            FFAppState().howOftenList.toList(),
                                        horizontal: false,
                                        buttonWidth: 120.0,
                                        buttonHeight: 50.0,
                                        defaultSelected:
                                            columnUserProfilesRecord!
                                                .drinkingStatus,
                                        optionNo: 8,
                                        onValue: () async {
                                          setState(() =>
                                              FFAppState().selectedValues =
                                                  FFAppState()
                                                      .selectedValues
                                                      .toList());
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: Text(
                                        'Do you smoke?',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 32),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: custom_widgets.MyRadioButton(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        buttonLabels:
                                            FFAppState().howOftenList.toList(),
                                        buttonValues:
                                            FFAppState().howOftenList.toList(),
                                        horizontal: false,
                                        buttonWidth: 120.0,
                                        buttonHeight: 50.0,
                                        defaultSelected:
                                            columnUserProfilesRecord!
                                                .smokingStatus,
                                        optionNo: 9,
                                        onValue: () async {
                                          setState(() =>
                                              FFAppState().selectedValues =
                                                  FFAppState()
                                                      .selectedValues
                                                      .toList());
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 8),
                                      child: Text(
                                        'Are you spiritual?',
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 32),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: custom_widgets.MyRadioButton(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        buttonLabels:
                                            FFAppState().howOftenList.toList(),
                                        buttonValues:
                                            FFAppState().howOftenList.toList(),
                                        horizontal: false,
                                        buttonWidth: 120.0,
                                        buttonHeight: 50.0,
                                        defaultSelected:
                                            columnUserProfilesRecord!
                                                .spiritualStatus,
                                        optionNo: 10,
                                        onValue: () async {
                                          setState(() =>
                                              FFAppState().selectedValues =
                                                  FFAppState()
                                                      .selectedValues
                                                      .toList());
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      final userProfilesUpdateData = {
                                        ...createUserProfilesRecordData(
                                          firstName:
                                              txtFirstNameController?.text ??
                                                  '',
                                          lastName:
                                              txtSecondNameController?.text ??
                                                  '',
                                          birthDay: datePicked,
                                          industry: ddIndustryValue,
                                          occupation: ddOccupationValue,
                                          bio: txtBioController?.text ?? '',
                                          gender: functions.getListValue(
                                              FFAppState()
                                                  .selectedValues
                                                  .toList(),
                                              0),
                                          genderPreference:
                                              functions.getListValue(
                                                  FFAppState()
                                                      .selectedValues
                                                      .toList(),
                                                  1),
                                          intention: functions.getListValue(
                                              FFAppState()
                                                  .selectedValues
                                                  .toList(),
                                              2),
                                          childfreeStatus:
                                              functions.getListValue(
                                                  FFAppState()
                                                      .selectedValues
                                                      .toList(),
                                                  3),
                                          religion: functions.getListValue(
                                              FFAppState()
                                                  .selectedValues
                                                  .toList(),
                                              4),
                                          education: functions.getListValue(
                                              FFAppState()
                                                  .selectedValues
                                                  .toList(),
                                              5),
                                          bodyType: functions.getListValue(
                                              FFAppState()
                                                  .selectedValues
                                                  .toList(),
                                              6),
                                          workoutStatus: functions.getListValue(
                                              FFAppState()
                                                  .selectedValues
                                                  .toList(),
                                              7),
                                          drinkingStatus:
                                              functions.getListValue(
                                                  FFAppState()
                                                      .selectedValues
                                                      .toList(),
                                                  8),
                                          smokingStatus: functions.getListValue(
                                              FFAppState()
                                                  .selectedValues
                                                  .toList(),
                                              9),
                                          spiritualStatus:
                                              functions.getListValue(
                                                  FFAppState()
                                                      .selectedValues
                                                      .toList(),
                                                  10),
                                        ),
                                        'interests': choiceChipsValues,
                                        'lookingFor':
                                            FFAppState().lookingForSelection,
                                      };
                                      await columnUserProfilesRecord!.reference
                                          .update(userProfilesUpdateData);
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NavBarPage(
                                              initialPage: 'ProfileView'),
                                        ),
                                      );
                                    },
                                    text: 'Save',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
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
            );
          },
        ),
      ),
    );
  }
}
