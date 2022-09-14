// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<ServicesRecord> updateServiceOrderValue(
  ServicesRecord? service,
  int? numOfPets,
  List<DocumentReference>? addOns,
) async {
  // Add your function code here!

  if (addOns != null) {
    //service!.addOns!.asList().addAll(addOns);
    service!.addOns!.toList(growable: true).addAll(addOns);
  }
  //service!.quantity = numOfPets;
  return service!;
}
