import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'add_ons_struct.g.dart';

abstract class AddOnsStruct
    implements Built<AddOnsStruct, AddOnsStructBuilder> {
  static Serializer<AddOnsStruct> get serializer => _$addOnsStructSerializer;

  String? get name;

  double? get fee;

  @BuiltValueField(wireName: 'service_uid')
  DocumentReference? get serviceUid;

  @BuiltValueField(wireName: 'addon_uid')
  DocumentReference? get addonUid;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(AddOnsStructBuilder builder) => builder
    ..name = ''
    ..fee = 0.0
    ..firestoreUtilData = FirestoreUtilData();

  AddOnsStruct._();
  factory AddOnsStruct([void Function(AddOnsStructBuilder) updates]) =
      _$AddOnsStruct;
}

AddOnsStruct createAddOnsStruct({
  String? name,
  double? fee,
  DocumentReference? serviceUid,
  DocumentReference? addonUid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddOnsStruct(
      (a) => a
        ..name = name
        ..fee = fee
        ..serviceUid = serviceUid
        ..addonUid = addonUid
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

AddOnsStruct? updateAddOnsStruct(
  AddOnsStruct? addOns, {
  bool clearUnsetFields = true,
}) =>
    addOns != null
        ? (addOns.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addAddOnsStructData(
  Map<String, dynamic> firestoreData,
  AddOnsStruct? addOns,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addOns == null) {
    return;
  }
  if (addOns.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && addOns.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addOnsData = getAddOnsFirestoreData(addOns, forFieldValue);
  final nestedData = addOnsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = addOns.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getAddOnsFirestoreData(
  AddOnsStruct? addOns, [
  bool forFieldValue = false,
]) {
  if (addOns == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(AddOnsStruct.serializer, addOns);

  // Add any Firestore field values
  addOns.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddOnsListFirestoreData(
  List<AddOnsStruct>? addOnss,
) =>
    addOnss?.map((a) => getAddOnsFirestoreData(a, true)).toList() ?? [];
