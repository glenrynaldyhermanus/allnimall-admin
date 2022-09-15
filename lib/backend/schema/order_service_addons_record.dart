import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'order_service_addons_record.g.dart';

abstract class OrderServiceAddonsRecord
    implements
        Built<OrderServiceAddonsRecord, OrderServiceAddonsRecordBuilder> {
  static Serializer<OrderServiceAddonsRecord> get serializer =>
      _$orderServiceAddonsRecordSerializer;

  String? get name;

  double? get fee;

  @BuiltValueField(wireName: 'service_uid')
  DocumentReference? get serviceUid;

  @BuiltValueField(wireName: 'add_on_uid')
  DocumentReference? get addOnUid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(OrderServiceAddonsRecordBuilder builder) =>
      builder
        ..name = ''
        ..fee = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('order_service_addons')
          : FirebaseFirestore.instance.collectionGroup('order_service_addons');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('order_service_addons').doc();

  static Stream<OrderServiceAddonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrderServiceAddonsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrderServiceAddonsRecord._();
  factory OrderServiceAddonsRecord(
          [void Function(OrderServiceAddonsRecordBuilder) updates]) =
      _$OrderServiceAddonsRecord;

  static OrderServiceAddonsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrderServiceAddonsRecordData({
  String? name,
  double? fee,
  DocumentReference? serviceUid,
  DocumentReference? addOnUid,
}) {
  final firestoreData = serializers.toFirestore(
    OrderServiceAddonsRecord.serializer,
    OrderServiceAddonsRecord(
      (o) => o
        ..name = name
        ..fee = fee
        ..serviceUid = serviceUid
        ..addOnUid = addOnUid,
    ),
  );

  return firestoreData;
}
