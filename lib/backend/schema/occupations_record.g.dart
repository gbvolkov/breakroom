// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occupations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OccupationsRecord> _$occupationsRecordSerializer =
    new _$OccupationsRecordSerializer();

class _$OccupationsRecordSerializer
    implements StructuredSerializer<OccupationsRecord> {
  @override
  final Iterable<Type> types = const [OccupationsRecord, _$OccupationsRecord];
  @override
  final String wireName = 'OccupationsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, OccupationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.occupation;
    if (value != null) {
      result
        ..add('occupation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.industry;
    if (value != null) {
      result
        ..add('industry')
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
  OccupationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OccupationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'occupation':
          result.occupation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'industry':
          result.industry = serializers.deserialize(value,
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

class _$OccupationsRecord extends OccupationsRecord {
  @override
  final String? occupation;
  @override
  final String? industry;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OccupationsRecord(
          [void Function(OccupationsRecordBuilder)? updates]) =>
      (new OccupationsRecordBuilder()..update(updates))._build();

  _$OccupationsRecord._({this.occupation, this.industry, this.ffRef})
      : super._();

  @override
  OccupationsRecord rebuild(void Function(OccupationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OccupationsRecordBuilder toBuilder() =>
      new OccupationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OccupationsRecord &&
        occupation == other.occupation &&
        industry == other.industry &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, occupation.hashCode);
    _$hash = $jc(_$hash, industry.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OccupationsRecord')
          ..add('occupation', occupation)
          ..add('industry', industry)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OccupationsRecordBuilder
    implements Builder<OccupationsRecord, OccupationsRecordBuilder> {
  _$OccupationsRecord? _$v;

  String? _occupation;
  String? get occupation => _$this._occupation;
  set occupation(String? occupation) => _$this._occupation = occupation;

  String? _industry;
  String? get industry => _$this._industry;
  set industry(String? industry) => _$this._industry = industry;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OccupationsRecordBuilder() {
    OccupationsRecord._initializeBuilder(this);
  }

  OccupationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _occupation = $v.occupation;
      _industry = $v.industry;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OccupationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OccupationsRecord;
  }

  @override
  void update(void Function(OccupationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OccupationsRecord build() => _build();

  _$OccupationsRecord _build() {
    final _$result = _$v ??
        new _$OccupationsRecord._(
            occupation: occupation, industry: industry, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
