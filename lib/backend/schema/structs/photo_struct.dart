import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'photo_struct.g.dart';

abstract class PhotoStruct implements Built<PhotoStruct, PhotoStructBuilder> {
  static Serializer<PhotoStruct> get serializer => _$photoStructSerializer;

  String? get image;

  double? get rating;

  BuiltList<DocumentReference>? get freaks;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PhotoStructBuilder builder) => builder
    ..image = ''
    ..rating = 0.0
    ..freaks = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  PhotoStruct._();
  factory PhotoStruct([void Function(PhotoStructBuilder) updates]) =
      _$PhotoStruct;
}

PhotoStruct createPhotoStruct({
  String? image,
  double? rating,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PhotoStruct(
      (p) => p
        ..image = image
        ..rating = rating
        ..freaks = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

PhotoStruct? updatePhotoStruct(
  PhotoStruct? photo, {
  bool clearUnsetFields = true,
}) =>
    photo != null
        ? (photo.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addPhotoStructData(
  Map<String, dynamic> firestoreData,
  PhotoStruct? photo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (photo == null) {
    return;
  }
  if (photo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && photo.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final photoData = getPhotoFirestoreData(photo, forFieldValue);
  final nestedData = photoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = photo.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getPhotoFirestoreData(
  PhotoStruct? photo, [
  bool forFieldValue = false,
]) {
  if (photo == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(PhotoStruct.serializer, photo);

  // Add any Firestore field values
  photo.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPhotoListFirestoreData(
  List<PhotoStruct>? photos,
) =>
    photos?.map((p) => getPhotoFirestoreData(p, true)).toList() ?? [];
