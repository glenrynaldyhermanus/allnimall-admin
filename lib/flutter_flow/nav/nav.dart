import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AdminFirebaseUser? initialUser;
  AdminFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(AdminFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? HomeWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : LoginWidget(),
          routes: [
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'Home',
              path: 'home',
              requireAuth: true,
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: 'Menu',
              path: 'menu',
              builder: (context, params) => MenuWidget(),
            ),
            FFRoute(
              name: 'CreateOrder',
              path: 'createOrder',
              asyncParams: {
                'order': getDoc(['orders'], OrdersRecord.serializer),
              },
              builder: (context, params) => CreateOrderWidget(
                order: params.getParam('order', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'OrderDetail',
              path: 'orderDetail',
              asyncParams: {
                'order': getDoc(['orders'], OrdersRecord.serializer),
              },
              builder: (context, params) => OrderDetailWidget(
                order: params.getParam('order', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CustomerList',
              path: 'customerList',
              builder: (context, params) => CustomerListWidget(
                isSelection: params.getParam('isSelection', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'CreateCustomer',
              path: 'createCustomer',
              builder: (context, params) => CreateCustomerWidget(),
            ),
            FFRoute(
              name: 'RangerList',
              path: 'rangerList',
              asyncParams: {
                'order': getDoc(['orders'], OrdersRecord.serializer),
              },
              builder: (context, params) => RangerListWidget(
                isSelections: params.getParam('isSelections', ParamType.bool),
                isAsssignment: params.getParam('isAsssignment', ParamType.bool),
                order: params.getParam('order', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'RequestDetail',
              path: 'requestDetail',
              asyncParams: {
                'order': getDoc(['orders'], OrdersRecord.serializer),
              },
              builder: (context, params) => RequestDetailWidget(
                order: params.getParam('order', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EditCustomer',
              path: 'editCustomer',
              asyncParams: {
                'customer': getDoc(['customers'], CustomersRecord.serializer),
              },
              builder: (context, params) => EditCustomerWidget(
                customer: params.getParam('customer', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EditCustomerForOrder',
              path: 'editCustomerForOrder',
              asyncParams: {
                'order': getDoc(['orders'], OrdersRecord.serializer),
              },
              builder: (context, params) => EditCustomerForOrderWidget(
                order: params.getParam('order', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EditOrderSchedule',
              path: 'editOrderSchedule',
              asyncParams: {
                'order': getDoc(['orders'], OrdersRecord.serializer),
              },
              builder: (context, params) => EditOrderScheduleWidget(
                order: params.getParam('order', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EditOrderInformation',
              path: 'editOrderInformation',
              asyncParams: {
                'order': getDoc(['orders'], OrdersRecord.serializer),
              },
              builder: (context, params) => EditOrderInformationWidget(
                order: params.getParam('order', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ServiceCategoryList',
              path: 'serviceCategoryList',
              asyncParams: {
                'order': getDoc(['orders'], OrdersRecord.serializer),
              },
              builder: (context, params) => ServiceCategoryListWidget(
                isSelection: params.getParam('isSelection', ParamType.bool),
                order: params.getParam('order', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EditServiceCategory',
              path: 'editServiceCategory',
              requireAuth: true,
              asyncParams: {
                'category': getDoc(
                    ['service_categories'], ServiceCategoriesRecord.serializer),
              },
              builder: (context, params) => EditServiceCategoryWidget(
                category: params.getParam('category', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CreateServiceCategory',
              path: 'createServiceCategory',
              requireAuth: true,
              builder: (context, params) => CreateServiceCategoryWidget(),
            ),
            FFRoute(
              name: 'DiscountList',
              path: 'discountList',
              requireAuth: true,
              builder: (context, params) => DiscountListWidget(
                isSelection: params.getParam('isSelection', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'EditDiscount',
              path: 'editDiscount',
              requireAuth: true,
              asyncParams: {
                'discount': getDoc(['discounts'], DiscountsRecord.serializer),
              },
              builder: (context, params) => EditDiscountWidget(
                discount: params.getParam('discount', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CreateDiscount',
              path: 'createDiscount',
              requireAuth: true,
              builder: (context, params) => CreateDiscountWidget(),
            ),
            FFRoute(
              name: 'ServiceList',
              path: 'serviceList',
              asyncParams: {
                'category': getDoc(
                    ['service_categories'], ServiceCategoriesRecord.serializer),
              },
              builder: (context, params) => ServiceListWidget(
                category: params.getParam('category', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ServiceSelectionList',
              path: 'serviceSelectionList',
              asyncParams: {
                'order': getDoc(['orders'], OrdersRecord.serializer),
                'category': getDoc(
                    ['service_categories'], ServiceCategoriesRecord.serializer),
              },
              builder: (context, params) => ServiceSelectionListWidget(
                order: params.getParam('order', ParamType.Document),
                category: params.getParam('category', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EditService',
              path: 'editService',
              requireAuth: true,
              asyncParams: {
                'service': getDoc(['services'], ServicesRecord.serializer),
              },
              builder: (context, params) => EditServiceWidget(
                service: params.getParam('service', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CreateService',
              path: 'createService',
              requireAuth: true,
              asyncParams: {
                'category': getDoc(
                    ['service_categories'], ServiceCategoriesRecord.serializer),
              },
              builder: (context, params) => CreateServiceWidget(
                category: params.getParam('category', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EditArticle',
              path: 'editArticle',
              requireAuth: true,
              asyncParams: {
                'article': getDoc(['articles'], ArticlesRecord.serializer),
              },
              builder: (context, params) => EditArticleWidget(
                article: params.getParam('article', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ArticleList',
              path: 'articleList',
              requireAuth: true,
              builder: (context, params) => ArticleListWidget(
                isSelection: params.getParam('isSelection', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'CreateArticle',
              path: 'createArticle',
              requireAuth: true,
              builder: (context, params) => CreateArticleWidget(),
            ),
            FFRoute(
              name: 'FAQList',
              path: 'fAQList',
              requireAuth: true,
              builder: (context, params) => FAQListWidget(
                isSelection: params.getParam('isSelection', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'CreateFAQ',
              path: 'createFAQ',
              requireAuth: true,
              builder: (context, params) => CreateFAQWidget(),
            ),
            FFRoute(
              name: 'EditFAQ',
              path: 'editFAQ',
              requireAuth: true,
              asyncParams: {
                'faq': getDoc(['faqs'], FaqsRecord.serializer),
              },
              builder: (context, params) => EditFAQWidget(
                faq: params.getParam('faq', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'FeedbackList',
              path: 'feedbackList',
              requireAuth: true,
              builder: (context, params) => FeedbackListWidget(
                isSelection: params.getParam('isSelection', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'EditFeedback',
              path: 'editFeedback',
              requireAuth: true,
              asyncParams: {
                'featureRequest': getDoc(
                    ['feature_requests'], FeatureRequestsRecord.serializer),
              },
              builder: (context, params) => EditFeedbackWidget(
                featureRequest:
                    params.getParam('featureRequest', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CreateRanger',
              path: 'createRanger',
              builder: (context, params) => CreateRangerWidget(),
            ),
            FFRoute(
              name: 'ActivityList',
              path: 'activityList',
              asyncParams: {
                'service': getDoc(['services'], ServicesRecord.serializer),
              },
              builder: (context, params) => ActivityListWidget(
                isSelection: params.getParam('isSelection', ParamType.bool),
                service: params.getParam('service', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CreateActivity',
              path: 'createActivity',
              requireAuth: true,
              asyncParams: {
                'service': getDoc(['services'], ServicesRecord.serializer),
              },
              builder: (context, params) => CreateActivityWidget(
                service: params.getParam('service', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EditActivity',
              path: 'editActivity',
              requireAuth: true,
              asyncParams: {
                'activity': getDoc(
                    ['services', 'activities'], ActivitiesRecord.serializer),
              },
              builder: (context, params) => EditActivityWidget(
                activity: params.getParam('activity', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'AddOnList',
              path: 'addOnList',
              asyncParams: {
                'service': getDoc(['services'], ServicesRecord.serializer),
              },
              builder: (context, params) => AddOnListWidget(
                isSelection: params.getParam('isSelection', ParamType.bool),
                service: params.getParam('service', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CreateAddOn',
              path: 'createAddOn',
              requireAuth: true,
              asyncParams: {
                'service': getDoc(['services'], ServicesRecord.serializer),
              },
              builder: (context, params) => CreateAddOnWidget(
                service: params.getParam('service', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'EditAddOn',
              path: 'editAddOn',
              requireAuth: true,
              asyncParams: {
                'addOn':
                    getDoc(['services', 'add_ons'], AddOnsRecord.serializer),
              },
              builder: (context, params) => EditAddOnWidget(
                addOn: params.getParam('addOn', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'CreateOrderBackup',
              path: 'createOrderBackup',
              builder: (context, params) => CreateOrderBackupWidget(),
            ),
            FFRoute(
              name: 'CreateRequest',
              path: 'createRequest',
              asyncParams: {
                'order': getDoc(['orders'], OrdersRecord.serializer),
              },
              builder: (context, params) => CreateRequestWidget(
                order: params.getParam('order', ParamType.Document),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList, collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
