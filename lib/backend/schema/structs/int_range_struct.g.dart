// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'int_range_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IntRangeStruct> _$intRangeStructSerializer =
    new _$IntRangeStructSerializer();

class _$IntRangeStructSerializer
    implements StructuredSerializer<IntRangeStruct> {
  @override
  final Iterable<Type> types = const [IntRangeStruct, _$IntRangeStruct];
  @override
  final String wireName = 'IntRangeStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, IntRangeStruct object,
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
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.max;
    if (value != null) {
      result
        ..add('max')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  IntRangeStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IntRangeStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'min':
          result.min = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'max':
          result.max = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$IntRangeStruct extends IntRangeStruct {
  @override
  final int? min;
  @override
  final int? max;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$IntRangeStruct([void Function(IntRangeStructBuilder)? updates]) =>
      (new IntRangeStructBuilder()..update(updates))._build();

  _$IntRangeStruct._({this.min, this.max, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'IntRangeStruct', 'firestoreUtilData');
  }

  @override
  IntRangeStruct rebuild(void Function(IntRangeStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IntRangeStructBuilder toBuilder() =>
      new IntRangeStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntRangeStruct &&
        min == other.min &&
        max == other.max &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, min.hashCode), max.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IntRangeStruct')
          ..add('min', min)
          ..add('max', max)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class IntRangeStructBuilder
    implements Builder<IntRangeStruct, IntRangeStructBuilder> {
  _$IntRangeStruct? _$v;

  int? _min;
  int? get min => _$this._min;
  set min(int? min) => _$this._min = min;

  int? _max;
  int? get max => _$this._max;
  set max(int? max) => _$this._max = max;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  IntRangeStructBuilder() {
    IntRangeStruct._initializeBuilder(this);
  }

  IntRangeStructBuilder get _$this {
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
  void replace(IntRangeStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IntRangeStruct;
  }

  @override
  void update(void Function(IntRangeStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IntRangeStruct build() => _build();

  _$IntRangeStruct _build() {
    final _$result = _$v ??
        new _$IntRangeStruct._(
            min: min,
            max: max,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'IntRangeStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
