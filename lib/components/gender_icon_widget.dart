import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'gender_icon_model.dart';
export 'gender_icon_model.dart';

class GenderIconWidget extends StatefulWidget {
  const GenderIconWidget({
    Key? key,
    this.gender,
    this.maleIcon,
    this.femaleIcon,
  }) : super(key: key);

  final String? gender;
  final Widget? maleIcon;
  final Widget? femaleIcon;

  @override
  _GenderIconWidgetState createState() => _GenderIconWidgetState();
}

class _GenderIconWidgetState extends State<GenderIconWidget> {
  late GenderIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenderIconModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.gender == 'Male')
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
            child: widget.maleIcon!,
          ),
        if (widget.gender != 'Male') widget.femaleIcon!,
      ],
    );
  }
}
