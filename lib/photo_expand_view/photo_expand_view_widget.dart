import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/delete_photo_widget_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoExpandViewWidget extends StatefulWidget {
  const PhotoExpandViewWidget({
    Key? key,
    this.user,
    this.photoidx,
  }) : super(key: key);

  final UsersRecord? user;
  final int? photoidx;

  @override
  _PhotoExpandViewWidgetState createState() => _PhotoExpandViewWidgetState();
}

class _PhotoExpandViewWidgetState extends State<PhotoExpandViewWidget> {
  bool? todelete;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        actions: [],
        flexibleSpace: FlexibleSpaceBar(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 50,
                    icon: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                    onPressed: () async {
                      context.pop();
                    },
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                    child: Text(
                      'Photos',
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16,
                          ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.more_vert,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30,
                    ),
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: DeletePhotoWidgetWidget(),
                          );
                        },
                      ).then((value) => setState(() => todelete = value));

                      if (todelete!) {
                        final usersUpdateData = {
                          'photos': getPhotoListFirestoreData(
                            functions.removePhotoFromList(
                                widget.user!.photos!.toList(),
                                widget.photoidx!),
                          ),
                        };
                        await widget.user!.reference.update(usersUpdateData);
                        context.pop();
                      }

                      setState(() {});
                    },
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
          expandedTitleScale: 1.0,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Image.network(
                      functions.getPhotosListValue(
                          widget.user!.photos!.toList(), widget.photoidx)!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, -0.95),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: Container(
                          width: 90,
                          height: 35,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  width: 87,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).trueBlack,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.photo_camera_outlined,
                                      color: Color(0xBFF5F5F5),
                                      size: 24,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 0, 0, 0),
                                      child: Text(
                                        '${functions.inc(widget.photoidx!).toString()}/${widget.user!.photos!.toList().length.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Roboto',
                                              color: Color(0xBFF5F5F5),
                                            ),
                                      ),
                                    ),
                                  ],
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
        ),
      ),
    );
  }
}
