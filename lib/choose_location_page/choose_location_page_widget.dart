import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_location_page_model.dart';
export 'choose_location_page_model.dart';

class ChooseLocationPageWidget extends StatefulWidget {
  const ChooseLocationPageWidget({
    Key? key,
    this.currentLocation,
    this.user,
  }) : super(key: key);

  final LatLng? currentLocation;
  final UsersRecord? user;

  @override
  _ChooseLocationPageWidgetState createState() =>
      _ChooseLocationPageWidgetState();
}

class _ChooseLocationPageWidgetState extends State<ChooseLocationPageWidget> {
  late ChooseLocationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseLocationPageModel());
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFEFEFEF),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Find your matches at...',
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 86.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 1.0,
                          decoration: BoxDecoration(),
                          child: Builder(builder: (context) {
                            final _googleMapMarker = functions.getUserLocation(
                                FFAppState().fltrLocation,
                                FFAppState().fltrLocation);
                            return FlutterFlowGoogleMap(
                              controller: _model.googleMapsController,
                              onCameraIdle: (latLng) =>
                                  _model.googleMapsCenter = latLng,
                              initialLocation: _model.googleMapsCenter ??=
                                  functions.getUserLocation(
                                      FFAppState().fltrLocation,
                                      FFAppState().fltrLocation),
                              markers: [
                                FlutterFlowMarker(
                                  _googleMapMarker.serialize(),
                                  _googleMapMarker,
                                ),
                              ],
                              markerColor: GoogleMarkerColor.violet,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 14.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: false,
                              showMapToolbar: true,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            );
                          }),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.04, 0.93),
                      child: FFButtonWidget(
                        onPressed: () async {
                          FFAppState().update(() {
                            FFAppState().fltrLocation = _model.googleMapsCenter;
                          });
                          _model.address = await actions.getAddressFromLocation(
                            FFAppState().fltrLocation!,
                          );
                          FFAppState().update(() {
                            FFAppState().fltrAddress = _model.address!;
                          });

                          setState(() {});
                        },
                        text: 'Set',
                        options: FFButtonOptions(
                          width: 80.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xBEF95A82),
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Text(
                                      FFAppState().fltrAddress,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.place,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      _model.place =
                                          await actions.placePickerAction(
                                        context,
                                        FFAppState().fltrLocation,
                                        FFAppState().fltrAddress,
                                      );
                                      FFAppState().update(() {
                                        FFAppState().fltrLocation =
                                            _model.place!.latLng;
                                        FFAppState().fltrAddress =
                                            _model.place!.address;
                                      });
                                      await _model.googleMapsController.future
                                          .then(
                                        (c) => c.animateCamera(
                                          CameraUpdate.newLatLng(FFAppState()
                                              .fltrLocation!
                                              .toGoogleMaps()),
                                        ),
                                      );

                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
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
    );
  }
}
