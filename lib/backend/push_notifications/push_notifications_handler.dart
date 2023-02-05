import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Login': ParameterData.none(),
  'Home': ParameterData.none(),
  'Menu': ParameterData.none(),
  'CreateOrder': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<OrdersRecord>(
              data, 'order', OrdersRecord.serializer),
        },
      ),
  'OrderDetail': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<OrdersRecord>(
              data, 'order', OrdersRecord.serializer),
        },
      ),
  'CustomerList': (data) async => ParameterData(
        allParams: {
          'isSelection': getParameter<bool>(data, 'isSelection'),
        },
      ),
  'CreateCustomer': ParameterData.none(),
  'RangerList': (data) async => ParameterData(
        allParams: {
          'isSelections': getParameter<bool>(data, 'isSelections'),
          'isAsssignment': getParameter<bool>(data, 'isAsssignment'),
          'order': await getDocumentParameter<OrdersRecord>(
              data, 'order', OrdersRecord.serializer),
        },
      ),
  'RequestDetail': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<OrdersRecord>(
              data, 'order', OrdersRecord.serializer),
        },
      ),
  'EditCustomer': (data) async => ParameterData(
        allParams: {
          'customer': await getDocumentParameter<CustomersRecord>(
              data, 'customer', CustomersRecord.serializer),
        },
      ),
  'EditCustomerForOrder': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<OrdersRecord>(
              data, 'order', OrdersRecord.serializer),
        },
      ),
  'EditOrderSchedule': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<OrdersRecord>(
              data, 'order', OrdersRecord.serializer),
        },
      ),
  'EditOrderInformation': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<OrdersRecord>(
              data, 'order', OrdersRecord.serializer),
        },
      ),
  'ServiceCategoryList': (data) async => ParameterData(
        allParams: {
          'isSelection': getParameter<bool>(data, 'isSelection'),
          'order': await getDocumentParameter<OrdersRecord>(
              data, 'order', OrdersRecord.serializer),
        },
      ),
  'EditServiceCategory': (data) async => ParameterData(
        allParams: {
          'category': await getDocumentParameter<ServiceCategoriesRecord>(
              data, 'category', ServiceCategoriesRecord.serializer),
        },
      ),
  'CreateServiceCategory': ParameterData.none(),
  'DiscountList': (data) async => ParameterData(
        allParams: {
          'isSelection': getParameter<bool>(data, 'isSelection'),
        },
      ),
  'EditDiscount': (data) async => ParameterData(
        allParams: {
          'discount': await getDocumentParameter<DiscountsRecord>(
              data, 'discount', DiscountsRecord.serializer),
        },
      ),
  'CreateDiscount': ParameterData.none(),
  'ServiceList': (data) async => ParameterData(
        allParams: {
          'category': await getDocumentParameter<ServiceCategoriesRecord>(
              data, 'category', ServiceCategoriesRecord.serializer),
        },
      ),
  'ServiceSelectionList': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<OrdersRecord>(
              data, 'order', OrdersRecord.serializer),
          'category': await getDocumentParameter<ServiceCategoriesRecord>(
              data, 'category', ServiceCategoriesRecord.serializer),
        },
      ),
  'EditService': (data) async => ParameterData(
        allParams: {
          'service': await getDocumentParameter<ServicesRecord>(
              data, 'service', ServicesRecord.serializer),
        },
      ),
  'CreateService': (data) async => ParameterData(
        allParams: {
          'category': await getDocumentParameter<ServiceCategoriesRecord>(
              data, 'category', ServiceCategoriesRecord.serializer),
        },
      ),
  'EditArticle': (data) async => ParameterData(
        allParams: {
          'article': await getDocumentParameter<ArticlesRecord>(
              data, 'article', ArticlesRecord.serializer),
        },
      ),
  'ArticleList': (data) async => ParameterData(
        allParams: {
          'isSelection': getParameter<bool>(data, 'isSelection'),
        },
      ),
  'CreateArticle': ParameterData.none(),
  'FAQList': (data) async => ParameterData(
        allParams: {
          'isSelection': getParameter<bool>(data, 'isSelection'),
        },
      ),
  'CreateFAQ': ParameterData.none(),
  'EditFAQ': (data) async => ParameterData(
        allParams: {
          'faq': await getDocumentParameter<FaqsRecord>(
              data, 'faq', FaqsRecord.serializer),
        },
      ),
  'FeedbackList': (data) async => ParameterData(
        allParams: {
          'isSelection': getParameter<bool>(data, 'isSelection'),
        },
      ),
  'EditFeedback': (data) async => ParameterData(
        allParams: {
          'featureRequest': await getDocumentParameter<FeatureRequestsRecord>(
              data, 'featureRequest', FeatureRequestsRecord.serializer),
        },
      ),
  'CreateRanger': ParameterData.none(),
  'ActivityList': (data) async => ParameterData(
        allParams: {
          'isSelection': getParameter<bool>(data, 'isSelection'),
          'service': await getDocumentParameter<ServicesRecord>(
              data, 'service', ServicesRecord.serializer),
        },
      ),
  'CreateActivity': (data) async => ParameterData(
        allParams: {
          'service': await getDocumentParameter<ServicesRecord>(
              data, 'service', ServicesRecord.serializer),
        },
      ),
  'EditActivity': (data) async => ParameterData(
        allParams: {
          'activity': await getDocumentParameter<ActivitiesRecord>(
              data, 'activity', ActivitiesRecord.serializer),
        },
      ),
  'AddOnList': (data) async => ParameterData(
        allParams: {
          'isSelection': getParameter<bool>(data, 'isSelection'),
          'service': await getDocumentParameter<ServicesRecord>(
              data, 'service', ServicesRecord.serializer),
        },
      ),
  'CreateAddOn': (data) async => ParameterData(
        allParams: {
          'service': await getDocumentParameter<ServicesRecord>(
              data, 'service', ServicesRecord.serializer),
        },
      ),
  'EditAddOn': (data) async => ParameterData(
        allParams: {
          'addOn': await getDocumentParameter<AddOnsRecord>(
              data, 'addOn', AddOnsRecord.serializer),
        },
      ),
  'CreateOrderBackup': ParameterData.none(),
  'CreateRequest': (data) async => ParameterData(
        allParams: {
          'order': await getDocumentParameter<OrdersRecord>(
              data, 'order', OrdersRecord.serializer),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
