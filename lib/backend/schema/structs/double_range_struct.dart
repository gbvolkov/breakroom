import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'double_range_struct.g.dart';

abstract class DoubleRangeStruct
    implements Built<DoubleRangeStruct, DoubleRangeStructBuilder> {
  static Serializer<DoubleRangeStruct> get serializer =>
      _$doubleRangeStructSerializer;

  double? get min;

  double? get max;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(DoubleRangeStructBuilder builder) => builder
    ..min = 0.0
    ..max = 0.0
    ..firestoreUtilData = FirestoreUtilData();

  DoubleRangeStruct._();
  factory DoubleRangeStruct([void Function(DoubleRangeStructBuilder) updates]) =
      _$DoubleRangeStruct;
}

DoubleRangeStruct createDoubleRangeStruct({
  double? min,
  double? max,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DoubleRangeStruct(
      (d) => d
        ..min = min
        ..max = max
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

DoubleRangeStruct? updateDoubleRangeStruct(
  DoubleRangeStruct? doubleRange, {
  bool clearUnsetFields = true,
}) =>
    doubleRange != null
        ? (doubleRange.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addDoubleRangeStructData(
  Map<String, dynamic> firestoreData,
  DoubleRangeStruct? doubleRange,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (doubleRange == null) {
    return;
  }
  if (doubleRange.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && doubleRange.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final doubleRangeData =
      getDoubleRangeFirestoreData(doubleRange, forFieldValue);
  final nestedData =
      doubleRangeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = doubleRange.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getDoubleRangeFirestoreData(
  DoubleRangeStruct? doubleRange, [
  bool forFieldValue = false,
]) {
  if (doubleRange == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(DoubleRangeStruct.serializer, doubleRange);

  // Add any Firestore field values
  doubleRange.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDoubleRangeListFirestoreData(
  List<DoubleRangeStruct>? doubleRanges,
) =>
    doubleRanges?.map((d) => getDoubleRangeFirestoreData(d, true)).toList() ??
    [];
