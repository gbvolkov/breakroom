// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fliters_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FlitersRecord> _$flitersRecordSerializer =
    new _$FlitersRecordSerializer();

class _$FlitersRecordSerializer implements StructuredSerializer<FlitersRecord> {
  @override
  final Iterable<Type> types = const [FlitersRecord, _$FlitersRecord];
  @override
  final String wireName = 'FlitersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FlitersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'ageRange',
      serializers.serialize(object.ageRange,
          specifiedType: const FullType(DoubleRangeStruct)),
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
    value = object.filterName;
    if (value != null) {
      result
        ..add('filterName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  FlitersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FlitersRecordBuilder();

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
        case 'filterName':
          result.filterName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ageRange':
          result.ageRange.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DoubleRangeStruct))!
              as DoubleRangeStruct);
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

class _$FlitersRecord extends FlitersRecord {
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
  final String? filterName;
  @override
  final DoubleRangeStruct ageRange;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FlitersRecord([void Function(FlitersRecordBuilder)? updates]) =>
      (new FlitersRecordBuilder()..update(updates))._build();

  _$FlitersRecord._(
      {this.lookingFor,
      this.ageRangeExt,
      this.location,
      this.distance,
      this.industries,
      this.filterName,
      required this.ageRange,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        ageRange, r'FlitersRecord', 'ageRange');
  }

  @override
  FlitersRecord rebuild(void Function(FlitersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FlitersRecordBuilder toBuilder() => new FlitersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FlitersRecord &&
        lookingFor == other.lookingFor &&
        ageRangeExt == other.ageRangeExt &&
        location == other.location &&
        distance == other.distance &&
        industries == other.industries &&
        filterName == other.filterName &&
        ageRange == other.ageRange &&
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
                            $jc($jc(0, lookingFor.hashCode),
                                ageRangeExt.hashCode),
                            location.hashCode),
                        distance.hashCode),
                    industries.hashCode),
                filterName.hashCode),
            ageRange.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FlitersRecord')
          ..add('lookingFor', lookingFor)
          ..add('ageRangeExt', ageRangeExt)
          ..add('location', location)
          ..add('distance', distance)
          ..add('industries', industries)
          ..add('filterName', filterName)
          ..add('ageRange', ageRange)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FlitersRecordBuilder
    implements Builder<FlitersRecord, FlitersRecordBuilder> {
  _$FlitersRecord? _$v;

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

  String? _filterName;
  String? get filterName => _$this._filterName;
  set filterName(String? filterName) => _$this._filterName = filterName;

  DoubleRangeStructBuilder? _ageRange;
  DoubleRangeStructBuilder get ageRange =>
      _$this._ageRange ??= new DoubleRangeStructBuilder();
  set ageRange(DoubleRangeStructBuilder? ageRange) =>
      _$this._ageRange = ageRange;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FlitersRecordBuilder() {
    FlitersRecord._initializeBuilder(this);
  }

  FlitersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lookingFor = $v.lookingFor?.toBuilder();
      _ageRangeExt = $v.ageRangeExt;
      _location = $v.location;
      _distance = $v.distance;
      _industries = $v.industries?.toBuilder();
      _filterName = $v.filterName;
      _ageRange = $v.ageRange.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FlitersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FlitersRecord;
  }

  @override
  void update(void Function(FlitersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FlitersRecord build() => _build();

  _$FlitersRecord _build() {
    _$FlitersRecord _$result;
    try {
      _$result = _$v ??
          new _$FlitersRecord._(
              lookingFor: _lookingFor?.build(),
              ageRangeExt: ageRangeExt,
              location: location,
              distance: distance,
              industries: _industries?.build(),
              filterName: filterName,
              ageRange: ageRange.build(),
              ffRef: ffRef);
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
            r'FlitersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
