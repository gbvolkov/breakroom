import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_basics_view/edit_basics_view_widget.dart';
import '../edit_bio_view/edit_bio_view_widget.dart';
import '../edit_interests_view/edit_interests_view_widget.dart';
import '../edit_name_view/edit_name_view_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileViewWidget extends StatefulWidget {
  const EditProfileViewWidget({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  final UserProfilesRecord? userProfile;

  @override
  _EditProfileViewWidgetState createState() => _EditProfileViewWidgetState();
}

class _EditProfileViewWidgetState extends State<EditProfileViewWidget> {
  TextEditingController? textController3;

  DateTime? datePicked1;

  TextEditingController? txtBioController;

  TextEditingController? txtNameController;

  String? ddIndustryValue;

  TextEditingController? txtBirthdayController;

  DateTime? datePicked2;
  String? ddGenderValue;
  String? ddPreferenceValue;
  String? ddStatusValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController3 = TextEditingController(text: 'Surgeon');
    txtBioController =
        TextEditingController(text: 'Amet minim mollit non deme...');
    txtNameController = TextEditingController(
        text: valueOrDefault<String>(
      widget.userProfile!.firstName,
      'ND',
    ));
    txtBirthdayController = TextEditingController();
  }

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
        title: Align(
          alignment: AlignmentDirectional(-0.15, 0),
          child: Text(
            'Edit profile',
            style: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
                    child: Container(
                      width: 200,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 105,
                              height: 105,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, -0.05),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  print('Button pressed ...');
                                },
                                text: 'Change profile photo',
                                options: FFButtonOptions(
                                  width: 300,
                                  height: 32,
                                  color: FlutterFlowTheme.of(context)
                                      .backgroundGrey,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontWeight: FontWeight.normal,
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    Stack(
                      alignment: AlignmentDirectional(1, 0),
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.67,
                          child: TextFormField(
                            controller: txtNameController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                                reverseDuration: Duration(milliseconds: 300),
                                child: EditNameViewWidget(
                                  userProfile: widget.userProfile,
                                ),
                              ),
                            );
                          },
                          text: '',
                          icon: Icon(
                            Icons.chevron_right,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 32,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bio',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    Stack(
                      alignment: AlignmentDirectional(1, 0),
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.67,
                          child: TextFormField(
                            controller: txtBioController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditBioViewWidget(),
                              ),
                            );
                          },
                          text: '',
                          icon: Icon(
                            Icons.chevron_right,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 32,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Industry',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Stack(
                        alignment: AlignmentDirectional(1, 0),
                        children: [
                          FutureBuilder<List<IndustriesRecord>>(
                            future: queryIndustriesRecordOnce(
                              queryBuilder: (industriesRecord) =>
                                  industriesRecord.orderBy('industry'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<IndustriesRecord>
                                  ddIndustryIndustriesRecordList =
                                  snapshot.data!;
                              return FlutterFlowDropDown(
                                options: ddIndustryIndustriesRecordList
                                    .map((e) => e.industry!)
                                    .toList()
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => ddIndustryValue = val),
                                width: MediaQuery.of(context).size.width * 0.7,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                    ),
                                hintText: 'Please select...',
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Occupation',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    Stack(
                      alignment: AlignmentDirectional(1, 0),
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.67,
                          child: TextFormField(
                            controller: textController3,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (date) {
                                setState(() => datePicked1 = date);
                              },
                              currentTime: getCurrentTimestamp,
                              minTime: DateTime(0, 0, 0),
                            );
                          },
                          text: '',
                          icon: Icon(
                            Icons.chevron_right,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 32,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date of birth',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    Stack(
                      alignment: AlignmentDirectional(1, 0),
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.67,
                          child: TextFormField(
                            controller: txtBirthdayController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            await DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              onConfirm: (date) {
                                setState(() => datePicked2 = date);
                              },
                              currentTime: widget.userProfile!.birthDay!,
                              minTime: DateTime(0, 0, 0),
                            );
                          },
                          text: '',
                          icon: Icon(
                            Icons.chevron_right,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 32,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Gender',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Stack(
                        alignment: AlignmentDirectional(1, 0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: FlutterFlowDropDown(
                              options: FFAppState().genders.toList(),
                              onChanged: (val) =>
                                  setState(() => ddGenderValue = val),
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                  ),
                              hintText: 'Please select...',
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              borderRadius: 0,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Preferences',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Stack(
                        alignment: AlignmentDirectional(1, 0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: FlutterFlowDropDown(
                              options: FFAppState().genders.toList(),
                              onChanged: (val) =>
                                  setState(() => ddPreferenceValue = val),
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                  ),
                              hintText: 'Please select...',
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              borderRadius: 0,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Stack(
                        alignment: AlignmentDirectional(1, 0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: FlutterFlowDropDown(
                              options: FFAppState().intentions.toList(),
                              onChanged: (val) =>
                                  setState(() => ddStatusValue = val),
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 50,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                  ),
                              hintText: 'Please select...',
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              borderRadius: 0,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Interests',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Roboto',
                            lineHeight: 4,
                          ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Stack(
                        alignment: AlignmentDirectional(1, 0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Text(
                              'Blogging, Food, Sport, Karaoke...',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Roboto',
                                    lineHeight: 4,
                                  ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditInterestsViewWidget(),
                                ),
                              );
                            },
                            text: '',
                            icon: Icon(
                              Icons.chevron_right,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 15,
                            ),
                            options: FFButtonOptions(
                              width: 32,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Basics',
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Roboto',
                            lineHeight: 4,
                          ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional(1, 0),
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditBasicsViewWidget(),
                              ),
                            );
                          },
                          text: '',
                          icon: Icon(
                            Icons.chevron_right,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 15,
                          ),
                          options: FFButtonOptions(
                            width: 32,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final userProfilesUpdateData =
                            createUserProfilesRecordData(
                          firstName: widget.userProfile!.firstName,
                          lastName: widget.userProfile!.lastName,
                        );
                        await widget.userProfile!.reference
                            .update(userProfilesUpdateData);
                        Navigator.pop(context);
                      },
                      text: 'Save',
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
