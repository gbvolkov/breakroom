import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'complaints_record.g.dart';

abstract class ComplaintsRecord
    implements Built<ComplaintsRecord, ComplaintsRecordBuilder> {
  static Serializer<ComplaintsRecord> get serializer =>
      _$complaintsRecordSerializer;

  DocumentReference? get reporter;

  DocumentReference? get referredUser;

  String? get report;

  DateTime? get complaintTS;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ComplaintsRecordBuilder builder) =>
      builder..report = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('complaints');

  static Stream<ComplaintsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ComplaintsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ComplaintsRecord._();
  factory ComplaintsRecord([void Function(ComplaintsRecordBuilder) updates]) =
      _$ComplaintsRecord;

  static ComplaintsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createComplaintsRecordData({
  DocumentReference? reporter,
  DocumentReference? referredUser,
  String? report,
  DateTime? complaintTS,
}) {
  final firestoreData = serializers.toFirestore(
    ComplaintsRecord.serializer,
    ComplaintsRecord(
      (c) => c
        ..reporter = reporter
        ..referredUser = referredUser
        ..report = report
        ..complaintTS = complaintTS,
    ),
  );

  return firestoreData;
}
