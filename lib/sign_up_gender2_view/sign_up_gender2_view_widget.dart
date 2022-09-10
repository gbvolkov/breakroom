import '../components/dialog_signup_complete_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpGender2ViewWidget extends StatefulWidget {
  const SignUpGender2ViewWidget({Key? key}) : super(key: key);

  @override
  _SignUpGender2ViewWidgetState createState() =>
      _SignUpGender2ViewWidgetState();
}

class _SignUpGender2ViewWidgetState extends State<SignUpGender2ViewWidget> {
  String? choiceChipsValue1;
  String? choiceChipsValue2;
  String? radioButtonValue;
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
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).alternate,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
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
        actions: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
              child: Text(
                '2 / 7',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 48),
                        child: Text(
                          'Gender',
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Poppins',
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'Your Gender',
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                        child: FlutterFlowChoiceChips(
                          initiallySelected: [
                            if (choiceChipsValue1 != null) choiceChipsValue1!
                          ],
                          options: [ChipData('Male'), ChipData('Female')],
                          onChanged: (val) =>
                              setState(() => choiceChipsValue1 = val?.first),
                          selectedChipStyle: ChipStyle(
                            backgroundColor: Color(0xFF323B45),
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                            iconColor: Colors.white,
                            iconSize: 18,
                            elevation: 4,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: Colors.white,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF323B45),
                                    ),
                            iconColor: Color(0xFF323B45),
                            iconSize: 18,
                            elevation: 4,
                          ),
                          chipSpacing: 30,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Text(
                          'Gender Preference',
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: FlutterFlowChoiceChips(
                          initiallySelected: [
                            if (choiceChipsValue2 != null) choiceChipsValue2!
                          ],
                          options: [ChipData('Male'), ChipData('Female')],
                          onChanged: (val) =>
                              setState(() => choiceChipsValue2 = val?.first),
                          selectedChipStyle: ChipStyle(
                            backgroundColor: Color(0xFF323B45),
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                            iconColor: Colors.white,
                            iconSize: 18,
                            elevation: 4,
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: Colors.white,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF323B45),
                                    ),
                            iconColor: Color(0xFF323B45),
                            iconSize: 18,
                            elevation: 4,
                          ),
                          chipSpacing: 30,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: FlutterFlowRadioButton(
                      options: ['Option 1', 'Option 2'].toList(),
                      onChanged: (value) {
                        setState(() => radioButtonValue = value);
                      },
                      optionHeight: 25,
                      textStyle: FlutterFlowTheme.of(context).subtitle1,
                      selectedTextStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                      buttonPosition: RadioButtonPosition.left,
                      direction: Axis.horizontal,
                      radioButtonColor: FlutterFlowTheme.of(context).alternate,
                      inactiveRadioButtonColor: Color(0x8A000000),
                      toggleable: false,
                      horizontalAlignment: WrapAlignment.start,
                      verticalAlignment: WrapCrossAlignment.start,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: custom_widgets.MyRadioButton(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    buttonLabels: FFAppState().testOptions.toList(),
                    buttonValues: FFAppState().testOptions.toList(),
                    horizontal: true,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: DialogSignupCompleteWidget(),
                            );
                          },
                        );
                      },
                      text: 'Next',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48,
                        color: FlutterFlowTheme.of(context).alternate,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle1
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryColor,
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
        ),
      ),
    );
  }
}
