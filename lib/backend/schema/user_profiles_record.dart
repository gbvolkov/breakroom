import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_profiles_record.g.dart';

abstract class UserProfilesRecord
    implements Built<UserProfilesRecord, UserProfilesRecordBuilder> {
  static Serializer<UserProfilesRecord> get serializer =>
      _$userProfilesRecordSerializer;

  DocumentReference? get user;

  String? get firstName;

  String? get lastName;

  DateTime? get birthDay;

  String? get industry;

  String? get occupation;

  String? get bio;

  String? get gender;

  String? get genderPreference;

  String? get intention;

  String? get childfreeStatus;

  String? get religion;

  String? get education;

  String? get bodyType;

  BuiltList<String>? get interests;

  BuiltList<String>? get lookingFor;

  int? get height;

  int? get weight;

  String? get workoutStatus;

  String? get drinkingStatus;

  String? get smokingStatus;

  String? get spiritualStatus;

  BuiltList<PhotoStruct>? get photos;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserProfilesRecordBuilder builder) => builder
    ..firstName = ''
    ..lastName = ''
    ..industry = ''
    ..occupation = ''
    ..bio = ''
    ..gender = ''
    ..genderPreference = ''
    ..intention = ''
    ..childfreeStatus = ''
    ..religion = ''
    ..education = ''
    ..bodyType = ''
    ..interests = ListBuilder()
    ..lookingFor = ListBuilder()
    ..height = 0
    ..weight = 0
    ..workoutStatus = ''
    ..drinkingStatus = ''
    ..smokingStatus = ''
    ..spiritualStatus = ''
    ..photos = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_profiles');

  static Stream<UserProfilesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserProfilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserProfilesRecord._();
  factory UserProfilesRecord(
          [void Function(UserProfilesRecordBuilder) updates]) =
      _$UserProfilesRecord;

  static UserProfilesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserProfilesRecordData({
  DocumentReference? user,
  String? firstName,
  String? lastName,
  DateTime? birthDay,
  String? industry,
  String? occupation,
  String? bio,
  String? gender,
  String? genderPreference,
  String? intention,
  String? childfreeStatus,
  String? religion,
  String? education,
  String? bodyType,
  int? height,
  int? weight,
  String? workoutStatus,
  String? drinkingStatus,
  String? smokingStatus,
  String? spiritualStatus,
}) {
  final firestoreData = serializers.toFirestore(
    UserProfilesRecord.serializer,
    UserProfilesRecord(
      (u) => u
        ..user = user
        ..firstName = firstName
        ..lastName = lastName
        ..birthDay = birthDay
        ..industry = industry
        ..occupation = occupation
        ..bio = bio
        ..gender = gender
        ..genderPreference = genderPreference
        ..intention = intention
        ..childfreeStatus = childfreeStatus
        ..religion = religion
        ..education = education
        ..bodyType = bodyType
        ..interests = null
        ..lookingFor = null
        ..height = height
        ..weight = weight
        ..workoutStatus = workoutStatus
        ..drinkingStatus = drinkingStatus
        ..smokingStatus = smokingStatus
        ..spiritualStatus = spiritualStatus
        ..photos = null,
    ),
  );

  return firestoreData;
}
