import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'occupations_record.g.dart';

abstract class OccupationsRecord
    implements Built<OccupationsRecord, OccupationsRecordBuilder> {
  static Serializer<OccupationsRecord> get serializer =>
      _$occupationsRecordSerializer;

  String? get occupation;

  String? get industry;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OccupationsRecordBuilder builder) => builder
    ..occupation = ''
    ..industry = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('occupations');

  static Stream<OccupationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OccupationsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OccupationsRecord._();
  factory OccupationsRecord([void Function(OccupationsRecordBuilder) updates]) =
      _$OccupationsRecord;

  static OccupationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOccupationsRecordData({
  String? occupation,
  String? industry,
}) {
  final firestoreData = serializers.toFirestore(
    OccupationsRecord.serializer,
    OccupationsRecord(
      (o) => o
        ..occupation = occupation
        ..industry = industry,
    ),
  );

  return firestoreData;
}
