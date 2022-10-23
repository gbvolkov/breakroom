import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/lat_lng.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapPlaceCardWidget extends StatefulWidget {
  const MapPlaceCardWidget({
    Key? key,
    this.marker,
  }) : super(key: key);

  final LatLng? marker;

  @override
  _MapPlaceCardWidgetState createState() => _MapPlaceCardWidgetState();
}

class _MapPlaceCardWidgetState extends State<MapPlaceCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            valueOrDefault<String>(
              widget.marker?.toString(),
              'NA',
            ),
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ],
      ),
    );
  }
}
