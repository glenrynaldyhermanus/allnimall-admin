import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String titleByDate(DateTime? dateTime) {
  DateTime now = DateTime.now();
  var days = 0;

  days = (dateTime!.difference(now).inHours / 24).round();

  if (days == 0) {
    return "Hari Ini";
  } else if (days == 1) {
    return "Besok";
  }

  return DateFormat("EEEE, dd MMM", "id_ID").format(dateTime!);
}

DateTime dateStart(DateTime? timestamp) {
  return DateTime(timestamp!.year, timestamp!.month, timestamp.day, 0, 0, 0);
}

DateTime dateEnd(DateTime? timestamp) {
  return DateTime(timestamp!.year, timestamp!.month, timestamp.day, 23, 59, 59);
}

String generateOrderNo() {
  // Add your function code here!
  return "GRM-" + DateFormat('ddMMhhmmss').format(DateTime.now());
}

bool isCustomerExistsByPhone(String? phoneNumber) {
  // check if document in firebase where phone number exists
  bool exists = false;
  FirebaseFirestore.instance
      .collection('customers')
      .where('phoneNumber', isEqualTo: phoneNumber)
      .get()
      .then((QuerySnapshot snapshot) {
    exists = snapshot.docs.isNotEmpty;
  });
  return exists;
}

String generateWhatsAppUrl(String? phone) {
  phone = phone!.replaceAll("+", "").trim();
  return "https://api.whatsapp.com/send?phone=$phone";
}

String countEndTimeForOrder(
  int? startHour,
  int? numOfPets,
) {
  int workHour = startHour! + numOfPets!;
  String workHourString = workHour.toString();
  if (workHourString.length == 1) {
    workHourString = "0$workHour";
  }

  return "$workHourString:00";
}
