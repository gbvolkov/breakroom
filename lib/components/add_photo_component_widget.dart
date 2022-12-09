import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddPhotoComponentWidget extends StatefulWidget {
  const AddPhotoComponentWidget({
    Key? key,
    this.photoUrl,
  }) : super(key: key);

  final String? photoUrl;

  @override
  _AddPhotoComponentWidgetState createState() =>
      _AddPhotoComponentWidgetState();
}

class _AddPhotoComponentWidgetState extends State<AddPhotoComponentWidget> {
  bool isMediaUploading1 = false;
  String uploadedFileUrl1 = '';

  bool isMediaUploading2 = false;
  String uploadedFileUrl2 = '';

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      child: Container(
        width: 114,
        height: 150,
        constraints: BoxConstraints(
          maxWidth: 114,
          maxHeight: 150,
        ),
        decoration: BoxDecoration(),
        alignment: AlignmentDirectional(-1, -1),
        child: Container(
          width: 114,
          height: 150,
          child: Stack(
            alignment: AlignmentDirectional(0, 0),
            children: [
              if (widget.photoUrl != null && widget.photoUrl != '')
                Align(
                  alignment: AlignmentDirectional(-1, 1),
                  child: InkWell(
                    onTap: () async {
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        setState(() => isMediaUploading1 = true);
                        var downloadUrls = <String>[];
                        try {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          isMediaUploading1 = false;
                        }
                        if (downloadUrls.length == selectedMedia.length) {
                          setState(() => uploadedFileUrl1 = downloadUrls.first);
                          showUploadMessage(context, 'Success!');
                        } else {
                          setState(() {});
                          showUploadMessage(context, 'Failed to upload media');
                          return;
                        }
                      }
                    },
                    child: Image.asset(
                      'assets/images/photo-frame.png',
                      width: 105,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (widget.photoUrl != null && widget.photoUrl != '')
                Align(
                  alignment: AlignmentDirectional(-1, 1),
                  child: InkWell(
                    onTap: () async {
                      final selectedMedia =
                          await selectMediaWithSourceBottomSheet(
                        context: context,
                        allowPhoto: true,
                      );
                      if (selectedMedia != null &&
                          selectedMedia.every((m) =>
                              validateFileFormat(m.storagePath, context))) {
                        setState(() => isMediaUploading2 = true);
                        var downloadUrls = <String>[];
                        try {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          downloadUrls = (await Future.wait(
                            selectedMedia.map(
                              (m) async =>
                                  await uploadData(m.storagePath, m.bytes),
                            ),
                          ))
                              .where((u) => u != null)
                              .map((u) => u!)
                              .toList();
                        } finally {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          isMediaUploading2 = false;
                        }
                        if (downloadUrls.length == selectedMedia.length) {
                          setState(() => uploadedFileUrl2 = downloadUrls.first);
                          showUploadMessage(context, 'Success!');
                        } else {
                          setState(() {});
                          showUploadMessage(context, 'Failed to upload media');
                          return;
                        }
                      }
                    },
                    child: Image.network(
                      widget.photoUrl!,
                      width: 105,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(1, -1),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
