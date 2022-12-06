import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'notif_settings_struct.g.dart';

abstract class NotifSettingsStruct
    implements Built<NotifSettingsStruct, NotifSettingsStructBuilder> {
  static Serializer<NotifSettingsStruct> get serializer =>
      _$notifSettingsStructSerializer;

  bool? get isAll;

  bool? get isLike;

  bool? get isMatch;

  bool? get isMsg;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(NotifSettingsStructBuilder builder) => builder
    ..isAll = false
    ..isLike = false
    ..isMatch = false
    ..isMsg = false
    ..firestoreUtilData = FirestoreUtilData();

  NotifSettingsStruct._();
  factory NotifSettingsStruct(
          [void Function(NotifSettingsStructBuilder) updates]) =
      _$NotifSettingsStruct;
}

NotifSettingsStruct createNotifSettingsStruct({
  bool? isAll,
  bool? isLike,
  bool? isMatch,
  bool? isMsg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotifSettingsStruct(
      (n) => n
        ..isAll = isAll
        ..isLike = isLike
        ..isMatch = isMatch
        ..isMsg = isMsg
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

NotifSettingsStruct? updateNotifSettingsStruct(
  NotifSettingsStruct? notifSettings, {
  bool clearUnsetFields = true,
}) =>
    notifSettings != null
        ? (notifSettings.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addNotifSettingsStructData(
  Map<String, dynamic> firestoreData,
  NotifSettingsStruct? notifSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notifSettings == null) {
    return;
  }
  if (notifSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && notifSettings.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notifSettingsData =
      getNotifSettingsFirestoreData(notifSettings, forFieldValue);
  final nestedData =
      notifSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = notifSettings.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getNotifSettingsFirestoreData(
  NotifSettingsStruct? notifSettings, [
  bool forFieldValue = false,
]) {
  if (notifSettings == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(NotifSettingsStruct.serializer, notifSettings);

  // Add any Firestore field values
  notifSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotifSettingsListFirestoreData(
  List<NotifSettingsStruct>? notifSettingss,
) =>
    notifSettingss
        ?.map((n) => getNotifSettingsFirestoreData(n, true))
        .toList() ??
    [];
