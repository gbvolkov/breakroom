import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateProfileViewWidget extends StatefulWidget {
  const CreateProfileViewWidget({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  final UserProfilesRecord? userProfile;

  @override
  _CreateProfileViewWidgetState createState() =>
      _CreateProfileViewWidgetState();
}

class _CreateProfileViewWidgetState extends State<CreateProfileViewWidget> {
  DateTime? userBDay;
  TextEditingController? txtFirstNameController;
  TextEditingController? txtSecondNameController;
  String? ddIndustryValue;
  String? ddOccupationValue;
  TextEditingController? txtBioController;
  PageController? pageViewController;
  List<String>? choiceChipsValues;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().usrFirstName = FFAppState().usrFirstName);
    });

    txtBioController = TextEditingController(text: widget.userProfile!.bio);
    txtFirstNameController =
        TextEditingController(text: widget.userProfile!.firstName);
    txtSecondNameController =
        TextEditingController(text: widget.userProfile!.lastName);
  }

  @override
  void dispose() {
    txtBioController?.dispose();
    txtFirstNameController?.dispose();
    txtSecondNameController?.dispose();
    super.dispose();
  }

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
            if ((pageViewController?.page?.round() ?? 0) == 0) {
              Navigator.pop(context);
            } else {
              await pageViewController?.previousPage(
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 48),
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'First Name*',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: TextFormField(
                                controller: txtFirstNameController,
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
                                ),
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Last Name*',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: TextFormField(
                                controller: txtSecondNameController,
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
                                ),
                                style: FlutterFlowTheme.of(context).subtitle1,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Date of birth*',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
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
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8),
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
                                                  8, 0, 0, 8),
                                          child: Text(
                                            dateTimeFormat(
                                                'yMd', FFAppState().usrBDay),
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle1,
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
                                          userBDay =
                                              await actions.vvShowDatePicker(
                                            context,
                                            FFAppState().usrBDay,
                                            'Birthday',
                                            'Enter your birthday',
                                            'Birthday',
                                          );
                                          if (userBDay != null) {
                                            setState(() => FFAppState()
                                                .usrBDay = userBDay);
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
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Industry*',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
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
                                          FFAppState().usrIndustry,
                                      options: ddIndustryIndustriesRecordList
                                          .map((e) => e.industry!)
                                          .toList()
                                          .toList(),
                                      onChanged: (val) =>
                                          setState(() => ddIndustryValue = val),
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                      hintText: 'Please select...',
                                      fillColor: Color(0xFFEFEFEF),
                                      elevation: 2,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0,
                                      borderRadius: 0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Occupation*',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: FutureBuilder<List<OccupationsRecord>>(
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
                                            color: FlutterFlowTheme.of(context)
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
                                          FFAppState().usrOccupation,
                                      options: ddOccupationOccupationsRecordList
                                          .map((e) => e.occupation!)
                                          .toList()
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => ddOccupationValue = val),
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                      hintText: 'Please select...',
                                      fillColor: Color(0xFFEFEFEF),
                                      elevation: 2,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0,
                                      borderRadius: 0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Bio*',
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                              ),
                            ),
                            TextFormField(
                              controller: txtBioController,
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
                              ),
                              style: FlutterFlowTheme.of(context).subtitle1,
                              maxLines: 4,
                            ),
                            Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                            .noColor,
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
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 48),
                                  child: Text(
                                    'Gender',
                                    style: FlutterFlowTheme.of(context).title1,
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
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: InkWell(
                                  onTap: () async {
                                    setState(() => FFAppState().usrGender =
                                        FFAppState().mrbSelectedValue);
                                  },
                                  child: Container(
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
                                      defaultSelected: FFAppState().usrGender,
                                      onValue: () async {
                                        setState(() => FFAppState().usrGender =
                                            FFAppState().mrbSelectedValue);
                                      },
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
                                    'Gender Preference',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: custom_widgets.MyRadioButton(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  buttonLabels: FFAppState().genders.toList(),
                                  buttonValues: FFAppState().genders.toList(),
                                  horizontal: false,
                                  buttonHeight: 50.0,
                                  defaultSelected:
                                      FFAppState().usrGenderPreference,
                                  onValue: () async {
                                    setState(() =>
                                        FFAppState().usrGenderPreference =
                                            FFAppState().mrbSelectedValue);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color:
                                          FlutterFlowTheme.of(context).noColor,
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
                                buttonLabels: FFAppState().intentions.toList(),
                                buttonValues: FFAppState().intentions.toList(),
                                horizontal: true,
                                buttonHeight: 50.0,
                                defaultSelected: FFAppState().usrIntention,
                                onValue: () async {
                                  setState(() => FFAppState().usrIntention =
                                      FFAppState().mrbSelectedValue);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color:
                                          FlutterFlowTheme.of(context).noColor,
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
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: custom_widgets.MyRadioButton(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                buttonLabels:
                                    FFAppState().childrenOptionsList.toList(),
                                buttonValues:
                                    FFAppState().childrenOptionsList.toList(),
                                horizontal: true,
                                buttonHeight: 50.0,
                                defaultSelected:
                                    FFAppState().usrChildfreeStatus,
                                onValue: () async {
                                  setState(() =>
                                      FFAppState().usrChildfreeStatus =
                                          FFAppState().mrbSelectedValue);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color:
                                          FlutterFlowTheme.of(context).noColor,
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
                            alignment: AlignmentDirectional(-1, 0),
                            child: Text(
                              'Religion',
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: custom_widgets.MyRadioButton(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.7,
                              buttonLabels: FFAppState().religionList.toList(),
                              buttonValues: FFAppState().religionList.toList(),
                              horizontal: true,
                              buttonHeight: 50.0,
                              defaultSelected: FFAppState().usrReligion,
                              onValue: () async {
                                setState(() => FFAppState().usrReligion =
                                    FFAppState().mrbSelectedValue);
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color:
                                          FlutterFlowTheme.of(context).noColor,
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
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: custom_widgets.MyRadioButton(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                buttonLabels:
                                    FFAppState().educationList.toList(),
                                buttonValues:
                                    FFAppState().educationList.toList(),
                                horizontal: true,
                                buttonHeight: 50.0,
                                defaultSelected: FFAppState().usrEducation,
                                onValue: () async {
                                  setState(() => FFAppState().usrEducation =
                                      FFAppState().mrbSelectedValue);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color:
                                          FlutterFlowTheme.of(context).noColor,
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
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: custom_widgets.MyRadioButton(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                buttonLabels:
                                    FFAppState().bodyTypeList.toList(),
                                buttonValues:
                                    FFAppState().bodyTypeList.toList(),
                                horizontal: true,
                                buttonHeight: 50.0,
                                defaultSelected: FFAppState().usrBodyType,
                                onValue: () async {
                                  setState(() => FFAppState().usrBodyType =
                                      FFAppState().mrbSelectedValue);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color:
                                          FlutterFlowTheme.of(context).noColor,
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
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                              child: Text(
                                'What are you \ninterested in?',
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<InterestsRecord>
                                      choiceChipsInterestsRecordList =
                                      snapshot.data!;
                                  return FlutterFlowChoiceChips(
                                    initiallySelected: choiceChipsValues != null
                                        ? choiceChipsValues
                                        : widget.userProfile!.interests!
                                            .toList(),
                                    options: choiceChipsInterestsRecordList
                                        .map((e) => e.interest!)
                                        .toList()
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) =>
                                        setState(() => choiceChipsValues = val),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                          ),
                                      iconColor: Colors.white,
                                      iconSize: 18,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 0, 16, 8),
                                      elevation: 0,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                      iconColor: Color(0xFF323B45),
                                      iconSize: 18,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 8, 16, 8),
                                      elevation: 0,
                                    ),
                                    chipSpacing: 15,
                                    rowSpacing: 10,
                                    multiselect: true,
                                    initialized: choiceChipsValues != null,
                                    alignment: WrapAlignment.start,
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color:
                                          FlutterFlowTheme.of(context).noColor,
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
                                setState(() => FFAppState()
                                        .lookingForSelection =
                                    FFAppState().lookingForSelection.toList());
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                child: custom_widgets.MyCheckBoxGroup(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  buttonLabels:
                                      FFAppState().lookingForList.toList(),
                                  buttonValues:
                                      FFAppState().lookingForList.toList(),
                                  horizontal: true,
                                  defaultSelected:
                                      FFAppState().usrLookingFor.toList(),
                                  onValue: () async {
                                    setState(() => FFAppState().usrLookingFor =
                                        FFAppState()
                                            .mcbSelectedValues
                                            .toList());
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color:
                                          FlutterFlowTheme.of(context).noColor,
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
                            alignment: AlignmentDirectional(-1, 0),
                            child: Text(
                              'How tall are you?',
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 260,
                                child: custom_widgets.MyNumberPicker(
                                  width: 80,
                                  height: 260,
                                  personHeight: FFAppState().usrHeight,
                                  onValueChanged: () async {
                                    setState(() => FFAppState().usrHeight =
                                        FFAppState().nmpPickedNumber);
                                  },
                                ),
                              ),
                              Text(
                                'cm',
                                style: FlutterFlowTheme.of(context).title3,
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Next',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color:
                                          FlutterFlowTheme.of(context).noColor,
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
                            alignment: AlignmentDirectional(-1, 0),
                            child: Text(
                              'Your Basics',
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
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 50,
                                    child: custom_widgets.MyRadioButton(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: 50,
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
                                        setState(() =>
                                            FFAppState().usrWorkoutStatus =
                                                FFAppState().mrbSelectedValue);
                                      },
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
                                    'Do you drink?',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 50,
                                    child: custom_widgets.MyRadioButton(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: 50,
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
                                        setState(() =>
                                            FFAppState().usrDrinkingStatus =
                                                FFAppState().mrbSelectedValue);
                                      },
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
                                    'Do you smoke?',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 50,
                                    child: custom_widgets.MyRadioButton(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: 50,
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
                                        setState(() =>
                                            FFAppState().usrSmokingStatus =
                                                FFAppState().mrbSelectedValue);
                                      },
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
                                    'Are you spiritual?',
                                    style:
                                        FlutterFlowTheme.of(context).subtitle2,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 32),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    child: custom_widgets.MyRadioButton(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
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
                                        setState(() =>
                                            FFAppState().usrSpiritualStatus =
                                                FFAppState().mrbSelectedValue);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
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
                                      await pageViewController?.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.ease,
                                      );
                                    },
                                    text: 'Save',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color:
                                          FlutterFlowTheme.of(context).noColor,
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
    );
  }
}
