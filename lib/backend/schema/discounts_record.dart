import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'discounts_record.g.dart';

abstract class DiscountsRecord
    implements Built<DiscountsRecord, DiscountsRecordBuilder> {
  static Serializer<DiscountsRecord> get serializer =>
      _$discountsRecordSerializer;

  double? get discount;

  @BuiltValueField(wireName: 'is_active')
  bool? get isActive;

  String? get name;

  String? get unit;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(DiscountsRecordBuilder builder) => builder
    ..discount = 0.0
    ..isActive = false
    ..name = ''
    ..unit = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('discounts');

  static Stream<DiscountsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DiscountsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DiscountsRecord._();
  factory DiscountsRecord([void Function(DiscountsRecordBuilder) updates]) =
      _$DiscountsRecord;

  static DiscountsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDiscountsRecordData({
  double? discount,
  bool? isActive,
  String? name,
  String? unit,
}) {
  final firestoreData = serializers.toFirestore(
    DiscountsRecord.serializer,
    DiscountsRecord(
      (d) => d
        ..discount = discount
        ..isActive = isActive
        ..name = name
        ..unit = unit,
    ),
  );

  return firestoreData;
}
