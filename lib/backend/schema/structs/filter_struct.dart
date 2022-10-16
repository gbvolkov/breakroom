import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'filter_struct.g.dart';

abstract class FilterStruct
    implements Built<FilterStruct, FilterStructBuilder> {
  static Serializer<FilterStruct> get serializer => _$filterStructSerializer;

  BuiltList<String>? get lookingFor;

  bool? get ageRangeExt;

  LatLng? get location;

  double? get distance;

  BuiltList<String>? get industries;

  DoubleRangeStruct get ageRange;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(FilterStructBuilder builder) => builder
    ..lookingFor = ListBuilder()
    ..ageRangeExt = false
    ..distance = 0.0
    ..industries = ListBuilder()
    ..ageRange = DoubleRangeStructBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  FilterStruct._();
  factory FilterStruct([void Function(FilterStructBuilder) updates]) =
      _$FilterStruct;
}

FilterStruct createFilterStruct({
  bool? ageRangeExt,
  LatLng? location,
  double? distance,
  DoubleRangeStruct? ageRange,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FilterStruct(
      (f) => f
        ..lookingFor = null
        ..ageRangeExt = ageRangeExt
        ..location = location
        ..distance = distance
        ..industries = null
        ..ageRange = ageRange?.toBuilder() ?? DoubleRangeStructBuilder()
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

FilterStruct? updateFilterStruct(
  FilterStruct? filter, {
  bool clearUnsetFields = true,
}) =>
    filter != null
        ? (filter.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addFilterStructData(
  Map<String, dynamic> firestoreData,
  FilterStruct? filter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (filter == null) {
    return;
  }
  if (filter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && filter.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final filterData = getFilterFirestoreData(filter, forFieldValue);
  final nestedData = filterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = filter.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getFilterFirestoreData(
  FilterStruct? filter, [
  bool forFieldValue = false,
]) {
  if (filter == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(FilterStruct.serializer, filter);

  // Handle nested data for "ageRange" field.
  addDoubleRangeStructData(
      firestoreData, filter.ageRange, 'ageRange', forFieldValue);

  // Add any Firestore field values
  filter.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFilterListFirestoreData(
  List<FilterStruct>? filters,
) =>
    filters?.map((f) => getFilterFirestoreData(f, true)).toList() ?? [];
