import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  LatLng? get geoposition;

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

  BuiltList<String>? get touched;

  FilterStruct get filter;

  BuiltList<String>? get liked;

  BuiltList<String>? get disliked;

  @BuiltValueField(wireName: 'is_complete')
  bool? get isComplete;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
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
    ..photos = ListBuilder()
    ..touched = ListBuilder()
    ..filter = FilterStructBuilder()
    ..liked = ListBuilder()
    ..disliked = ListBuilder()
    ..isComplete = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  LatLng? geoposition,
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
  FilterStruct? filter,
  bool? isComplete,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..geoposition = geoposition
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
        ..photos = null
        ..touched = null
        ..filter = FilterStructBuilder()
        ..liked = null
        ..disliked = null
        ..isComplete = isComplete,
    ),
  );

  // Handle nested data for "filter" field.
  addFilterStructData(firestoreData, filter, 'filter');

  return firestoreData;
}
