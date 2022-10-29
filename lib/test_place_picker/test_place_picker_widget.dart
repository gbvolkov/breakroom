import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestPlacePickerWidget extends StatefulWidget {
  const TestPlacePickerWidget({Key? key}) : super(key: key);

  @override
  _TestPlacePickerWidgetState createState() => _TestPlacePickerWidgetState();
}

class _TestPlacePickerWidgetState extends State<TestPlacePickerWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var placePickerValue = FFPlace();

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
          onPressed: () {
            print('IconButton pressed ...');
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowPlacePicker(
                iOSGoogleMapsApiKey: 'AIzaSyCGa189ibbYv_GlfmMckfYlsHOEc5RRDSE',
                androidGoogleMapsApiKey:
                    'AIzaSyD3BF3LlQ_jm7HkDSIni9pGeTF-98gV7iA',
                webGoogleMapsApiKey: 'AIzaSyCecli0giGx_CRhnrErLWcGGNnT496HAcg',
                onSelect: (place) async {
                  setState(() => placePickerValue = place);
                },
                defaultText: 'Select Location',
                icon: Icon(
                  Icons.place,
                  color: FlutterFlowTheme.of(context).trueBlack,
                  size: 16,
                ),
                buttonOptions: FFButtonOptions(
                  width: double.infinity,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).trueBlack,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
