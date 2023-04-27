import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filters_view_model.dart';
export 'filters_view_model.dart';

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
  late FiltersViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;
  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltersViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
              if (pageViewCurrentIndex == 0) {
                context.pop();
              } else {
                FFAppState().update(() {
                  FFAppState().filterName = 'Filter';
                });
                await _model.pageViewController?.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
          ),
          title: Text(
            FFAppState().filterName,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(widget.user!.reference),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  );
                }
                final columnUsersRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 1.0,
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      'I\'m interested in',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: FlutterFlowChoiceChips(
                                      options: FFAppState()
                                          .interestedInList
                                          .map((label) => ChipData(label))
                                          .toList(),
                                      onChanged: (val) => setState(() => _model
                                          .ccInterestedInValue = val?.first),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w300,
                                            ),
                                        iconColor: Color(0xFF323B45),
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                      ),
                                      chipSpacing: 4.0,
                                      multiselect: false,
                                      initialized:
                                          _model.ccInterestedInValue != null,
                                      alignment: WrapAlignment.spaceEvenly,
                                      controller: _model
                                              .ccInterestedInValueController ??=
                                          FormFieldController<List<String>>(
                                        [FFAppState().fltrGender],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Text(
                                      'Age',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
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
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            'Between ${formatNumber(
                                                              FFAppState()
                                                                  .fltrAgeMin,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '###',
                                                              locale: '',
                                                            )} and ${formatNumber(
                                                              FFAppState()
                                                                  .fltrAgeMax,
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '###',
                                                              locale: '',
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                      height: 50.0,
                                                      child: custom_widgets
                                                          .CustomRangeSlider(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                        height: 50.0,
                                                        minValue: 18,
                                                        maxValue: 100,
                                                        rangeStart: FFAppState()
                                                            .fltrAgeMin,
                                                        rangeEnd: FFAppState()
                                                            .fltrAgeMax,
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        inactiveColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        onValueChanged:
                                                            () async {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .fltrAgeMin =
                                                                FFAppState()
                                                                    .rangeSliderStart;
                                                            FFAppState()
                                                                    .fltrAgeMax =
                                                                FFAppState()
                                                                    .rangeSliderEnd;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    if (false)
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'See people 2 years either\nside if I run out',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Expanded(
                                                            child:
                                                                SwitchListTile(
                                                              value: _model
                                                                      .switchListTileValue ??=
                                                                  FFAppState()
                                                                      .fltrAgeRangeExt,
                                                              onChanged:
                                                                  (newValue) async {
                                                                setState(() =>
                                                                    _model.switchListTileValue =
                                                                        newValue!);
                                                              },
                                                              tileColor: Color(
                                                                  0xFFF5F5F5),
                                                              activeColor: Color(
                                                                  0xFF27AE60),
                                                              activeTrackColor:
                                                                  Color(
                                                                      0xFFA0E0BC),
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
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1.0,
                                                height: 90.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Distance Preference',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium,
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          _model
                                                              .sliderDistanceValue,
                                                          formatType:
                                                              FormatType.custom,
                                                          format: '###',
                                                          locale: '',
                                                        ),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Slider(
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  inactiveColor:
                                                      Color(0xFFC0C0C0),
                                                  min: 0.0,
                                                  max: 100.0,
                                                  value: _model
                                                          .sliderDistanceValue ??=
                                                      FFAppState().fltrDistance,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                            .sliderDistanceValue =
                                                        newValue);
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .fltrDistance =
                                                          _model
                                                              .sliderDistanceValue!;
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (columnUsersRecord.isPremium! ||
                                              !getRemoteConfigBool(
                                                  'check_premium') ||
                                              revenue_cat.activeEntitlementIds
                                                  .contains(FFAppState()
                                                      .entAdvFilter)) {
                                            FFAppState().update(() {
                                              FFAppState().filterName =
                                                  'Advanced filters';
                                            });
                                            await _model.pageViewController
                                                ?.nextPage(
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.ease,
                                            );
                                          } else {
                                            context.pushNamed(
                                              'GetPremiumView',
                                              queryParams: {
                                                'user': serializeParam(
                                                  widget.user,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'user': widget.user,
                                              },
                                            );
                                          }
                                        },
                                        text: 'Advanced filters',
                                        options: FFButtonOptions(
                                          width: 170.0,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Location',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  height: 70.0,
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
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
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
                                                        borderRadius: 30.0,
                                                        buttonSize: 32.0,
                                                        icon: Icon(
                                                          Icons
                                                              .chevron_right_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            'ChooseLocationPage',
                                                            queryParams: {
                                                              'currentLocation':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .fltrLocation,
                                                                ParamType
                                                                    .LatLng,
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
                                                              'user':
                                                                  widget.user,
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
                                      if (widget.user!.isPremium! ||
                                          !getRemoteConfigBool(
                                              'check_premium') ||
                                          revenue_cat.activeEntitlementIds
                                              .contains(FFAppState()
                                                  .entResetLocation))
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 8.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  currentUserLocationValue =
                                                      await getCurrentUserLocation(
                                                          defaultLocation:
                                                              LatLng(0.0, 0.0));
                                                  if ((await getPermissionStatus(
                                                          locationPermission)) &&
                                                      functions.isLocationSet(
                                                          currentUserLocationValue)) {
                                                    FFAppState().update(() {
                                                      FFAppState().tmpLocation =
                                                          currentUserLocationValue;
                                                    });
                                                  } else {
                                                    FFAppState().update(() {
                                                      FFAppState().tmpLocation =
                                                          widget.user!
                                                              .geoposition;
                                                    });
                                                  }

                                                  _model.address = await actions
                                                      .getAddressFromLocation(
                                                    FFAppState().tmpLocation!,
                                                  );
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Please, confirm your location.'),
                                                                content: Text(
                                                                    'Your location will be set to ${_model.address}'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                    child: Text(
                                                                        'Cancel'),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                    child: Text(
                                                                        'Confirm'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .fltrLocation =
                                                          FFAppState()
                                                              .tmpLocation;
                                                      FFAppState().fltrAddress =
                                                          _model.address!;
                                                    });
                                                  }

                                                  setState(() {});
                                                },
                                                child: Container(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Text(
                                                      'Reset location',
                                                      textAlign: TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().update(() {
                                                  FFAppState()
                                                          .advancedFilterName =
                                                      'Advanced2';
                                                });

                                                context.pushNamed(
                                                  'FilterIndustriesView',
                                                  queryParams: {
                                                    'selectedIndustries':
                                                        serializeParam(
                                                      FFAppState()
                                                          .fltrIndusrtries,
                                                      ParamType.String,
                                                      true,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Industry',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  30.0,
                                                              buttonSize: 32.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .chevron_right_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 20.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .advancedFilterName =
                                                                      'Advanced2';
                                                                });

                                                                context
                                                                    .pushNamed(
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
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      functions.stringifyList(
                                                          FFAppState()
                                                              .fltrIndusrtries
                                                              .toList(),
                                                          2),
                                                      maxLines: 3,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().update(() {
                                  FFAppState().fltrGender =
                                      _model.ccInterestedInValue!;
                                });
                                if (widget.user!.isPremium! ||
                                    !getRemoteConfigBool('check_premium') ||
                                    revenue_cat.activeEntitlementIds.contains(
                                        FFAppState().entResetLocation)) {
                                  final usersUpdateData1 =
                                      createUsersRecordData(
                                    filter: createFilterStruct(
                                      ageRangeExt: false,
                                      distance: _model.sliderDistanceValue,
                                      location: FFAppState().fltrLocation,
                                      address: FFAppState().fltrAddress,
                                      ageRange: createIntRangeStruct(
                                        min: FFAppState().fltrAgeMin,
                                        max: FFAppState().fltrAgeMax,
                                        clearUnsetFields: false,
                                      ),
                                      gender: FFAppState().fltrGender,
                                      fieldValues: {
                                        'lookingFor':
                                            FFAppState().fltrLookingFor,
                                        'industries':
                                            FFAppState().fltrIndusrtries,
                                      },
                                      clearUnsetFields: false,
                                    ),
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData1);
                                } else {
                                  final usersUpdateData2 =
                                      createUsersRecordData(
                                    filter: createFilterStruct(
                                      ageRangeExt: false,
                                      distance: _model.sliderDistanceValue,
                                      location: FFAppState().fltrLocation,
                                      address: FFAppState().fltrAddress,
                                      ageRange: createIntRangeStruct(
                                        min: FFAppState().fltrAgeMin,
                                        max: FFAppState().fltrAgeMax,
                                        clearUnsetFields: false,
                                      ),
                                      gender: FFAppState().fltrGender,
                                      fieldValues: {
                                        'lookingFor':
                                            FFAppState().fltrLookingFor,
                                        'industries':
                                            FFAppState().fltrIndusrtries,
                                      },
                                      clearUnsetFields: false,
                                    ),
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData2);
                                }

                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed('HomeView');
                              },
                              text: 'Save',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 48.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
