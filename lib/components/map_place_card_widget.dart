import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'map_place_card_model.dart';
export 'map_place_card_model.dart';

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
  late MapPlaceCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapPlaceCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
        ],
      ),
    );
  }
}
