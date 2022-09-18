import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'int_range_struct.g.dart';

abstract class IntRangeStruct
    implements Built<IntRangeStruct, IntRangeStructBuilder> {
  static Serializer<IntRangeStruct> get serializer =>
      _$intRangeStructSerializer;

  int? get min;

  int? get max;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(IntRangeStructBuilder builder) => builder
    ..min = 0
    ..max = 0
    ..firestoreUtilData = FirestoreUtilData();

  IntRangeStruct._();
  factory IntRangeStruct([void Function(IntRangeStructBuilder) updates]) =
      _$IntRangeStruct;
}

IntRangeStruct createIntRangeStruct({
  int? min,
  int? max,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IntRangeStruct(
      (i) => i
        ..min = min
        ..max = max
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

IntRangeStruct? updateIntRangeStruct(
  IntRangeStruct? intRange, {
  bool clearUnsetFields = true,
}) =>
    intRange != null
        ? (intRange.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addIntRangeStructData(
  Map<String, dynamic> firestoreData,
  IntRangeStruct? intRange,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (intRange == null) {
    return;
  }
  if (intRange.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && intRange.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final intRangeData = getIntRangeFirestoreData(intRange, forFieldValue);
  final nestedData = intRangeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = intRange.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getIntRangeFirestoreData(
  IntRangeStruct? intRange, [
  bool forFieldValue = false,
]) {
  if (intRange == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(IntRangeStruct.serializer, intRange);

  // Add any Firestore field values
  intRange.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIntRangeListFirestoreData(
  List<IntRangeStruct>? intRanges,
) =>
    intRanges?.map((i) => getIntRangeFirestoreData(i, true)).toList() ?? [];
