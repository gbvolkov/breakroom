import '../components/map_place_card_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/lat_lng.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
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
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  var placePickerValue = FFPlace();
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
          onPressed: () {
            print('IconButton pressed ...');
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
          FlutterFlowPlacePicker(
            iOSGoogleMapsApiKey: 'AIzaSyCGa189ibbYv_GlfmMckfYlsHOEc5RRDSE',
            androidGoogleMapsApiKey: 'AIzaSyD3BF3LlQ_jm7HkDSIni9pGeTF-98gV7iA',
            webGoogleMapsApiKey: 'AIzaSyCecli0giGx_CRhnrErLWcGGNnT496HAcg',
            onSelect: (place) async {
              setState(() => placePickerValue = place);
            },
            defaultText: 'Select Location',
            icon: Icon(
              Icons.place,
              color: Colors.white,
              size: 16,
            ),
            buttonOptions: FFButtonOptions(
              width: double.infinity,
              height: 40,
              color: FlutterFlowTheme.of(context).primaryColor,
              textStyle: FlutterFlowTheme.of(context).title2,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: MapPlaceCardWidget(
                              marker: googleMapsCenter,
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(),
                      child: Builder(builder: (context) {
                        final _googleMapMarker = functions
                            .getUserLocation(FFAppState().fltrLocation);
                        return FlutterFlowGoogleMap(
                          controller: googleMapsController,
                          onCameraIdle: (latLng) => googleMapsCenter = latLng,
                          initialLocation: googleMapsCenter ??=
                              functions.getUserLocation(widget.currentLocation),
                          markers: [
                            FlutterFlowMarker(
                              _googleMapMarker.serialize(),
                              _googleMapMarker,
                              () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: MapPlaceCardWidget(
                                        marker: googleMapsCenter,
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
