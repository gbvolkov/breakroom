// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatsRecord> _$chatsRecordSerializer = new _$ChatsRecordSerializer();

class _$ChatsRecordSerializer implements StructuredSerializer<ChatsRecord> {
  @override
  final Iterable<Type> types = const [ChatsRecord, _$ChatsRecord];
  @override
  final String wireName = 'ChatsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.userA;
    if (value != null) {
      result
        ..add('user_a')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.userB;
    if (value != null) {
      result
        ..add('user_b')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.lastMessage;
    if (value != null) {
      result
        ..add('last_message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastMessageTime;
    if (value != null) {
      result
        ..add('last_message_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lastMessageSentBy;
    if (value != null) {
      result
        ..add('last_message_sent_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.lastMessageSeenBy;
    if (value != null) {
      result
        ..add('last_message_seen_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.isDeleted;
    if (value != null) {
      result
        ..add('is_deleted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isBlockedA;
    if (value != null) {
      result
        ..add('is_blocked_a')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isBlockedB;
    if (value != null) {
      result
        ..add('is_blocked_b')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.userNameA;
    if (value != null) {
      result
        ..add('userNameA')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userNameB;
    if (value != null) {
      result
        ..add('userNameB')
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
  ChatsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'user_a':
          result.userA = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'user_b':
          result.userB = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'last_message':
          result.lastMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_message_time':
          result.lastMessageTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'last_message_sent_by':
          result.lastMessageSentBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'last_message_seen_by':
          result.lastMessageSeenBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'is_deleted':
          result.isDeleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_blocked_a':
          result.isBlockedA = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_blocked_b':
          result.isBlockedB = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'userNameA':
          result.userNameA = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userNameB':
          result.userNameB = serializers.deserialize(value,
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

class _$ChatsRecord extends ChatsRecord {
  @override
  final BuiltList<DocumentReference<Object?>>? users;
  @override
  final DocumentReference<Object?>? userA;
  @override
  final DocumentReference<Object?>? userB;
  @override
  final String? lastMessage;
  @override
  final DateTime? lastMessageTime;
  @override
  final DocumentReference<Object?>? lastMessageSentBy;
  @override
  final BuiltList<DocumentReference<Object?>>? lastMessageSeenBy;
  @override
  final bool? isDeleted;
  @override
  final bool? isBlockedA;
  @override
  final bool? isBlockedB;
  @override
  final String? userNameA;
  @override
  final String? userNameB;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatsRecord([void Function(ChatsRecordBuilder)? updates]) =>
      (new ChatsRecordBuilder()..update(updates))._build();

  _$ChatsRecord._(
      {this.users,
      this.userA,
      this.userB,
      this.lastMessage,
      this.lastMessageTime,
      this.lastMessageSentBy,
      this.lastMessageSeenBy,
      this.isDeleted,
      this.isBlockedA,
      this.isBlockedB,
      this.userNameA,
      this.userNameB,
      this.ffRef})
      : super._();

  @override
  ChatsRecord rebuild(void Function(ChatsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatsRecordBuilder toBuilder() => new ChatsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatsRecord &&
        users == other.users &&
        userA == other.userA &&
        userB == other.userB &&
        lastMessage == other.lastMessage &&
        lastMessageTime == other.lastMessageTime &&
        lastMessageSentBy == other.lastMessageSentBy &&
        lastMessageSeenBy == other.lastMessageSeenBy &&
        isDeleted == other.isDeleted &&
        isBlockedA == other.isBlockedA &&
        isBlockedB == other.isBlockedB &&
        userNameA == other.userNameA &&
        userNameB == other.userNameB &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jc(_$hash, userA.hashCode);
    _$hash = $jc(_$hash, userB.hashCode);
    _$hash = $jc(_$hash, lastMessage.hashCode);
    _$hash = $jc(_$hash, lastMessageTime.hashCode);
    _$hash = $jc(_$hash, lastMessageSentBy.hashCode);
    _$hash = $jc(_$hash, lastMessageSeenBy.hashCode);
    _$hash = $jc(_$hash, isDeleted.hashCode);
    _$hash = $jc(_$hash, isBlockedA.hashCode);
    _$hash = $jc(_$hash, isBlockedB.hashCode);
    _$hash = $jc(_$hash, userNameA.hashCode);
    _$hash = $jc(_$hash, userNameB.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatsRecord')
          ..add('users', users)
          ..add('userA', userA)
          ..add('userB', userB)
          ..add('lastMessage', lastMessage)
          ..add('lastMessageTime', lastMessageTime)
          ..add('lastMessageSentBy', lastMessageSentBy)
          ..add('lastMessageSeenBy', lastMessageSeenBy)
          ..add('isDeleted', isDeleted)
          ..add('isBlockedA', isBlockedA)
          ..add('isBlockedB', isBlockedB)
          ..add('userNameA', userNameA)
          ..add('userNameB', userNameB)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatsRecordBuilder implements Builder<ChatsRecord, ChatsRecordBuilder> {
  _$ChatsRecord? _$v;

  ListBuilder<DocumentReference<Object?>>? _users;
  ListBuilder<DocumentReference<Object?>> get users =>
      _$this._users ??= new ListBuilder<DocumentReference<Object?>>();
  set users(ListBuilder<DocumentReference<Object?>>? users) =>
      _$this._users = users;

  DocumentReference<Object?>? _userA;
  DocumentReference<Object?>? get userA => _$this._userA;
  set userA(DocumentReference<Object?>? userA) => _$this._userA = userA;

  DocumentReference<Object?>? _userB;
  DocumentReference<Object?>? get userB => _$this._userB;
  set userB(DocumentReference<Object?>? userB) => _$this._userB = userB;

  String? _lastMessage;
  String? get lastMessage => _$this._lastMessage;
  set lastMessage(String? lastMessage) => _$this._lastMessage = lastMessage;

  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _$this._lastMessageTime;
  set lastMessageTime(DateTime? lastMessageTime) =>
      _$this._lastMessageTime = lastMessageTime;

  DocumentReference<Object?>? _lastMessageSentBy;
  DocumentReference<Object?>? get lastMessageSentBy =>
      _$this._lastMessageSentBy;
  set lastMessageSentBy(DocumentReference<Object?>? lastMessageSentBy) =>
      _$this._lastMessageSentBy = lastMessageSentBy;

  ListBuilder<DocumentReference<Object?>>? _lastMessageSeenBy;
  ListBuilder<DocumentReference<Object?>> get lastMessageSeenBy =>
      _$this._lastMessageSeenBy ??=
          new ListBuilder<DocumentReference<Object?>>();
  set lastMessageSeenBy(
          ListBuilder<DocumentReference<Object?>>? lastMessageSeenBy) =>
      _$this._lastMessageSeenBy = lastMessageSeenBy;

  bool? _isDeleted;
  bool? get isDeleted => _$this._isDeleted;
  set isDeleted(bool? isDeleted) => _$this._isDeleted = isDeleted;

  bool? _isBlockedA;
  bool? get isBlockedA => _$this._isBlockedA;
  set isBlockedA(bool? isBlockedA) => _$this._isBlockedA = isBlockedA;

  bool? _isBlockedB;
  bool? get isBlockedB => _$this._isBlockedB;
  set isBlockedB(bool? isBlockedB) => _$this._isBlockedB = isBlockedB;

  String? _userNameA;
  String? get userNameA => _$this._userNameA;
  set userNameA(String? userNameA) => _$this._userNameA = userNameA;

  String? _userNameB;
  String? get userNameB => _$this._userNameB;
  set userNameB(String? userNameB) => _$this._userNameB = userNameB;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatsRecordBuilder() {
    ChatsRecord._initializeBuilder(this);
  }

  ChatsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users?.toBuilder();
      _userA = $v.userA;
      _userB = $v.userB;
      _lastMessage = $v.lastMessage;
      _lastMessageTime = $v.lastMessageTime;
      _lastMessageSentBy = $v.lastMessageSentBy;
      _lastMessageSeenBy = $v.lastMessageSeenBy?.toBuilder();
      _isDeleted = $v.isDeleted;
      _isBlockedA = $v.isBlockedA;
      _isBlockedB = $v.isBlockedB;
      _userNameA = $v.userNameA;
      _userNameB = $v.userNameB;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatsRecord;
  }

  @override
  void update(void Function(ChatsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatsRecord build() => _build();

  _$ChatsRecord _build() {
    _$ChatsRecord _$result;
    try {
      _$result = _$v ??
          new _$ChatsRecord._(
              users: _users?.build(),
              userA: userA,
              userB: userB,
              lastMessage: lastMessage,
              lastMessageTime: lastMessageTime,
              lastMessageSentBy: lastMessageSentBy,
              lastMessageSeenBy: _lastMessageSeenBy?.build(),
              isDeleted: isDeleted,
              isBlockedA: isBlockedA,
              isBlockedB: isBlockedB,
              userNameA: userNameA,
              userNameB: userNameB,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();

        _$failedField = 'lastMessageSeenBy';
        _lastMessageSeenBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChatsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
