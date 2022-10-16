// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhotoStruct> _$photoStructSerializer = new _$PhotoStructSerializer();

class _$PhotoStructSerializer implements StructuredSerializer<PhotoStruct> {
  @override
  final Iterable<Type> types = const [PhotoStruct, _$PhotoStruct];
  @override
  final String wireName = 'PhotoStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, PhotoStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.freaks;
    if (value != null) {
      result
        ..add('freaks')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    return result;
  }

  @override
  PhotoStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotoStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'freaks':
          result.freaks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$PhotoStruct extends PhotoStruct {
  @override
  final String? image;
  @override
  final double? rating;
  @override
  final BuiltList<DocumentReference<Object?>>? freaks;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PhotoStruct([void Function(PhotoStructBuilder)? updates]) =>
      (new PhotoStructBuilder()..update(updates))._build();

  _$PhotoStruct._(
      {this.image, this.rating, this.freaks, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PhotoStruct', 'firestoreUtilData');
  }

  @override
  PhotoStruct rebuild(void Function(PhotoStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhotoStructBuilder toBuilder() => new PhotoStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhotoStruct &&
        image == other.image &&
        rating == other.rating &&
        freaks == other.freaks &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, image.hashCode), rating.hashCode), freaks.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PhotoStruct')
          ..add('image', image)
          ..add('rating', rating)
          ..add('freaks', freaks)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PhotoStructBuilder implements Builder<PhotoStruct, PhotoStructBuilder> {
  _$PhotoStruct? _$v;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  double? _rating;
  double? get rating => _$this._rating;
  set rating(double? rating) => _$this._rating = rating;

  ListBuilder<DocumentReference<Object?>>? _freaks;
  ListBuilder<DocumentReference<Object?>> get freaks =>
      _$this._freaks ??= new ListBuilder<DocumentReference<Object?>>();
  set freaks(ListBuilder<DocumentReference<Object?>>? freaks) =>
      _$this._freaks = freaks;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PhotoStructBuilder() {
    PhotoStruct._initializeBuilder(this);
  }

  PhotoStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _rating = $v.rating;
      _freaks = $v.freaks?.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhotoStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PhotoStruct;
  }

  @override
  void update(void Function(PhotoStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhotoStruct build() => _build();

  _$PhotoStruct _build() {
    _$PhotoStruct _$result;
    try {
      _$result = _$v ??
          new _$PhotoStruct._(
              image: image,
              rating: rating,
              freaks: _freaks?.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'PhotoStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'freaks';
        _freaks?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PhotoStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
