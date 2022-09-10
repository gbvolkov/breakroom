import '../components/dialog_signup_complete_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpInterests8ViewWidget extends StatefulWidget {
  const SignUpInterests8ViewWidget({Key? key}) : super(key: key);

  @override
  _SignUpInterests8ViewWidgetState createState() =>
      _SignUpInterests8ViewWidgetState();
}

class _SignUpInterests8ViewWidgetState
    extends State<SignUpInterests8ViewWidget> {
  List<String>? choiceChipsValues;
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
                '4 / 7',
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 48),
                      child: Text(
                        'What are you \ninterested in?',
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                      child: FlutterFlowChoiceChips(
                        initiallySelected: choiceChipsValues != null
                            ? choiceChipsValues
                            : ['Food', 'Sport'],
                        options: [
                          ChipData('Blogging'),
                          ChipData('Photography'),
                          ChipData('Food'),
                          ChipData('Sport'),
                          ChipData('Karaoke'),
                          ChipData('Travelling'),
                          ChipData('Photography'),
                          ChipData('Lorem ipsum'),
                          ChipData('Something')
                        ],
                        onChanged: (val) =>
                            setState(() => choiceChipsValues = val),
                        selectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                          iconColor: Colors.white,
                          iconSize: 18,
                          labelPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                          elevation: 4,
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Colors.white,
                          textStyle: FlutterFlowTheme.of(context).subtitle2,
                          iconColor: Color(0xFF323B45),
                          iconSize: 18,
                          labelPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                          elevation: 4,
                        ),
                        chipSpacing: 15,
                        rowSpacing: 10,
                        multiselect: true,
                        initialized: choiceChipsValues != null,
                        alignment: WrapAlignment.start,
                      ),
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
      ),
    );
  }
}
