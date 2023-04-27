// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaints_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ComplaintsRecord> _$complaintsRecordSerializer =
    new _$ComplaintsRecordSerializer();

class _$ComplaintsRecordSerializer
    implements StructuredSerializer<ComplaintsRecord> {
  @override
  final Iterable<Type> types = const [ComplaintsRecord, _$ComplaintsRecord];
  @override
  final String wireName = 'ComplaintsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ComplaintsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.reporter;
    if (value != null) {
      result
        ..add('reporter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.referredUser;
    if (value != null) {
      result
        ..add('referredUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.report;
    if (value != null) {
      result
        ..add('report')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.complaintTS;
    if (value != null) {
      result
        ..add('complaintTS')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  ComplaintsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ComplaintsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'reporter':
          result.reporter = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'referredUser':
          result.referredUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'report':
          result.report = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'complaintTS':
          result.complaintTS = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$ComplaintsRecord extends ComplaintsRecord {
  @override
  final DocumentReference<Object?>? reporter;
  @override
  final DocumentReference<Object?>? referredUser;
  @override
  final String? report;
  @override
  final DateTime? complaintTS;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ComplaintsRecord(
          [void Function(ComplaintsRecordBuilder)? updates]) =>
      (new ComplaintsRecordBuilder()..update(updates))._build();

  _$ComplaintsRecord._(
      {this.reporter,
      this.referredUser,
      this.report,
      this.complaintTS,
      this.ffRef})
      : super._();

  @override
  ComplaintsRecord rebuild(void Function(ComplaintsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ComplaintsRecordBuilder toBuilder() =>
      new ComplaintsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ComplaintsRecord &&
        reporter == other.reporter &&
        referredUser == other.referredUser &&
        report == other.report &&
        complaintTS == other.complaintTS &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reporter.hashCode);
    _$hash = $jc(_$hash, referredUser.hashCode);
    _$hash = $jc(_$hash, report.hashCode);
    _$hash = $jc(_$hash, complaintTS.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ComplaintsRecord')
          ..add('reporter', reporter)
          ..add('referredUser', referredUser)
          ..add('report', report)
          ..add('complaintTS', complaintTS)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ComplaintsRecordBuilder
    implements Builder<ComplaintsRecord, ComplaintsRecordBuilder> {
  _$ComplaintsRecord? _$v;

  DocumentReference<Object?>? _reporter;
  DocumentReference<Object?>? get reporter => _$this._reporter;
  set reporter(DocumentReference<Object?>? reporter) =>
      _$this._reporter = reporter;

  DocumentReference<Object?>? _referredUser;
  DocumentReference<Object?>? get referredUser => _$this._referredUser;
  set referredUser(DocumentReference<Object?>? referredUser) =>
      _$this._referredUser = referredUser;

  String? _report;
  String? get report => _$this._report;
  set report(String? report) => _$this._report = report;

  DateTime? _complaintTS;
  DateTime? get complaintTS => _$this._complaintTS;
  set complaintTS(DateTime? complaintTS) => _$this._complaintTS = complaintTS;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ComplaintsRecordBuilder() {
    ComplaintsRecord._initializeBuilder(this);
  }

  ComplaintsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reporter = $v.reporter;
      _referredUser = $v.referredUser;
      _report = $v.report;
      _complaintTS = $v.complaintTS;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ComplaintsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ComplaintsRecord;
  }

  @override
  void update(void Function(ComplaintsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ComplaintsRecord build() => _build();

  _$ComplaintsRecord _build() {
    final _$result = _$v ??
        new _$ComplaintsRecord._(
            reporter: reporter,
            referredUser: referredUser,
            report: report,
            complaintTS: complaintTS,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
