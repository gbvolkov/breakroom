// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notif_settings_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotifSettingsStruct> _$notifSettingsStructSerializer =
    new _$NotifSettingsStructSerializer();

class _$NotifSettingsStructSerializer
    implements StructuredSerializer<NotifSettingsStruct> {
  @override
  final Iterable<Type> types = const [
    NotifSettingsStruct,
    _$NotifSettingsStruct
  ];
  @override
  final String wireName = 'NotifSettingsStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotifSettingsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.isAll;
    if (value != null) {
      result
        ..add('isAll')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isLike;
    if (value != null) {
      result
        ..add('isLike')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isMatch;
    if (value != null) {
      result
        ..add('isMatch')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isMsg;
    if (value != null) {
      result
        ..add('isMsg')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NotifSettingsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotifSettingsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'isAll':
          result.isAll = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isLike':
          result.isLike = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isMatch':
          result.isMatch = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'isMsg':
          result.isMsg = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$NotifSettingsStruct extends NotifSettingsStruct {
  @override
  final bool? isAll;
  @override
  final bool? isLike;
  @override
  final bool? isMatch;
  @override
  final bool? isMsg;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$NotifSettingsStruct(
          [void Function(NotifSettingsStructBuilder)? updates]) =>
      (new NotifSettingsStructBuilder()..update(updates))._build();

  _$NotifSettingsStruct._(
      {this.isAll,
      this.isLike,
      this.isMatch,
      this.isMsg,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'NotifSettingsStruct', 'firestoreUtilData');
  }

  @override
  NotifSettingsStruct rebuild(
          void Function(NotifSettingsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotifSettingsStructBuilder toBuilder() =>
      new NotifSettingsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotifSettingsStruct &&
        isAll == other.isAll &&
        isLike == other.isLike &&
        isMatch == other.isMatch &&
        isMsg == other.isMsg &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, isAll.hashCode), isLike.hashCode), isMatch.hashCode),
            isMsg.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotifSettingsStruct')
          ..add('isAll', isAll)
          ..add('isLike', isLike)
          ..add('isMatch', isMatch)
          ..add('isMsg', isMsg)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class NotifSettingsStructBuilder
    implements Builder<NotifSettingsStruct, NotifSettingsStructBuilder> {
  _$NotifSettingsStruct? _$v;

  bool? _isAll;
  bool? get isAll => _$this._isAll;
  set isAll(bool? isAll) => _$this._isAll = isAll;

  bool? _isLike;
  bool? get isLike => _$this._isLike;
  set isLike(bool? isLike) => _$this._isLike = isLike;

  bool? _isMatch;
  bool? get isMatch => _$this._isMatch;
  set isMatch(bool? isMatch) => _$this._isMatch = isMatch;

  bool? _isMsg;
  bool? get isMsg => _$this._isMsg;
  set isMsg(bool? isMsg) => _$this._isMsg = isMsg;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  NotifSettingsStructBuilder() {
    NotifSettingsStruct._initializeBuilder(this);
  }

  NotifSettingsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isAll = $v.isAll;
      _isLike = $v.isLike;
      _isMatch = $v.isMatch;
      _isMsg = $v.isMsg;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotifSettingsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotifSettingsStruct;
  }

  @override
  void update(void Function(NotifSettingsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotifSettingsStruct build() => _build();

  _$NotifSettingsStruct _build() {
    final _$result = _$v ??
        new _$NotifSettingsStruct._(
            isAll: isAll,
            isLike: isLike,
            isMatch: isMatch,
            isMsg: isMsg,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'NotifSettingsStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
