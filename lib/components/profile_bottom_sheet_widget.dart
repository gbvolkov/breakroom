import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileBottomSheetWidget extends StatefulWidget {
  const ProfileBottomSheetWidget({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  final UsersRecord? userProfile;

  @override
  _ProfileBottomSheetWidgetState createState() =>
      _ProfileBottomSheetWidgetState();
}

class _ProfileBottomSheetWidgetState extends State<ProfileBottomSheetWidget> {
  List<String>? choiceChipsValues;

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              functions.getPhotosListValue(
                                  widget.userProfile!.photos!.toList(), 0)!,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 4),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.userProfile!.firstName}, ${functions.getAge(widget.userProfile!.birthDay).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                        child: Icon(
                                          Icons.person_outline,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.userProfile!.industry}, ${widget.userProfile!.lastName}',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Chat',
                        options: FFButtonOptions(
                          width: 90,
                          height: 35,
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: FlutterFlowTheme.of(context).alternate,
                        size: 24,
                      ),
                      Text(
                        '12 miles from you',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Bio',
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  widget.userProfile!.bio!,
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                  child: Text(
                    'About me',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: '${widget.userProfile!.height?.toString()} cm',
                        icon: Icon(
                          Icons.height,
                          size: 16,
                        ),
                        options: FFButtonOptions(
                          height: 32,
                          color: FlutterFlowTheme.of(context).backgroundGrey,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontWeight: FontWeight.normal,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: widget.userProfile!.drinkingStatus!,
                        icon: Icon(
                          Icons.wine_bar_outlined,
                          size: 16,
                        ),
                        options: FFButtonOptions(
                          height: 32,
                          color: FlutterFlowTheme.of(context).backgroundGrey,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontWeight: FontWeight.normal,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: widget.userProfile!.smokingStatus!,
                        icon: Icon(
                          Icons.smoking_rooms,
                          size: 16,
                        ),
                        options: FFButtonOptions(
                          height: 32,
                          color: FlutterFlowTheme.of(context).backgroundGrey,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontWeight: FontWeight.normal,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: widget.userProfile!.intention!,
                        icon: Icon(
                          Icons.search_outlined,
                          size: 16,
                        ),
                        options: FFButtonOptions(
                          height: 32,
                          color: FlutterFlowTheme.of(context).backgroundGrey,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontWeight: FontWeight.normal,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                  child: Text(
                    'Interests',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                FutureBuilder<List<InterestsRecord>>(
                  future: queryInterestsRecordOnce(
                    queryBuilder: (interestsRecord) =>
                        interestsRecord.orderBy('interest'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<InterestsRecord> choiceChipsInterestsRecordList =
                        snapshot.data!;
                    return FlutterFlowChoiceChips(
                      initiallySelected:
                          widget.userProfile!.interests!.toList(),
                      options: choiceChipsInterestsRecordList
                          .map((e) => e.interest!)
                          .toList()
                          .map((label) => ChipData(label))
                          .toList(),
                      onChanged: (val) =>
                          setState(() => choiceChipsValues = val),
                      selectedChipStyle: ChipStyle(
                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                        iconColor: Colors.white,
                        iconSize: 18,
                        labelPadding:
                            EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        elevation: 1,
                      ),
                      unselectedChipStyle: ChipStyle(
                        backgroundColor: Colors.white,
                        textStyle: FlutterFlowTheme.of(context).subtitle2,
                        iconColor: Color(0xFF323B45),
                        iconSize: 18,
                        labelPadding:
                            EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        elevation: 4,
                      ),
                      chipSpacing: 20,
                      rowSpacing: 8,
                      multiselect: true,
                      initialized: choiceChipsValues != null,
                      alignment: WrapAlignment.start,
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                shape: BoxShape.circle,
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.thumb_down_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 30,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Container(
                      width: 115,
                      height: 115,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 84,
                              height: 84,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                shape: BoxShape.circle,
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.favorite_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 35,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: Container(
                      width: 80,
                      height: 80,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Color(0xFF27AE60),
                                shape: BoxShape.circle,
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.thumb_up_outlined,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 30,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ),
                        ],
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
