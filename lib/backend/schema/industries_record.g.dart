// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industries_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IndustriesRecord> _$industriesRecordSerializer =
    new _$IndustriesRecordSerializer();

class _$IndustriesRecordSerializer
    implements StructuredSerializer<IndustriesRecord> {
  @override
  final Iterable<Type> types = const [IndustriesRecord, _$IndustriesRecord];
  @override
  final String wireName = 'IndustriesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, IndustriesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
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
  IndustriesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IndustriesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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

class _$IndustriesRecord extends IndustriesRecord {
  @override
  final String? industry;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$IndustriesRecord(
          [void Function(IndustriesRecordBuilder)? updates]) =>
      (new IndustriesRecordBuilder()..update(updates))._build();

  _$IndustriesRecord._({this.industry, this.ffRef}) : super._();

  @override
  IndustriesRecord rebuild(void Function(IndustriesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IndustriesRecordBuilder toBuilder() =>
      new IndustriesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IndustriesRecord &&
        industry == other.industry &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, industry.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IndustriesRecord')
          ..add('industry', industry)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class IndustriesRecordBuilder
    implements Builder<IndustriesRecord, IndustriesRecordBuilder> {
  _$IndustriesRecord? _$v;

  String? _industry;
  String? get industry => _$this._industry;
  set industry(String? industry) => _$this._industry = industry;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  IndustriesRecordBuilder() {
    IndustriesRecord._initializeBuilder(this);
  }

  IndustriesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _industry = $v.industry;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IndustriesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IndustriesRecord;
  }

  @override
  void update(void Function(IndustriesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IndustriesRecord build() => _build();

  _$IndustriesRecord _build() {
    final _$result =
        _$v ?? new _$IndustriesRecord._(industry: industry, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
