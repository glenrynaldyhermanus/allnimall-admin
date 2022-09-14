import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'services_struct.g.dart';

abstract class ServicesStruct
    implements Built<ServicesStruct, ServicesStructBuilder> {
  static Serializer<ServicesStruct> get serializer =>
      _$servicesStructSerializer;

  String? get name;

  double? get fee;

  int? get numOfPets;

  BuiltList<AddOnsStruct> get addOns;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ServicesStructBuilder builder) => builder
    ..name = ''
    ..fee = 0.0
    ..numOfPets = 0
    ..addOns = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  ServicesStruct._();
  factory ServicesStruct([void Function(ServicesStructBuilder) updates]) =
      _$ServicesStruct;
}

ServicesStruct createServicesStruct({
  String? name,
  double? fee,
  int? numOfPets,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServicesStruct(
      (s) => s
        ..name = name
        ..fee = fee
        ..numOfPets = numOfPets
        ..addOns = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ServicesStruct? updateServicesStruct(
  ServicesStruct? services, {
  bool clearUnsetFields = true,
}) =>
    services != null
        ? (services.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addServicesStructData(
  Map<String, dynamic> firestoreData,
  ServicesStruct? services,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (services == null) {
    return;
  }
  if (services.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && services.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final servicesData = getServicesFirestoreData(services, forFieldValue);
  final nestedData = servicesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = services.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getServicesFirestoreData(
  ServicesStruct? services, [
  bool forFieldValue = false,
]) {
  if (services == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(ServicesStruct.serializer, services);

  // Add any Firestore field values
  services.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServicesListFirestoreData(
  List<ServicesStruct>? servicess,
) =>
    servicess?.map((s) => getServicesFirestoreData(s, true)).toList() ?? [];
