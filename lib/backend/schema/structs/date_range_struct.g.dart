// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_range_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DateRangeStruct> _$dateRangeStructSerializer =
    new _$DateRangeStructSerializer();

class _$DateRangeStructSerializer
    implements StructuredSerializer<DateRangeStruct> {
  @override
  final Iterable<Type> types = const [DateRangeStruct, _$DateRangeStruct];
  @override
  final String wireName = 'DateRangeStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, DateRangeStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.dateMin;
    if (value != null) {
      result
        ..add('dateMin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.dateMax;
    if (value != null) {
      result
        ..add('dateMax')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  DateRangeStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DateRangeStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dateMin':
          result.dateMin = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'dateMax':
          result.dateMax = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$DateRangeStruct extends DateRangeStruct {
  @override
  final DateTime? dateMin;
  @override
  final DateTime? dateMax;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DateRangeStruct([void Function(DateRangeStructBuilder)? updates]) =>
      (new DateRangeStructBuilder()..update(updates))._build();

  _$DateRangeStruct._(
      {this.dateMin, this.dateMax, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DateRangeStruct', 'firestoreUtilData');
  }

  @override
  DateRangeStruct rebuild(void Function(DateRangeStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DateRangeStructBuilder toBuilder() =>
      new DateRangeStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DateRangeStruct &&
        dateMin == other.dateMin &&
        dateMax == other.dateMax &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dateMin.hashCode);
    _$hash = $jc(_$hash, dateMax.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DateRangeStruct')
          ..add('dateMin', dateMin)
          ..add('dateMax', dateMax)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DateRangeStructBuilder
    implements Builder<DateRangeStruct, DateRangeStructBuilder> {
  _$DateRangeStruct? _$v;

  DateTime? _dateMin;
  DateTime? get dateMin => _$this._dateMin;
  set dateMin(DateTime? dateMin) => _$this._dateMin = dateMin;

  DateTime? _dateMax;
  DateTime? get dateMax => _$this._dateMax;
  set dateMax(DateTime? dateMax) => _$this._dateMax = dateMax;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DateRangeStructBuilder() {
    DateRangeStruct._initializeBuilder(this);
  }

  DateRangeStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dateMin = $v.dateMin;
      _dateMax = $v.dateMax;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DateRangeStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DateRangeStruct;
  }

  @override
  void update(void Function(DateRangeStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DateRangeStruct build() => _build();

  _$DateRangeStruct _build() {
    final _$result = _$v ??
        new _$DateRangeStruct._(
            dateMin: dateMin,
            dateMax: dateMax,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'DateRangeStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
