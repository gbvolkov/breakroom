// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'double_range_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DoubleRangeStruct> _$doubleRangeStructSerializer =
    new _$DoubleRangeStructSerializer();

class _$DoubleRangeStructSerializer
    implements StructuredSerializer<DoubleRangeStruct> {
  @override
  final Iterable<Type> types = const [DoubleRangeStruct, _$DoubleRangeStruct];
  @override
  final String wireName = 'DoubleRangeStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoubleRangeStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.min;
    if (value != null) {
      result
        ..add('min')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.max;
    if (value != null) {
      result
        ..add('max')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  DoubleRangeStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoubleRangeStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'min':
          result.min = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'max':
          result.max = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$DoubleRangeStruct extends DoubleRangeStruct {
  @override
  final double? min;
  @override
  final double? max;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DoubleRangeStruct(
          [void Function(DoubleRangeStructBuilder)? updates]) =>
      (new DoubleRangeStructBuilder()..update(updates))._build();

  _$DoubleRangeStruct._({this.min, this.max, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DoubleRangeStruct', 'firestoreUtilData');
  }

  @override
  DoubleRangeStruct rebuild(void Function(DoubleRangeStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoubleRangeStructBuilder toBuilder() =>
      new DoubleRangeStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoubleRangeStruct &&
        min == other.min &&
        max == other.max &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, min.hashCode);
    _$hash = $jc(_$hash, max.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DoubleRangeStruct')
          ..add('min', min)
          ..add('max', max)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DoubleRangeStructBuilder
    implements Builder<DoubleRangeStruct, DoubleRangeStructBuilder> {
  _$DoubleRangeStruct? _$v;

  double? _min;
  double? get min => _$this._min;
  set min(double? min) => _$this._min = min;

  double? _max;
  double? get max => _$this._max;
  set max(double? max) => _$this._max = max;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DoubleRangeStructBuilder() {
    DoubleRangeStruct._initializeBuilder(this);
  }

  DoubleRangeStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _min = $v.min;
      _max = $v.max;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoubleRangeStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoubleRangeStruct;
  }

  @override
  void update(void Function(DoubleRangeStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DoubleRangeStruct build() => _build();

  _$DoubleRangeStruct _build() {
    final _$result = _$v ??
        new _$DoubleRangeStruct._(
            min: min,
            max: max,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'DoubleRangeStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
