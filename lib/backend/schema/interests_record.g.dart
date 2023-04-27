// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InterestsRecord> _$interestsRecordSerializer =
    new _$InterestsRecordSerializer();

class _$InterestsRecordSerializer
    implements StructuredSerializer<InterestsRecord> {
  @override
  final Iterable<Type> types = const [InterestsRecord, _$InterestsRecord];
  @override
  final String wireName = 'InterestsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, InterestsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.interest;
    if (value != null) {
      result
        ..add('interest')
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
  InterestsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InterestsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'interest':
          result.interest = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$InterestsRecord extends InterestsRecord {
  @override
  final String? interest;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$InterestsRecord([void Function(InterestsRecordBuilder)? updates]) =>
      (new InterestsRecordBuilder()..update(updates))._build();

  _$InterestsRecord._({this.interest, this.ffRef}) : super._();

  @override
  InterestsRecord rebuild(void Function(InterestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InterestsRecordBuilder toBuilder() =>
      new InterestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InterestsRecord &&
        interest == other.interest &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, interest.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InterestsRecord')
          ..add('interest', interest)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class InterestsRecordBuilder
    implements Builder<InterestsRecord, InterestsRecordBuilder> {
  _$InterestsRecord? _$v;

  String? _interest;
  String? get interest => _$this._interest;
  set interest(String? interest) => _$this._interest = interest;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  InterestsRecordBuilder() {
    InterestsRecord._initializeBuilder(this);
  }

  InterestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _interest = $v.interest;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InterestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InterestsRecord;
  }

  @override
  void update(void Function(InterestsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InterestsRecord build() => _build();

  _$InterestsRecord _build() {
    final _$result =
        _$v ?? new _$InterestsRecord._(interest: interest, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
