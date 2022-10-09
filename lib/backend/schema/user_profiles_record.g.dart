// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profiles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserProfilesRecord> _$userProfilesRecordSerializer =
    new _$UserProfilesRecordSerializer();

class _$UserProfilesRecordSerializer
    implements StructuredSerializer<UserProfilesRecord> {
  @override
  final Iterable<Type> types = const [UserProfilesRecord, _$UserProfilesRecord];
  @override
  final String wireName = 'UserProfilesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, UserProfilesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('lastName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.birthDay;
    if (value != null) {
      result
        ..add('birthDay')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.industry;
    if (value != null) {
      result
        ..add('industry')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.occupation;
    if (value != null) {
      result
        ..add('occupation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.genderPreference;
    if (value != null) {
      result
        ..add('genderPreference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.intention;
    if (value != null) {
      result
        ..add('intention')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.childfreeStatus;
    if (value != null) {
      result
        ..add('childfreeStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.religion;
    if (value != null) {
      result
        ..add('religion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.education;
    if (value != null) {
      result
        ..add('education')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bodyType;
    if (value != null) {
      result
        ..add('bodyType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.interests;
    if (value != null) {
      result
        ..add('interests')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.lookingFor;
    if (value != null) {
      result
        ..add('lookingFor')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.workoutStatus;
    if (value != null) {
      result
        ..add('workoutStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.drinkingStatus;
    if (value != null) {
      result
        ..add('drinkingStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.smokingStatus;
    if (value != null) {
      result
        ..add('smokingStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.spiritualStatus;
    if (value != null) {
      result
        ..add('spiritualStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photos;
    if (value != null) {
      result
        ..add('photos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PhotoStruct)])));
    }
    value = object.liked;
    if (value != null) {
      result
        ..add('liked')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.disliked;
    if (value != null) {
      result
        ..add('disliked')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.geoposition;
    if (value != null) {
      result
        ..add('geoposition')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  UserProfilesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserProfilesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birthDay':
          result.birthDay = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'industry':
          result.industry = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'occupation':
          result.occupation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'genderPreference':
          result.genderPreference = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'intention':
          result.intention = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'childfreeStatus':
          result.childfreeStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'religion':
          result.religion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'education':
          result.education = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bodyType':
          result.bodyType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'interests':
          result.interests.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'lookingFor':
          result.lookingFor.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'workoutStatus':
          result.workoutStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'drinkingStatus':
          result.drinkingStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'smokingStatus':
          result.smokingStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'spiritualStatus':
          result.spiritualStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photos':
          result.photos.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PhotoStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'liked':
          result.liked.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'disliked':
          result.disliked.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'geoposition':
          result.geoposition = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$UserProfilesRecord extends UserProfilesRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final DateTime? birthDay;
  @override
  final String? industry;
  @override
  final String? occupation;
  @override
  final String? bio;
  @override
  final String? gender;
  @override
  final String? genderPreference;
  @override
  final String? intention;
  @override
  final String? childfreeStatus;
  @override
  final String? religion;
  @override
  final String? education;
  @override
  final String? bodyType;
  @override
  final BuiltList<String>? interests;
  @override
  final BuiltList<String>? lookingFor;
  @override
  final int? height;
  @override
  final int? weight;
  @override
  final String? workoutStatus;
  @override
  final String? drinkingStatus;
  @override
  final String? smokingStatus;
  @override
  final String? spiritualStatus;
  @override
  final BuiltList<PhotoStruct>? photos;
  @override
  final BuiltList<DocumentReference<Object?>>? liked;
  @override
  final BuiltList<DocumentReference<Object?>>? disliked;
  @override
  final LatLng? geoposition;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UserProfilesRecord(
          [void Function(UserProfilesRecordBuilder)? updates]) =>
      (new UserProfilesRecordBuilder()..update(updates))._build();

  _$UserProfilesRecord._(
      {this.user,
      this.firstName,
      this.lastName,
      this.birthDay,
      this.industry,
      this.occupation,
      this.bio,
      this.gender,
      this.genderPreference,
      this.intention,
      this.childfreeStatus,
      this.religion,
      this.education,
      this.bodyType,
      this.interests,
      this.lookingFor,
      this.height,
      this.weight,
      this.workoutStatus,
      this.drinkingStatus,
      this.smokingStatus,
      this.spiritualStatus,
      this.photos,
      this.liked,
      this.disliked,
      this.geoposition,
      this.ffRef})
      : super._();

  @override
  UserProfilesRecord rebuild(
          void Function(UserProfilesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserProfilesRecordBuilder toBuilder() =>
      new UserProfilesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserProfilesRecord &&
        user == other.user &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        birthDay == other.birthDay &&
        industry == other.industry &&
        occupation == other.occupation &&
        bio == other.bio &&
        gender == other.gender &&
        genderPreference == other.genderPreference &&
        intention == other.intention &&
        childfreeStatus == other.childfreeStatus &&
        religion == other.religion &&
        education == other.education &&
        bodyType == other.bodyType &&
        interests == other.interests &&
        lookingFor == other.lookingFor &&
        height == other.height &&
        weight == other.weight &&
        workoutStatus == other.workoutStatus &&
        drinkingStatus == other.drinkingStatus &&
        smokingStatus == other.smokingStatus &&
        spiritualStatus == other.spiritualStatus &&
        photos == other.photos &&
        liked == other.liked &&
        disliked == other.disliked &&
        geoposition == other.geoposition &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc(0, user.hashCode), firstName.hashCode), lastName.hashCode), birthDay.hashCode), industry.hashCode), occupation.hashCode), bio.hashCode), gender.hashCode),
                                                                                genderPreference.hashCode),
                                                                            intention.hashCode),
                                                                        childfreeStatus.hashCode),
                                                                    religion.hashCode),
                                                                education.hashCode),
                                                            bodyType.hashCode),
                                                        interests.hashCode),
                                                    lookingFor.hashCode),
                                                height.hashCode),
                                            weight.hashCode),
                                        workoutStatus.hashCode),
                                    drinkingStatus.hashCode),
                                smokingStatus.hashCode),
                            spiritualStatus.hashCode),
                        photos.hashCode),
                    liked.hashCode),
                disliked.hashCode),
            geoposition.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserProfilesRecord')
          ..add('user', user)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('birthDay', birthDay)
          ..add('industry', industry)
          ..add('occupation', occupation)
          ..add('bio', bio)
          ..add('gender', gender)
          ..add('genderPreference', genderPreference)
          ..add('intention', intention)
          ..add('childfreeStatus', childfreeStatus)
          ..add('religion', religion)
          ..add('education', education)
          ..add('bodyType', bodyType)
          ..add('interests', interests)
          ..add('lookingFor', lookingFor)
          ..add('height', height)
          ..add('weight', weight)
          ..add('workoutStatus', workoutStatus)
          ..add('drinkingStatus', drinkingStatus)
          ..add('smokingStatus', smokingStatus)
          ..add('spiritualStatus', spiritualStatus)
          ..add('photos', photos)
          ..add('liked', liked)
          ..add('disliked', disliked)
          ..add('geoposition', geoposition)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UserProfilesRecordBuilder
    implements Builder<UserProfilesRecord, UserProfilesRecordBuilder> {
  _$UserProfilesRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  DateTime? _birthDay;
  DateTime? get birthDay => _$this._birthDay;
  set birthDay(DateTime? birthDay) => _$this._birthDay = birthDay;

  String? _industry;
  String? get industry => _$this._industry;
  set industry(String? industry) => _$this._industry = industry;

  String? _occupation;
  String? get occupation => _$this._occupation;
  set occupation(String? occupation) => _$this._occupation = occupation;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  String? _genderPreference;
  String? get genderPreference => _$this._genderPreference;
  set genderPreference(String? genderPreference) =>
      _$this._genderPreference = genderPreference;

  String? _intention;
  String? get intention => _$this._intention;
  set intention(String? intention) => _$this._intention = intention;

  String? _childfreeStatus;
  String? get childfreeStatus => _$this._childfreeStatus;
  set childfreeStatus(String? childfreeStatus) =>
      _$this._childfreeStatus = childfreeStatus;

  String? _religion;
  String? get religion => _$this._religion;
  set religion(String? religion) => _$this._religion = religion;

  String? _education;
  String? get education => _$this._education;
  set education(String? education) => _$this._education = education;

  String? _bodyType;
  String? get bodyType => _$this._bodyType;
  set bodyType(String? bodyType) => _$this._bodyType = bodyType;

  ListBuilder<String>? _interests;
  ListBuilder<String> get interests =>
      _$this._interests ??= new ListBuilder<String>();
  set interests(ListBuilder<String>? interests) =>
      _$this._interests = interests;

  ListBuilder<String>? _lookingFor;
  ListBuilder<String> get lookingFor =>
      _$this._lookingFor ??= new ListBuilder<String>();
  set lookingFor(ListBuilder<String>? lookingFor) =>
      _$this._lookingFor = lookingFor;

  int? _height;
  int? get height => _$this._height;
  set height(int? height) => _$this._height = height;

  int? _weight;
  int? get weight => _$this._weight;
  set weight(int? weight) => _$this._weight = weight;

  String? _workoutStatus;
  String? get workoutStatus => _$this._workoutStatus;
  set workoutStatus(String? workoutStatus) =>
      _$this._workoutStatus = workoutStatus;

  String? _drinkingStatus;
  String? get drinkingStatus => _$this._drinkingStatus;
  set drinkingStatus(String? drinkingStatus) =>
      _$this._drinkingStatus = drinkingStatus;

  String? _smokingStatus;
  String? get smokingStatus => _$this._smokingStatus;
  set smokingStatus(String? smokingStatus) =>
      _$this._smokingStatus = smokingStatus;

  String? _spiritualStatus;
  String? get spiritualStatus => _$this._spiritualStatus;
  set spiritualStatus(String? spiritualStatus) =>
      _$this._spiritualStatus = spiritualStatus;

  ListBuilder<PhotoStruct>? _photos;
  ListBuilder<PhotoStruct> get photos =>
      _$this._photos ??= new ListBuilder<PhotoStruct>();
  set photos(ListBuilder<PhotoStruct>? photos) => _$this._photos = photos;

  ListBuilder<DocumentReference<Object?>>? _liked;
  ListBuilder<DocumentReference<Object?>> get liked =>
      _$this._liked ??= new ListBuilder<DocumentReference<Object?>>();
  set liked(ListBuilder<DocumentReference<Object?>>? liked) =>
      _$this._liked = liked;

  ListBuilder<DocumentReference<Object?>>? _disliked;
  ListBuilder<DocumentReference<Object?>> get disliked =>
      _$this._disliked ??= new ListBuilder<DocumentReference<Object?>>();
  set disliked(ListBuilder<DocumentReference<Object?>>? disliked) =>
      _$this._disliked = disliked;

  LatLng? _geoposition;
  LatLng? get geoposition => _$this._geoposition;
  set geoposition(LatLng? geoposition) => _$this._geoposition = geoposition;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UserProfilesRecordBuilder() {
    UserProfilesRecord._initializeBuilder(this);
  }

  UserProfilesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _birthDay = $v.birthDay;
      _industry = $v.industry;
      _occupation = $v.occupation;
      _bio = $v.bio;
      _gender = $v.gender;
      _genderPreference = $v.genderPreference;
      _intention = $v.intention;
      _childfreeStatus = $v.childfreeStatus;
      _religion = $v.religion;
      _education = $v.education;
      _bodyType = $v.bodyType;
      _interests = $v.interests?.toBuilder();
      _lookingFor = $v.lookingFor?.toBuilder();
      _height = $v.height;
      _weight = $v.weight;
      _workoutStatus = $v.workoutStatus;
      _drinkingStatus = $v.drinkingStatus;
      _smokingStatus = $v.smokingStatus;
      _spiritualStatus = $v.spiritualStatus;
      _photos = $v.photos?.toBuilder();
      _liked = $v.liked?.toBuilder();
      _disliked = $v.disliked?.toBuilder();
      _geoposition = $v.geoposition;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserProfilesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserProfilesRecord;
  }

  @override
  void update(void Function(UserProfilesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserProfilesRecord build() => _build();

  _$UserProfilesRecord _build() {
    _$UserProfilesRecord _$result;
    try {
      _$result = _$v ??
          new _$UserProfilesRecord._(
              user: user,
              firstName: firstName,
              lastName: lastName,
              birthDay: birthDay,
              industry: industry,
              occupation: occupation,
              bio: bio,
              gender: gender,
              genderPreference: genderPreference,
              intention: intention,
              childfreeStatus: childfreeStatus,
              religion: religion,
              education: education,
              bodyType: bodyType,
              interests: _interests?.build(),
              lookingFor: _lookingFor?.build(),
              height: height,
              weight: weight,
              workoutStatus: workoutStatus,
              drinkingStatus: drinkingStatus,
              smokingStatus: smokingStatus,
              spiritualStatus: spiritualStatus,
              photos: _photos?.build(),
              liked: _liked?.build(),
              disliked: _disliked?.build(),
              geoposition: geoposition,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'interests';
        _interests?.build();
        _$failedField = 'lookingFor';
        _lookingFor?.build();

        _$failedField = 'photos';
        _photos?.build();
        _$failedField = 'liked';
        _liked?.build();
        _$failedField = 'disliked';
        _disliked?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserProfilesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
