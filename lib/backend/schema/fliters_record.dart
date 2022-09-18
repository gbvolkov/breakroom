import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'fliters_record.g.dart';

abstract class FlitersRecord
    implements Built<FlitersRecord, FlitersRecordBuilder> {
  static Serializer<FlitersRecord> get serializer => _$flitersRecordSerializer;

  BuiltList<String>? get lookingFor;

  bool? get ageRangeExt;

  LatLng? get location;

  double? get distance;

  BuiltList<String>? get industries;

  String? get filterName;

  DoubleRangeStruct get ageRange;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(FlitersRecordBuilder builder) => builder
    ..lookingFor = ListBuilder()
    ..ageRangeExt = false
    ..distance = 0.0
    ..industries = ListBuilder()
    ..filterName = ''
    ..ageRange = DoubleRangeStructBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('fliters')
          : FirebaseFirestore.instance.collectionGroup('fliters');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('fliters').doc();

  static Stream<FlitersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FlitersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FlitersRecord._();
  factory FlitersRecord([void Function(FlitersRecordBuilder) updates]) =
      _$FlitersRecord;

  static FlitersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFlitersRecordData({
  bool? ageRangeExt,
  LatLng? location,
  double? distance,
  String? filterName,
  DoubleRangeStruct? ageRange,
}) {
  final firestoreData = serializers.toFirestore(
    FlitersRecord.serializer,
    FlitersRecord(
      (f) => f
        ..lookingFor = null
        ..ageRangeExt = ageRangeExt
        ..location = location
        ..distance = distance
        ..industries = null
        ..filterName = filterName
        ..ageRange = DoubleRangeStructBuilder(),
    ),
  );

  // Handle nested data for "ageRange" field.
  addDoubleRangeStructData(firestoreData, ageRange, 'ageRange');

  return firestoreData;
}
