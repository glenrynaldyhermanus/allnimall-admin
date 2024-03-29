import 'dart:convert';
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
  dateTime ??= DateTime.now();
  DateTime now = DateTime.now();
  var days = 0;

  days = (dateTime.difference(now).inHours / 24).round();

  if (days == 0) {
    return "Hari Ini";
  } else if (days == 1) {
    return "Besok";
  }

  return DateFormat("EEEE, dd MMM", "id_ID").format(dateTime);
}

DateTime dateStart(DateTime? timestamp) {
  timestamp ??= DateTime.now();
  return DateTime(timestamp.year, timestamp.month, timestamp.day, 0, 0, 0);
}

DateTime dateEnd(DateTime? timestamp) {
  timestamp ??= DateTime.now();
  return DateTime(timestamp.year, timestamp.month, timestamp.day, 23, 59, 59);
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

String searchQueryAlgolia(String? searchQuery) {
  // Add your function code here!
  if (searchQuery == null || searchQuery.isEmpty) {
    return " ";
  }
  return searchQuery;
}

String addressString(
  String? localAddress,
  String? geoAddress,
) {
  if (localAddress != null && localAddress.isNotEmpty) {
    return localAddress;
  }
  if (geoAddress != null && geoAddress.isNotEmpty) {
    return geoAddress;
  }
  return "";
}

double countTotalService(
  double? serviceFee,
  List<AddOnsRecord>? addOns,
  int? numOfPet,
) {
  serviceFee ??= 0;
  if (addOns != null) {
    for (AddOnsRecord addOn in addOns) {
      if (serviceFee != null) {
        serviceFee = serviceFee + addOn.fee!;
      }
    }
  }
  if (serviceFee != null) {
    return serviceFee * numOfPet!;
  }
  return 0;
}

double countTotalOrderService(
  double? serviceFee,
  List<AddOnsStruct>? addOns,
  int? numOfPet,
) {
  serviceFee ??= 0;
  if (addOns != null) {
    for (AddOnsStruct addOn in addOns) {
      if (serviceFee != null) {
        serviceFee = serviceFee + addOn.fee!;
      }
    }
  }
  if (serviceFee != null) {
    return serviceFee * numOfPet!;
  }
  return 0;
}

double countTotalAllServices(List<OrderServicesRecord>? services) {
  double fee = 0;

  if (services == null) {
    return 0;
  }
  for (OrderServicesRecord service in services) {
    double serviceFee = service.fee!;

    if (service.addOns != null) {
      for (AddOnsStruct addOn in service.addOns!) {
        serviceFee += addOn.fee!;
      }
    }
    fee += serviceFee * service.quantity!;
  }

  return fee;
}

bool isServiceAdded(
  ServicesRecord? service,
  List<OrderServicesRecord>? addedServices,
) {
  for (OrderServicesRecord order in addedServices!) {
    if (order.serviceUid == service!.reference) {
      return true;
    }
  }

  return false;
}

List<AddOnsStruct>? addOnDocToList(List<AddOnsRecord>? addOnsDoc) {
  // map record value to AddOnsStruct
  if (addOnsDoc == null) {
    return null;
  }

  List<AddOnsStruct> addOns = [];
  for (AddOnsRecord addOnDoc in addOnsDoc) {
    AddOnsStruct addOn = createAddOnsStruct(
        name: addOnDoc.name, fee: addOnDoc.fee, addonUid: addOnDoc.reference);
    addOns.add(addOn);
  }
  return addOns;
}

bool isAddonAdded(
  List<AddOnsStruct>? addedAddOns,
  AddOnsRecord? addOn,
) {
  // Add your function code here!
  if (addedAddOns == null) {
    return false;
  }

  for (AddOnsStruct addedAddOn in addedAddOns) {
    if (addedAddOn.addonUid == addOn!.reference) {
      return true;
    }
  }

  return false;
}

OrderServicesRecord? orderServiceFromService(
  ServicesRecord? service,
  List<OrderServicesRecord>? orderServices,
) {
  // return record where service reference equals to order service uid
  for (var k in orderServices!) {
    if (k.serviceUid?.id == service?.reference.id) {
      return k;
    }
  }
  return null;
}

List<OrderServicesRecord>? orderServicezFromService(
  ServicesRecord? service,
  List<OrderServicesRecord>? orderServices,
) {
  // return record where service reference equals to order service uid
  List<OrderServicesRecord> list = [];
  for (var k in orderServices!) {
    if (k.serviceUid?.id == service?.reference.id) {
      list.add(k);
    }
  }
  return list;
}

String petCategoryFromOrderServices(List<OrderServicesRecord>? orderServices) {
  // Add your function code here!
  var petCategory = "";

  for (OrderServicesRecord orderService in orderServices!) {
    if (!petCategory.contains(orderService.categoryName!)) {
      if (petCategory.isEmpty) {
        petCategory += orderService.categoryName!;
      } else {
        petCategory += ', ${orderService.categoryName!}';
      }
    }
  }

  return petCategory;
}

String orderNameFromOrderServices(List<OrderServicesRecord>? orderServices) {
  // Add your function code here!
  var orderName = "";

  for (OrderServicesRecord orderService in orderServices!) {
    if (orderName.isEmpty) {
      orderName +=
          '${orderService.name} x ${orderService.quantity} ${orderService.categoryName}';
    } else {
      orderName +=
          ', ${orderService.name} x ${orderService.quantity} ${orderService.categoryName}';
    }
  }

  return orderName;
}

String serviceFromOrderServices(List<OrderServicesRecord>? orderServices) {
  // Add your function code here!
  var serviceName = "";

  for (OrderServicesRecord orderService in orderServices!) {
    if (serviceName.isEmpty) {
      serviceName += '${orderService.name} ${orderService.categoryName}';
    } else {
      serviceName += ', ${orderService.name} ${orderService.categoryName}';
    }
  }

  return serviceName;
}

int quantityFromOrderServices(List<OrderServicesRecord>? orderServices) {
  // Add your function code here!
  var quantity = 0;

  for (OrderServicesRecord orderService in orderServices!) {
    quantity += orderService.quantity!;
  }

  return quantity;
}

String addOnsFromService(OrderServicesRecord? service) {
  var addOns = "";

  if (service != null) {
    if (service.addOns != null) {
      List<AddOnsStruct> addOnsServices = service.addOns!.toList();
      for (AddOnsStruct addOnService in addOnsServices) {
        if (addOns.isEmpty) {
          addOns += addOnService.name!;
        } else {
          addOns += ', ${addOnService.name!}';
        }
      }
    }
  }

  return addOns;
}
