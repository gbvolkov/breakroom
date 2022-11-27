import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chats_record.g.dart';

abstract class ChatsRecord implements Built<ChatsRecord, ChatsRecordBuilder> {
  static Serializer<ChatsRecord> get serializer => _$chatsRecordSerializer;

  BuiltList<DocumentReference>? get users;

  @BuiltValueField(wireName: 'user_a')
  DocumentReference? get userA;

  @BuiltValueField(wireName: 'user_b')
  DocumentReference? get userB;

  @BuiltValueField(wireName: 'last_message')
  String? get lastMessage;

  @BuiltValueField(wireName: 'last_message_time')
  DateTime? get lastMessageTime;

  @BuiltValueField(wireName: 'last_message_sent_by')
  DocumentReference? get lastMessageSentBy;

  @BuiltValueField(wireName: 'last_message_seen_by')
  BuiltList<DocumentReference>? get lastMessageSeenBy;

  @BuiltValueField(wireName: 'is_blocked')
  bool? get isBlocked;

  @BuiltValueField(wireName: 'is_deleted')
  bool? get isDeleted;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChatsRecordBuilder builder) => builder
    ..users = ListBuilder()
    ..lastMessage = ''
    ..lastMessageSeenBy = ListBuilder()
    ..isBlocked = false
    ..isDeleted = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatsRecord._();
  factory ChatsRecord([void Function(ChatsRecordBuilder) updates]) =
      _$ChatsRecord;

  static ChatsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? userA,
  DocumentReference? userB,
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? lastMessageSentBy,
  bool? isBlocked,
  bool? isDeleted,
}) {
  final firestoreData = serializers.toFirestore(
    ChatsRecord.serializer,
    ChatsRecord(
      (c) => c
        ..users = null
        ..userA = userA
        ..userB = userB
        ..lastMessage = lastMessage
        ..lastMessageTime = lastMessageTime
        ..lastMessageSentBy = lastMessageSentBy
        ..lastMessageSeenBy = null
        ..isBlocked = isBlocked
        ..isDeleted = isDeleted,
    ),
  );

  return firestoreData;
}
