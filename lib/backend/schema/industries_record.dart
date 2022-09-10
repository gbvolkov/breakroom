import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'industries_record.g.dart';

abstract class IndustriesRecord
    implements Built<IndustriesRecord, IndustriesRecordBuilder> {
  static Serializer<IndustriesRecord> get serializer =>
      _$industriesRecordSerializer;

  String? get industry;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(IndustriesRecordBuilder builder) =>
      builder..industry = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('industries');

  static Stream<IndustriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IndustriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IndustriesRecord._();
  factory IndustriesRecord([void Function(IndustriesRecordBuilder) updates]) =
      _$IndustriesRecord;

  static IndustriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIndustriesRecordData({
  String? industry,
}) {
  final firestoreData = serializers.toFirestore(
    IndustriesRecord.serializer,
    IndustriesRecord(
      (i) => i..industry = industry,
    ),
  );

  return firestoreData;
}
