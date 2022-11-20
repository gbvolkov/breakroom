import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/lat_lng.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseLocationPageWidget extends StatefulWidget {
  const ChooseLocationPageWidget({
    Key? key,
    this.currentLocation,
  }) : super(key: key);

  final LatLng? currentLocation;

  @override
  _ChooseLocationPageWidgetState createState() =>
      _ChooseLocationPageWidgetState();
}

class _ChooseLocationPageWidgetState extends State<ChooseLocationPageWidget> {
  FFPlace? place;
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  String? address;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFEFEFEF),
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
            context.goNamed(
              'FiltersView',
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          },
        ),
        title: Text(
          'Find your matches at...',
          style: FlutterFlowTheme.of(context).title3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 86),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(),
                      child: Builder(builder: (context) {
                        final _googleMapMarker = functions.getUserLocation(
                            FFAppState().fltrLocation,
                            FFAppState().fltrLocation);
                        return FlutterFlowGoogleMap(
                          controller: googleMapsController,
                          onCameraIdle: (latLng) => googleMapsCenter = latLng,
                          initialLocation: googleMapsCenter ??=
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
                          initialZoom: 14,
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
                      setState(
                          () => FFAppState().fltrLocation = googleMapsCenter);
                      address = await actions.getAddressFromLocation(
                        FFAppState().fltrLocation!,
                      );
                      setState(() => FFAppState().fltrAddress = address!);

                      setState(() {});
                    },
                    text: 'Set',
                    options: FFButtonOptions(
                      width: 80,
                      height: 40,
                      color: Color(0xBEF95A82),
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle1
                          .override(
                            fontFamily: 'Roboto',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Text(
                                  FFAppState().fltrAddress,
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                buttonSize: 40,
                                icon: Icon(
                                  Icons.place,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 20,
                                ),
                                onPressed: () async {
                                  place = await actions.placePickerAction(
                                    context,
                                    FFAppState().fltrLocation,
                                    FFAppState().fltrAddress,
                                  );
                                  setState(() => FFAppState().fltrLocation =
                                      place!.latLng);
                                  setState(() => FFAppState().fltrAddress =
                                      place!.address);
                                  await googleMapsController.future.then(
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
    );
  }
}
