import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikesLimitExceedWidgetWidget extends StatefulWidget {
  const LikesLimitExceedWidgetWidget({
    Key? key,
    this.user,
    this.showTime,
    this.back,
  }) : super(key: key);

  final UsersRecord? user;
  final bool? showTime;
  final String? back;

  @override
  _LikesLimitExceedWidgetWidgetState createState() =>
      _LikesLimitExceedWidgetWidgetState();
}

class _LikesLimitExceedWidgetWidgetState
    extends State<LikesLimitExceedWidgetWidget> {
  bool? didPurchase;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 3.43,
      height: 439,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBtnText,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                  child: Text(
                    'Switch to Premium Plus',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                if (widget.showTime ?? true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                    child: Text(
                      'Your daily 10 likes limit has been reached.\nPlease, subscribe to unlock the unlimited likes',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 110,
                            height: 120,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Container(
                                    width: 83,
                                    height: 22,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      '12 months',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 17,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: Container(
                                    width: 83,
                                    height: 32,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: ClipRRect(
                                    child: Container(
                                      width: 100,
                                      height: 32,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: double.infinity,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                revenue_cat
                                                    .offerings!
                                                    .current!
                                                    .annual!
                                                    .product
                                                    .priceString,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 2, 0, 0),
                                            child: Text(
                                              '${formatNumber(
                                                functions.mdiv(
                                                    revenue_cat
                                                        .offerings!
                                                        .current!
                                                        .annual!
                                                        .product
                                                        .price,
                                                    12),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )}/m',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 10,
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
                          if (FFAppState().selectedPackage !=
                              revenue_cat
                                  .offerings!.current!.annual!.identifier)
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().selectedPackage =
                                    revenue_cat.offerings!.current!.annual!
                                        .identifier);
                              },
                              child: Container(
                                width: 110,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Color(0x7FF5F5F5),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 110,
                            height: 120,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFEE837B),
                                  Color(0xFFF95A82),
                                  Color(0xFFEA3C7D)
                                ],
                                stops: [0.13, 0.69, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Container(
                                    width: 83,
                                    height: 22,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      '3 months',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontSize: 17,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: Container(
                                    width: 83,
                                    height: 32,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: AutoSizeText(
                                      'With a 50% savings',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: ClipRRect(
                                    child: Container(
                                      width: 100,
                                      height: 32,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: double.infinity,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                revenue_cat
                                                    .offerings!
                                                    .current!
                                                    .threeMonth!
                                                    .product
                                                    .priceString,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 2, 0, 0),
                                            child: Text(
                                              '${formatNumber(
                                                functions.mdiv(
                                                    revenue_cat
                                                        .offerings!
                                                        .current!
                                                        .threeMonth!
                                                        .product
                                                        .price,
                                                    3),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )}/m',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        fontSize: 10,
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
                          if (FFAppState().selectedPackage !=
                              revenue_cat
                                  .offerings!.current!.threeMonth!.identifier)
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().selectedPackage =
                                    revenue_cat.offerings!.current!.threeMonth!
                                        .identifier);
                              },
                              child: Container(
                                width: 110,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Color(0x7FF5F5F5),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: 110,
                            height: 120,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Container(
                                    width: 83,
                                    height: 22,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      '1 month',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 17,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 0),
                                  child: Container(
                                    width: 83,
                                    height: 32,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                      maxHeight: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: ClipRRect(
                                    child: Container(
                                      width: 100,
                                      height: 32,
                                      constraints: BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: double.infinity,
                                      ),
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AutoSizeText(
                                                revenue_cat
                                                    .offerings!
                                                    .current!
                                                    .monthly!
                                                    .product
                                                    .priceString,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 2, 0, 0),
                                            child: Text(
                                              '${formatNumber(
                                                functions.mdiv(
                                                    revenue_cat
                                                        .offerings!
                                                        .current!
                                                        .monthly!
                                                        .product
                                                        .price,
                                                    1),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              )}/m',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 10,
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
                          if (FFAppState().selectedPackage !=
                              revenue_cat
                                  .offerings!.current!.monthly!.identifier)
                            InkWell(
                              onTap: () async {
                                setState(() => FFAppState().selectedPackage =
                                    revenue_cat.offerings!.current!.monthly!
                                        .identifier);
                              },
                              child: Container(
                                width: 110,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Color(0x7FF5F5F5),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (widget.showTime ?? true)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                    child: Text(
                      functions.getTimeToNoon(),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFEE837B),
                          Color(0xFFF95A82),
                          Color(0xFFEA3C7D)
                        ],
                        stops: [0.13, 0.69, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        didPurchase = await revenue_cat
                            .purchasePackage(FFAppState().selectedPackage);
                        if (didPurchase!) {
                          final usersUpdateData = createUsersRecordData(
                            isPremium: true,
                          );
                          await currentUserReference!.update(usersUpdateData);
                        }
                        Navigator.pop(context, didPurchase);

                        setState(() {});
                      },
                      text: 'Continue',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48,
                        color: Colors.transparent,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle1
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  if (FFAppState().selectedPackage == null ||
                      FFAppState().selectedPackage == '')
                    Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color(0x80F5F5F5),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
