import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InteractionTypeIconWidgetWidget extends StatefulWidget {
  const InteractionTypeIconWidgetWidget({
    Key? key,
    this.type,
  }) : super(key: key);

  final String? type;

  @override
  _InteractionTypeIconWidgetWidgetState createState() =>
      _InteractionTypeIconWidgetWidgetState();
}

class _InteractionTypeIconWidgetWidgetState
    extends State<InteractionTypeIconWidgetWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.type == 'like')
          Container(
            width: 48,
            height: 48,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/notification-like.png',
            ),
          ),
        if (widget.type == 'match')
          Container(
            width: 48,
            height: 48,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/notification-match.png',
            ),
          ),
        if ((widget.type != 'like') && (widget.type != 'match'))
          Container(
            width: 48,
            height: 48,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/notification-message.png',
            ),
          ),
      ],
    );
  }
}
