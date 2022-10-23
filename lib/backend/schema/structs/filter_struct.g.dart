// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FilterStruct> _$filterStructSerializer =
    new _$FilterStructSerializer();

class _$FilterStructSerializer implements StructuredSerializer<FilterStruct> {
  @override
  final Iterable<Type> types = const [FilterStruct, _$FilterStruct];
  @override
  final String wireName = 'FilterStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilterStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ageRange',
      serializers.serialize(object.ageRange,
          specifiedType: const FullType(DoubleRangeStruct)),
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.lookingFor;
    if (value != null) {
      result
        ..add('lookingFor')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ageRangeExt;
    if (value != null) {
      result
        ..add('ageRangeExt')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.distance;
    if (value != null) {
      result
        ..add('distance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.industries;
    if (value != null) {
      result
        ..add('industries')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  FilterStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FilterStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'lookingFor':
          result.lookingFor.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'ageRangeExt':
          result.ageRangeExt = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'distance':
          result.distance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'industries':
          result.industries.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'ageRange':
          result.ageRange.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DoubleRangeStruct))!
              as DoubleRangeStruct);
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$FilterStruct extends FilterStruct {
  @override
  final BuiltList<String>? lookingFor;
  @override
  final bool? ageRangeExt;
  @override
  final LatLng? location;
  @override
  final double? distance;
  @override
  final BuiltList<String>? industries;
  @override
  final DoubleRangeStruct ageRange;
  @override
  final String? address;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$FilterStruct([void Function(FilterStructBuilder)? updates]) =>
      (new FilterStructBuilder()..update(updates))._build();

  _$FilterStruct._(
      {this.lookingFor,
      this.ageRangeExt,
      this.location,
      this.distance,
      this.industries,
      required this.ageRange,
      this.address,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ageRange, r'FilterStruct', 'ageRange');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'FilterStruct', 'firestoreUtilData');
  }

  @override
  FilterStruct rebuild(void Function(FilterStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilterStructBuilder toBuilder() => new FilterStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilterStruct &&
        lookingFor == other.lookingFor &&
        ageRangeExt == other.ageRangeExt &&
        location == other.location &&
        distance == other.distance &&
        industries == other.industries &&
        ageRange == other.ageRange &&
        address == other.address &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc(0, lookingFor.hashCode),
                                ageRangeExt.hashCode),
                            location.hashCode),
                        distance.hashCode),
                    industries.hashCode),
                ageRange.hashCode),
            address.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilterStruct')
          ..add('lookingFor', lookingFor)
          ..add('ageRangeExt', ageRangeExt)
          ..add('location', location)
          ..add('distance', distance)
          ..add('industries', industries)
          ..add('ageRange', ageRange)
          ..add('address', address)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class FilterStructBuilder
    implements Builder<FilterStruct, FilterStructBuilder> {
  _$FilterStruct? _$v;

  ListBuilder<String>? _lookingFor;
  ListBuilder<String> get lookingFor =>
      _$this._lookingFor ??= new ListBuilder<String>();
  set lookingFor(ListBuilder<String>? lookingFor) =>
      _$this._lookingFor = lookingFor;

  bool? _ageRangeExt;
  bool? get ageRangeExt => _$this._ageRangeExt;
  set ageRangeExt(bool? ageRangeExt) => _$this._ageRangeExt = ageRangeExt;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  double? _distance;
  double? get distance => _$this._distance;
  set distance(double? distance) => _$this._distance = distance;

  ListBuilder<String>? _industries;
  ListBuilder<String> get industries =>
      _$this._industries ??= new ListBuilder<String>();
  set industries(ListBuilder<String>? industries) =>
      _$this._industries = industries;

  DoubleRangeStructBuilder? _ageRange;
  DoubleRangeStructBuilder get ageRange =>
      _$this._ageRange ??= new DoubleRangeStructBuilder();
  set ageRange(DoubleRangeStructBuilder? ageRange) =>
      _$this._ageRange = ageRange;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  FilterStructBuilder() {
    FilterStruct._initializeBuilder(this);
  }

  FilterStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lookingFor = $v.lookingFor?.toBuilder();
      _ageRangeExt = $v.ageRangeExt;
      _location = $v.location;
      _distance = $v.distance;
      _industries = $v.industries?.toBuilder();
      _ageRange = $v.ageRange.toBuilder();
      _address = $v.address;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilterStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilterStruct;
  }

  @override
  void update(void Function(FilterStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilterStruct build() => _build();

  _$FilterStruct _build() {
    _$FilterStruct _$result;
    try {
      _$result = _$v ??
          new _$FilterStruct._(
              lookingFor: _lookingFor?.build(),
              ageRangeExt: ageRangeExt,
              location: location,
              distance: distance,
              industries: _industries?.build(),
              ageRange: ageRange.build(),
              address: address,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'FilterStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'lookingFor';
        _lookingFor?.build();

        _$failedField = 'industries';
        _industries?.build();
        _$failedField = 'ageRange';
        ageRange.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FilterStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
