import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'page_test_model.dart';
export 'page_test_model.dart';

class PageTestWidget extends StatefulWidget {
  const PageTestWidget({
    Key? key,
    this.swipeAction,
  }) : super(key: key);

  final String? swipeAction;

  @override
  _PageTestWidgetState createState() => _PageTestWidgetState();
}

class _PageTestWidgetState extends State<PageTestWidget> {
  late PageTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageTestModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.swipeAction == 'left') {
        _model.swipeableStackController.triggerSwipeLeft();
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'No more matches',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                    ),
                  ),
                  FlutterFlowSwipeableStack(
                    topCardHeightFraction: 0.72,
                    middleCardHeightFraction: 0.68,
                    bottomCardHeightFraction: 0.75,
                    topCardWidthFraction: 0.9,
                    middleCardWidthFraction: 0.85,
                    bottomCardWidthFraction: 0.8,
                    onSwipeFn: (index) {},
                    onLeftSwipe: (index) {},
                    onRightSwipe: (index) {},
                    onUpSwipe: (index) {},
                    onDownSwipe: (index) {},
                    itemBuilder: (context, index) {
                      return [
                        () => Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('EndDrawerTest');
                                },
                                child: Text(
                                  'Card1',
                                  style:
                                      FlutterFlowTheme.of(context).displaySmall,
                                ),
                              ),
                            ),
                        () => Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Text(
                                'Card2',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                        () => Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Text(
                                'Card3',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                        () => Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Text(
                                'Card4',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                        () => Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Text(
                                'Card5',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ),
                      ][index]();
                    },
                    itemCount: 5,
                    controller: _model.swipeableStackController,
                    enableSwipeUp: false,
                    enableSwipeDown: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
