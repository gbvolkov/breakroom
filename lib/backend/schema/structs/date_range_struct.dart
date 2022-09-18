import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'date_range_struct.g.dart';

abstract class DateRangeStruct
    implements Built<DateRangeStruct, DateRangeStructBuilder> {
  static Serializer<DateRangeStruct> get serializer =>
      _$dateRangeStructSerializer;

  DateTime? get dateMin;

  DateTime? get dateMax;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(DateRangeStructBuilder builder) =>
      builder..firestoreUtilData = FirestoreUtilData();

  DateRangeStruct._();
  factory DateRangeStruct([void Function(DateRangeStructBuilder) updates]) =
      _$DateRangeStruct;
}

DateRangeStruct createDateRangeStruct({
  DateTime? dateMin,
  DateTime? dateMax,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DateRangeStruct(
      (d) => d
        ..dateMin = dateMin
        ..dateMax = dateMax
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

DateRangeStruct? updateDateRangeStruct(
  DateRangeStruct? dateRange, {
  bool clearUnsetFields = true,
}) =>
    dateRange != null
        ? (dateRange.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addDateRangeStructData(
  Map<String, dynamic> firestoreData,
  DateRangeStruct? dateRange,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dateRange == null) {
    return;
  }
  if (dateRange.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && dateRange.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dateRangeData = getDateRangeFirestoreData(dateRange, forFieldValue);
  final nestedData = dateRangeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = dateRange.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getDateRangeFirestoreData(
  DateRangeStruct? dateRange, [
  bool forFieldValue = false,
]) {
  if (dateRange == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(DateRangeStruct.serializer, dateRange);

  // Add any Firestore field values
  dateRange.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDateRangeListFirestoreData(
  List<DateRangeStruct>? dateRanges,
) =>
    dateRanges?.map((d) => getDateRangeFirestoreData(d, true)).toList() ?? [];
