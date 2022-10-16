// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'filter',
      serializers.serialize(object.filter,
          specifiedType: const FullType(FilterStruct)),
    ];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.geoposition;
    if (value != null) {
      result
        ..add('geoposition')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
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
    value = object.touched;
    if (value != null) {
      result
        ..add('touched')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.liked;
    if (value != null) {
      result
        ..add('liked')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.disliked;
    if (value != null) {
      result
        ..add('disliked')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'geoposition':
          result.geoposition = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
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
        case 'touched':
          result.touched.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'filter':
          result.filter.replace(serializers.deserialize(value,
              specifiedType: const FullType(FilterStruct))! as FilterStruct);
          break;
        case 'liked':
          result.liked.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'disliked':
          result.disliked.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final LatLng? geoposition;
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
  final BuiltList<String>? touched;
  @override
  final FilterStruct filter;
  @override
  final BuiltList<String>? liked;
  @override
  final BuiltList<String>? disliked;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.geoposition,
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
      this.touched,
      required this.filter,
      this.liked,
      this.disliked,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(filter, r'UsersRecord', 'filter');
  }

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        geoposition == other.geoposition &&
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
        touched == other.touched &&
        filter == other.filter &&
        liked == other.liked &&
        disliked == other.disliked &&
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, email.hashCode), displayName.hashCode), photoUrl.hashCode), uid.hashCode), createdTime.hashCode), phoneNumber.hashCode), geoposition.hashCode), firstName.hashCode), lastName.hashCode), birthDay.hashCode), industry.hashCode), occupation.hashCode), bio.hashCode), gender.hashCode), genderPreference.hashCode),
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
                        touched.hashCode),
                    filter.hashCode),
                liked.hashCode),
            disliked.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('geoposition', geoposition)
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
          ..add('touched', touched)
          ..add('filter', filter)
          ..add('liked', liked)
          ..add('disliked', disliked)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  LatLng? _geoposition;
  LatLng? get geoposition => _$this._geoposition;
  set geoposition(LatLng? geoposition) => _$this._geoposition = geoposition;

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

  ListBuilder<String>? _touched;
  ListBuilder<String> get touched =>
      _$this._touched ??= new ListBuilder<String>();
  set touched(ListBuilder<String>? touched) => _$this._touched = touched;

  FilterStructBuilder? _filter;
  FilterStructBuilder get filter =>
      _$this._filter ??= new FilterStructBuilder();
  set filter(FilterStructBuilder? filter) => _$this._filter = filter;

  ListBuilder<String>? _liked;
  ListBuilder<String> get liked => _$this._liked ??= new ListBuilder<String>();
  set liked(ListBuilder<String>? liked) => _$this._liked = liked;

  ListBuilder<String>? _disliked;
  ListBuilder<String> get disliked =>
      _$this._disliked ??= new ListBuilder<String>();
  set disliked(ListBuilder<String>? disliked) => _$this._disliked = disliked;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _geoposition = $v.geoposition;
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
      _touched = $v.touched?.toBuilder();
      _filter = $v.filter.toBuilder();
      _liked = $v.liked?.toBuilder();
      _disliked = $v.disliked?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              geoposition: geoposition,
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
              touched: _touched?.build(),
              filter: filter.build(),
              liked: _liked?.build(),
              disliked: _disliked?.build(),
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
        _$failedField = 'touched';
        _touched?.build();
        _$failedField = 'filter';
        filter.build();
        _$failedField = 'liked';
        _liked?.build();
        _$failedField = 'disliked';
        _disliked?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
