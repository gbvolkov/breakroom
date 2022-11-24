import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FiltersViewWidget extends StatefulWidget {
  const FiltersViewWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final UsersRecord? user;

  @override
  _FiltersViewWidgetState createState() => _FiltersViewWidgetState();
}

class _FiltersViewWidgetState extends State<FiltersViewWidget> {
  PageController? pageViewController;
  String? ccInterestedInValue;
  bool? switchListTileValue;
  double? sliderDistanceValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
            if ((pageViewController?.page?.round() ?? 0) == 0) {
              context.pop();
            } else {
              setState(() => FFAppState().filterName = 'Filter');
              await pageViewController?.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }
          },
        ),
        title: Text(
          FFAppState().filterName,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).primaryText,
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 1,
                      child: PageView(
                        controller: pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'I\'m interested in',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: FlutterFlowChoiceChips(
                                  initiallySelected: [FFAppState().fltrGender],
                                  options: FFAppState()
                                      .interestedInList
                                      .map((label) => ChipData(label))
                                      .toList(),
                                  onChanged: (val) => setState(
                                      () => ccInterestedInValue = val?.first),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    iconColor: Colors.white,
                                    iconSize: 18,
                                    elevation: 0,
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w300,
                                        ),
                                    iconColor: Color(0xFF323B45),
                                    iconSize: 18,
                                    elevation: 0,
                                  ),
                                  chipSpacing: 4,
                                  multiselect: false,
                                  initialized: ccInterestedInValue != null,
                                  alignment: WrapAlignment.spaceEvenly,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Text(
                                  'Age',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Stack(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16, 16, 16, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 8),
                                                      child: Text(
                                                        'Between ${formatNumber(
                                                          FFAppState()
                                                              .fltrAgeMin,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###',
                                                          locale: '',
                                                        )} and ${formatNumber(
                                                          FFAppState()
                                                              .fltrAgeMax,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###',
                                                          locale: '',
                                                        )}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 50,
                                                  child: custom_widgets
                                                      .CustomRangeSlider(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 50,
                                                    minValue: 18,
                                                    maxValue: 100,
                                                    rangeStart:
                                                        FFAppState().fltrAgeMin,
                                                    rangeEnd:
                                                        FFAppState().fltrAgeMax,
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    inactiveColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    onValueChanged: () async {
                                                      setState(() => FFAppState()
                                                              .fltrAgeMin =
                                                          FFAppState()
                                                              .rangeSliderStart);
                                                      setState(() => FFAppState()
                                                              .fltrAgeMax =
                                                          FFAppState()
                                                              .rangeSliderEnd);
                                                    },
                                                  ),
                                                ),
                                                if (FFAppState().falseconst)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'See people 2 years either\nside if I run out',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                      Expanded(
                                                        child: SwitchListTile(
                                                          value: switchListTileValue ??=
                                                              FFAppState()
                                                                  .fltrAgeRangeExt,
                                                          onChanged:
                                                              (newValue) async {
                                                            setState(() =>
                                                                switchListTileValue =
                                                                    newValue!);
                                                          },
                                                          tileColor:
                                                              Color(0xFFF5F5F5),
                                                          activeColor:
                                                              Color(0xFF27AE60),
                                                          activeTrackColor:
                                                              Color(0xFFA0E0BC),
                                                          dense: false,
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .trailing,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0, 0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 90,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8, 8, 8, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Distance Preference',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle1,
                                                  ),
                                                  Text(
                                                    formatNumber(
                                                      sliderDistanceValue,
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '###',
                                                      locale: '',
                                                    ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Slider(
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveColor: Color(0xFFC0C0C0),
                                              min: 0,
                                              max: 100,
                                              value: sliderDistanceValue ??=
                                                  FFAppState().fltrDistance,
                                              onChanged: (newValue) async {
                                                setState(() =>
                                                    sliderDistanceValue =
                                                        newValue);
                                                setState(() =>
                                                    FFAppState().fltrDistance =
                                                        sliderDistanceValue!);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              if (widget.user!.isPremium! ||
                                  !getRemoteConfigBool('check_premium'))
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (widget.user!.isPremium! ||
                                            !getRemoteConfigBool(
                                                'check_premium')) {
                                          setState(() => FFAppState()
                                              .filterName = 'Advanced filters');
                                          await pageViewController?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        } else {
                                          context.pushNamed('GetPremiumView');
                                        }
                                      },
                                      text: 'Advanced filters',
                                      options: FFButtonOptions(
                                        width: 170,
                                        height: 40,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                        elevation: 0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
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
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0, 0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 60,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 8, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Location',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                height: 70,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        FFAppState()
                                                            .fltrAddress,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      buttonSize: 32,
                                                      icon: Icon(
                                                        Icons
                                                            .chevron_right_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                          'ChooseLocationPage',
                                                          queryParams: {
                                                            'currentLocation':
                                                                serializeParam(
                                                              FFAppState()
                                                                  .fltrLocation,
                                                              ParamType.LatLng,
                                                            ),
                                                            'user':
                                                                serializeParam(
                                                              widget.user,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'user': widget.user,
                                                          },
                                                        );
                                                      },
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Text(
                                      'Reset location',
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 16),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0, -1),
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            setState(() => FFAppState()
                                                    .advancedFilterName =
                                                'Advanced2');

                                            context.pushNamed(
                                              'FilterIndustriesView',
                                              queryParams: {
                                                'selectedIndustries':
                                                    serializeParam(
                                                  FFAppState().fltrIndusrtries,
                                                  ParamType.String,
                                                  true,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Industry',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1,
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          buttonSize: 32,
                                                          icon: Icon(
                                                            Icons
                                                                .chevron_right_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 20,
                                                          ),
                                                          onPressed: () async {
                                                            setState(() =>
                                                                FFAppState()
                                                                        .advancedFilterName =
                                                                    'Advanced2');

                                                            context.pushNamed(
                                                              'FilterIndustriesView',
                                                              queryParams: {
                                                                'selectedIndustries':
                                                                    serializeParam(
                                                                  FFAppState()
                                                                      .fltrIndusrtries,
                                                                  ParamType
                                                                      .String,
                                                                  true,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(-1, 0),
                                                child: Text(
                                                  functions.stringifyList(
                                                      FFAppState()
                                                          .fltrIndusrtries
                                                          .toList(),
                                                      2),
                                                  maxLines: 3,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w300,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            setState(() =>
                                FFAppState().fltrGender = ccInterestedInValue!);
                            if (widget.user!.isPremium! ||
                                !getRemoteConfigBool('check_premium')) {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Seet your location'),
                                            content: Text(
                                                'Please confirm if we can use ${FFAppState().fltrAddress} as your location.(${FFAppState().fltrLocation?.toString()}'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text(
                                                    'No, use my device location'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Yep, please'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                final usersUpdateData = createUsersRecordData(
                                  filter: createFilterStruct(
                                    ageRangeExt: false,
                                    distance: sliderDistanceValue,
                                    location: FFAppState().fltrLocation,
                                    address: FFAppState().fltrAddress,
                                    ageRange: createIntRangeStruct(
                                      min: FFAppState().fltrAgeMin,
                                      max: FFAppState().fltrAgeMax,
                                      clearUnsetFields: false,
                                    ),
                                    gender: FFAppState().fltrGender,
                                    fieldValues: {
                                      'lookingFor': FFAppState().fltrLookingFor,
                                      'industries':
                                          FFAppState().fltrIndusrtries,
                                    },
                                    clearUnsetFields: false,
                                  ),
                                  geoposition: FFAppState().fltrLocation,
                                );
                                await currentUserReference!
                                    .update(usersUpdateData);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Done!',
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
                                final usersUpdateData = createUsersRecordData(
                                  filter: createFilterStruct(
                                    ageRangeExt: false,
                                    distance: sliderDistanceValue,
                                    location: FFAppState().fltrLocation,
                                    address: FFAppState().fltrAddress,
                                    ageRange: createIntRangeStruct(
                                      min: FFAppState().fltrAgeMin,
                                      max: FFAppState().fltrAgeMax,
                                      clearUnsetFields: false,
                                    ),
                                    gender: FFAppState().fltrGender,
                                    fieldValues: {
                                      'lookingFor': FFAppState().fltrLookingFor,
                                      'industries':
                                          FFAppState().fltrIndusrtries,
                                    },
                                    clearUnsetFields: false,
                                  ),
                                );
                                await currentUserReference!
                                    .update(usersUpdateData);
                              }
                            } else {
                              final usersUpdateData = createUsersRecordData(
                                filter: createFilterStruct(
                                  ageRangeExt: false,
                                  distance: sliderDistanceValue,
                                  location: FFAppState().fltrLocation,
                                  address: FFAppState().fltrAddress,
                                  ageRange: createIntRangeStruct(
                                    min: FFAppState().fltrAgeMin,
                                    max: FFAppState().fltrAgeMax,
                                    clearUnsetFields: false,
                                  ),
                                  gender: FFAppState().fltrGender,
                                  fieldValues: {
                                    'lookingFor': FFAppState().fltrLookingFor,
                                    'industries': FFAppState().fltrIndusrtries,
                                  },
                                  clearUnsetFields: false,
                                ),
                              );
                              await currentUserReference!
                                  .update(usersUpdateData);
                            }

                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed('HomeView');
                          },
                          text: 'Save',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48,
                            color: Colors.transparent,
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
        ),
      ),
    );
  }
}
