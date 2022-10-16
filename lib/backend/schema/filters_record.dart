import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'filters_record.g.dart';

abstract class FiltersRecord
    implements Built<FiltersRecord, FiltersRecordBuilder> {
  static Serializer<FiltersRecord> get serializer => _$filtersRecordSerializer;

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

  static void _initializeBuilder(FiltersRecordBuilder builder) => builder
    ..lookingFor = ListBuilder()
    ..ageRangeExt = false
    ..distance = 0.0
    ..industries = ListBuilder()
    ..filterName = ''
    ..ageRange = DoubleRangeStructBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('filters')
          : FirebaseFirestore.instance.collectionGroup('filters');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('filters').doc();

  static Stream<FiltersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FiltersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FiltersRecord._();
  factory FiltersRecord([void Function(FiltersRecordBuilder) updates]) =
      _$FiltersRecord;

  static FiltersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFiltersRecordData({
  bool? ageRangeExt,
  LatLng? location,
  double? distance,
  String? filterName,
  DoubleRangeStruct? ageRange,
}) {
  final firestoreData = serializers.toFirestore(
    FiltersRecord.serializer,
    FiltersRecord(
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
