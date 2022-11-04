import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestCheckBoxesWidget extends StatefulWidget {
  const TestCheckBoxesWidget({Key? key}) : super(key: key);

  @override
  _TestCheckBoxesWidgetState createState() => _TestCheckBoxesWidgetState();
}

class _TestCheckBoxesWidgetState extends State<TestCheckBoxesWidget> {
  Map<String, bool> checkboxListTileValueMap = {};
  List<String> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  List<String>? checkboxGroupValues;
  bool? checkboxValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        shape: CircleBorder(),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).grayIcon,
                    ),
                    child: Checkbox(
                      value: checkboxValue ??= true,
                      onChanged: (newValue) async {
                        setState(() => checkboxValue = newValue!);
                      },
                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                      checkColor: FlutterFlowTheme.of(context).systemWarning,
                    ),
                  ),
                ],
              ),
              FlutterFlowCheckboxGroup(
                initiallySelected: ['IT', 'Government'],
                options: ['IT', 'Agriculture', 'Government'],
                onChanged: (val) => setState(() => checkboxGroupValues = val),
                activeColor: FlutterFlowTheme.of(context).primaryColor,
                checkColor: FlutterFlowTheme.of(context).alternate,
                checkboxBorderColor: Color(0xFF95A1AC),
                textStyle: FlutterFlowTheme.of(context).bodyText1,
                initialized: checkboxGroupValues != null,
              ),
              Builder(
                builder: (context) {
                  final chkListTest = FFAppState()
                      .childrenOptionsList
                      .toList()
                      .take(5)
                      .toList();
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: chkListTest.length,
                    itemBuilder: (context, chkListTestIndex) {
                      final chkListTestItem = chkListTest[chkListTestIndex];
                      return Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: CheckboxListTile(
                          value: checkboxListTileValueMap[chkListTestItem] ??=
                              true,
                          onChanged: (newValue) async {
                            setState(() =>
                                checkboxListTileValueMap[chkListTestItem] =
                                    newValue!);
                          },
                          title: Text(
                            'IT',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          tileColor: Color(0xFFF5F5F5),
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          checkColor: FlutterFlowTheme.of(context).alternate,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
