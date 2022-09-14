import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'add_ons_record.g.dart';

abstract class AddOnsRecord
    implements Built<AddOnsRecord, AddOnsRecordBuilder> {
  static Serializer<AddOnsRecord> get serializer => _$addOnsRecordSerializer;

  String? get name;

  double? get fee;

  @BuiltValueField(wireName: 'is_active')
  bool? get isActive;

  int? get sequence;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(AddOnsRecordBuilder builder) => builder
    ..name = ''
    ..fee = 0.0
    ..isActive = false
    ..sequence = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('add_ons')
          : FirebaseFirestore.instance.collectionGroup('add_ons');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('add_ons').doc();

  static Stream<AddOnsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AddOnsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AddOnsRecord._();
  factory AddOnsRecord([void Function(AddOnsRecordBuilder) updates]) =
      _$AddOnsRecord;

  static AddOnsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAddOnsRecordData({
  String? name,
  double? fee,
  bool? isActive,
  int? sequence,
}) {
  final firestoreData = serializers.toFirestore(
    AddOnsRecord.serializer,
    AddOnsRecord(
      (a) => a
        ..name = name
        ..fee = fee
        ..isActive = isActive
        ..sequence = sequence,
    ),
  );

  return firestoreData;
}
