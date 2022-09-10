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
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
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

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Login': (data) async => LoginWidget(),
  'Menu': (data) async => MenuWidget(),
  'CreateOrder': (data) async => CreateOrderWidget(),
  'CustomerList': (data) async => CustomerListWidget(
        isSelection: getParameter(data, 'isSelection'),
      ),
  'CreateCustomer': (data) async => CreateCustomerWidget(),
  'RangerList': (data) async => RangerListWidget(
        isSelections: getParameter(data, 'isSelections'),
        isAsssignment: getParameter(data, 'isAsssignment'),
        order:
            await getDocumentParameter(data, 'order', OrdersRecord.serializer),
      ),
  'RequestDetail': (data) async => RequestDetailWidget(
        order:
            await getDocumentParameter(data, 'order', OrdersRecord.serializer),
      ),
  'OrderDetail': (data) async => OrderDetailWidget(
        order:
            await getDocumentParameter(data, 'order', OrdersRecord.serializer),
      ),
  'EditCustomerForOrder': (data) async => EditCustomerForOrderWidget(
        order:
            await getDocumentParameter(data, 'order', OrdersRecord.serializer),
      ),
  'EditOrderInformation': (data) async => EditOrderInformationWidget(
        order:
            await getDocumentParameter(data, 'order', OrdersRecord.serializer),
      ),
  'EditOrderSchedule': (data) async => EditOrderScheduleWidget(
        order:
            await getDocumentParameter(data, 'order', OrdersRecord.serializer),
      ),
  'ServiceCategoryList': (data) async => ServiceCategoryListWidget(
        isSelection: getParameter(data, 'isSelection'),
      ),
  'EditServiceCategory': (data) async => EditServiceCategoryWidget(
        category: await getDocumentParameter(
            data, 'category', ServiceCategoriesRecord.serializer),
      ),
  'CreateServiceCategory': (data) async => CreateServiceCategoryWidget(),
  'DiscountList': (data) async => DiscountListWidget(
        isSelection: getParameter(data, 'isSelection'),
      ),
  'EditDiscount': (data) async => EditDiscountWidget(
        discount: await getDocumentParameter(
            data, 'discount', DiscountsRecord.serializer),
      ),
  'CreateDiscount': (data) async => CreateDiscountWidget(),
  'ServiceList': (data) async => ServiceListWidget(
        isSelection: getParameter(data, 'isSelection'),
        category: await getDocumentParameter(
            data, 'category', ServiceCategoriesRecord.serializer),
      ),
  'EditService': (data) async => EditServiceWidget(
        service: await getDocumentParameter(
            data, 'service', ServicesRecord.serializer),
      ),
  'CreateService': (data) async => CreateServiceWidget(
        category: await getDocumentParameter(
            data, 'category', ServiceCategoriesRecord.serializer),
      ),
  'EditArticle': (data) async => EditArticleWidget(
        article: await getDocumentParameter(
            data, 'article', ArticlesRecord.serializer),
      ),
  'ArticleList': (data) async => ArticleListWidget(
        isSelection: getParameter(data, 'isSelection'),
      ),
  'CreateArticle': (data) async => CreateArticleWidget(),
  'FAQList': (data) async => FAQListWidget(
        isSelection: getParameter(data, 'isSelection'),
      ),
  'CreateFAQ': (data) async => CreateFAQWidget(),
  'EditFAQ': (data) async => EditFAQWidget(
        faq: await getDocumentParameter(data, 'faq', FaqsRecord.serializer),
      ),
  'FeedbackList': (data) async => FeedbackListWidget(
        isSelection: getParameter(data, 'isSelection'),
      ),
  'EditFeedback': (data) async => EditFeedbackWidget(
        featureRequest: await getDocumentParameter(
            data, 'featureRequest', FeatureRequestsRecord.serializer),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

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
