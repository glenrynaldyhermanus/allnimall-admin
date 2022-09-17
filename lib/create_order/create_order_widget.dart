import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/order_created_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateOrderWidget extends StatefulWidget {
  const CreateOrderWidget({
    Key? key,
    this.order,
  }) : super(key: key);

  final OrdersRecord? order;

  @override
  _CreateOrderWidgetState createState() => _CreateOrderWidgetState();
}

class _CreateOrderWidgetState extends State<CreateOrderWidget> {
  TextEditingController? endTimeController;

  TextEditingController? startTimeController;

  DateTime? datePicked;
  String? timeListValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    endTimeController = TextEditingController();
    startTimeController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrdersRecord>(
      stream: OrdersRecord.getDocument(widget.order!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final createOrderOrdersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: true,
            title: Text(
              'Create Order',
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<OrderServicesRecord>>(
                      stream: queryOrderServicesRecord(
                        parent: createOrderOrdersRecord.reference,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<OrderServicesRecord>
                            containerOrderServicesRecordList = snapshot.data!;
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 40, 24, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            valueOrDefault<String>(
                                              FFAppState().selectedCustomerName,
                                              'Pilih Customer',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: Icon(
                                            Icons.people_outline_rounded,
                                            color: Color(0xFF1F2126),
                                            size: 24,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed(
                                              'CustomerList',
                                              queryParams: {
                                                'isSelection': serializeParam(
                                                    true, ParamType.bool),
                                              }.withoutNulls,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 14, 24, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            valueOrDefault<String>(
                                              FFAppState()
                                                  .selectedCustomerAddress,
                                              'Alamat Customer',
                                            ),
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 40, 24, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${containerOrderServicesRecordList.length.toString()} services',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30,
                                              borderWidth: 1,
                                              buttonSize: 60,
                                              icon: Icon(
                                                Icons
                                                    .add_shopping_cart_outlined,
                                                color: Color(0xFF1F2126),
                                                size: 24,
                                              ),
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'ServiceCategoryList',
                                                  queryParams: {
                                                    'isSelection':
                                                        serializeParam(true,
                                                            ParamType.bool),
                                                    'order': serializeParam(
                                                        createOrderOrdersRecord,
                                                        ParamType.Document),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'order':
                                                        createOrderOrdersRecord,
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 16, 16),
                                        child: Builder(
                                          builder: (context) {
                                            final selectedServices =
                                                containerOrderServicesRecordList
                                                    .toList();
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  selectedServices.length,
                                                  (selectedServicesIndex) {
                                                final selectedServicesItem =
                                                    selectedServices[
                                                        selectedServicesIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 4),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  selectedServicesItem
                                                                      .name!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                                Text(
                                                                  ' x ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                                Text(
                                                                  selectedServicesItem
                                                                      .quantity!
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ],
                                                            ),
                                                            if (selectedServicesItem
                                                                    .addOns!
                                                                    .toList()
                                                                    .length >
                                                                0)
                                                              Text(
                                                                '+ ${functions.addOnsFromService(selectedServicesItem)}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          11,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          functions.countTotalOrderService(
                                                              selectedServicesItem
                                                                  .fee,
                                                              selectedServicesItem
                                                                  .addOns!
                                                                  .toList(),
                                                              selectedServicesItem
                                                                  .quantity),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .commaDecimal,
                                                          currency: 'Rp',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryColor,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                      if (containerOrderServicesRecordList
                                              .length >
                                          0)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24, 0, 16, 16),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Total',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Text(
                                                formatNumber(
                                                  functions.countTotalAllServices(
                                                      containerOrderServicesRecordList
                                                          .toList()),
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                  currency: 'Rp',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 40, 24, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                                'MMMMEEEEd', datePicked),
                                            'Tanggal Grooming',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: Icon(
                                            Icons.date_range,
                                            color: Color(0xFF1F2126),
                                            size: 24,
                                          ),
                                          onPressed: () async {
                                            if (kIsWeb) {
                                              final _datePickedDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2050),
                                              );

                                              if (_datePickedDate != null) {
                                                setState(
                                                  () => datePicked = DateTime(
                                                    _datePickedDate.year,
                                                    _datePickedDate.month,
                                                    _datePickedDate.day,
                                                  ),
                                                );
                                              }
                                            } else {
                                              await DatePicker.showDatePicker(
                                                context,
                                                showTitleActions: true,
                                                onConfirm: (date) {
                                                  setState(
                                                      () => datePicked = date);
                                                },
                                                currentTime:
                                                    getCurrentTimestamp,
                                                minTime: DateTime(0, 0, 0),
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 14, 24, 0),
                                child: FlutterFlowDropDown(
                                  options: ['Pagi', 'Siang', 'Sore'],
                                  onChanged: (val) =>
                                      setState(() => timeListValue = val),
                                  height: 50,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  hintText: 'Waktu Grooming',
                                  fillColor: Colors.white,
                                  elevation: 2,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0,
                                  borderRadius: 0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      22, 4, 12, 4),
                                  hidesUnderline: true,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 14, 24, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 4, 0),
                                        child: TextFormField(
                                          controller: startTimeController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Jam Mulai',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                            hintText: '09:00',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 0, 0, 0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: TextFormField(
                                          controller: endTimeController,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Selesai',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                            hintText: '12:00',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 0, 0, 0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 40, 24, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 52,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            valueOrDefault<String>(
                                              FFAppState().selectedRangerName,
                                              'Pilih Ranger',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: Icon(
                                            Icons.people_outline_rounded,
                                            color: Color(0xFF1F2126),
                                            size: 24,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed(
                                              'RangerList',
                                              queryParams: {
                                                'isSelections': serializeParam(
                                                    true, ParamType.bool),
                                                'isAsssignment': serializeParam(
                                                    false, ParamType.bool),
                                              }.withoutNulls,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 24, 0, 24),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final ordersUpdateData =
                                        createOrdersRecordData(
                                      createdAt: getCurrentTimestamp,
                                      scheduledAt: datePicked,
                                      status: 'Confirmed',
                                      customerAddress:
                                          FFAppState().selectedCustomerAddress,
                                      customerLatlng:
                                          FFAppState().selectedCustomerLatLng,
                                      orderNo: functions.generateOrderNo(),
                                      customerName:
                                          FFAppState().selectedCustomerName,
                                      paymentStatus: 'Unpaid',
                                      prefferedTime: timeListValue,
                                      startTime: startTimeController!.text,
                                      endTime: endTimeController!.text,
                                      rangerName:
                                          FFAppState().selectedRangerName,
                                      rangerPhone:
                                          FFAppState().selectedRangerPhone,
                                      rangerProfilePicture:
                                          FFAppState().selectedRangerPicture,
                                      confirmedAt: getCurrentTimestamp,
                                      customerPhone:
                                          FFAppState().selectedCustomerPhone,
                                      customerUid:
                                          FFAppState().selectedCustomer,
                                      rangerUid: FFAppState().assignedRanger,
                                      petCategory: functions
                                          .petCategoryFromOrderServices(
                                              containerOrderServicesRecordList
                                                  .toList()),
                                      name:
                                          functions.orderNameFromOrderServices(
                                              containerOrderServicesRecordList
                                                  .toList()),
                                      service:
                                          functions.serviceFromOrderServices(
                                              containerOrderServicesRecordList
                                                  .toList()),
                                      quantity:
                                          functions.quantityFromOrderServices(
                                              containerOrderServicesRecordList
                                                  .toList()),
                                      amount: functions.countTotalAllServices(
                                          containerOrderServicesRecordList
                                              .toList()),
                                    );
                                    await createOrderOrdersRecord.reference
                                        .update(ordersUpdateData);
                                    context.pop();
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: OrderCreatedWidget(
                                            order: createOrderOrdersRecord,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  text: 'Create Order',
                                  options: FFButtonOptions(
                                    width: 270,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
