import '../end_drawer_test/end_drawer_test_widget.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SwipeableCardSectionController swipeableStackController;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.swipeAction == 'left') {
        swipeableStackController.triggerSwipeLeft();
      }
    });

    swipeableStackController = SwipeableCardSectionController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'No more matches',
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                    ),
                  ),
                  FlutterFlowSwipeableStack(
                    topCardHeightFraction: 0.72,
                    middleCardHeightFraction: 0.68,
                    botttomCardHeightFraction: 0.75,
                    topCardWidthFraction: 0.9,
                    middleCardWidthFraction: 0.85,
                    botttomCardWidthFraction: 0.8,
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
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EndDrawerTestWidget(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Card1',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                            ),
                        () => Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Text(
                                'Card2',
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                        () => Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Text(
                                'Card3',
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                        () => Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Text(
                                'Card4',
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                        () => Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Text(
                                'Card5',
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                      ][index]();
                    },
                    itemCount: 5,
                    controller: swipeableStackController,
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
