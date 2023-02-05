import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddServicesWidget extends StatefulWidget {
  const AddServicesWidget({
    Key? key,
    this.service,
    this.order,
  }) : super(key: key);

  final ServicesRecord? service;
  final OrdersRecord? order;

  @override
  _AddServicesWidgetState createState() => _AddServicesWidgetState();
}

class _AddServicesWidgetState extends State<AddServicesWidget> {
  Map<AddOnsRecord, bool> checkboxListTileValueMap = {};
  List<AddOnsRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  int? countControllerValue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 480,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Container(
                          width: 50,
                          height: 4,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lineColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            widget.service!.name!,
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ),
                        Text(
                          formatNumber(
                            widget.service!.fee!,
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.commaDecimal,
                            currency: 'Rp',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<List<AddOnsRecord>>(
                    stream: queryAddOnsRecord(
                      parent: widget.service!.reference,
                      queryBuilder: (addOnsRecord) => addOnsRecord
                          .where('is_active', isEqualTo: true)
                          .orderBy('sequence'),
                    ),
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
                      List<AddOnsRecord> columnAddOnsRecordList =
                          snapshot.data!;
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(columnAddOnsRecordList.length,
                              (columnIndex) {
                            final columnAddOnsRecord =
                                columnAddOnsRecordList[columnIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                ),
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Color(0xFF95A1AC),
                                  ),
                                  child: CheckboxListTile(
                                    value: checkboxListTileValueMap[
                                        columnAddOnsRecord] ??= false,
                                    onChanged: (newValue) async {
                                      setState(() => checkboxListTileValueMap[
                                          columnAddOnsRecord] = newValue!);
                                    },
                                    title: Text(
                                      columnAddOnsRecord.name!,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                    ),
                                    subtitle: Text(
                                      formatNumber(
                                        columnAddOnsRecord.fee!,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.commaDecimal,
                                        currency: '+',
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            fontSize: 12,
                                          ),
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    dense: false,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  height: 16,
                  thickness: 1,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Text(
                        'Number of Pets',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      child: Container(
                        width: 148,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).tertiaryColor,
                            width: 1,
                          ),
                        ),
                        child: FlutterFlowCountController(
                          decrementIconBuilder: (enabled) => Icon(
                            Icons.remove_circle,
                            color: enabled
                                ? FlutterFlowTheme.of(context).secondaryColor
                                : Color(0xFF828D9A),
                            size: 28,
                          ),
                          incrementIconBuilder: (enabled) => Icon(
                            Icons.add_circle,
                            color: enabled
                                ? FlutterFlowTheme.of(context).secondaryColor
                                : Color(0xFF828D9A),
                            size: 28,
                          ),
                          countBuilder: (count) => Text(
                            count.toString(),
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          count: countControllerValue ??= 1,
                          updateCount: (count) =>
                              setState(() => countControllerValue = count),
                          stepSize: 1,
                          minimum: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final orderServicesCreateData = {
                              ...createOrderServicesRecordData(
                                name: widget.service!.name,
                                quantity: countControllerValue,
                                fee: widget.service!.fee,
                                serviceUid: widget.service!.reference,
                                categoryName: widget.service!.categoryName,
                              ),
                              'add_ons': getAddOnsListFirestoreData(
                                functions.addOnDocToList(
                                    checkboxListTileCheckedItems.toList()),
                              ),
                            };
                            await OrderServicesRecord.createDoc(
                                    widget.order!.reference)
                                .set(orderServicesCreateData);
                            Navigator.pop(context);
                          },
                          text: 'Add service - ${formatNumber(
                            functions.countTotalService(
                                widget.service!.fee,
                                checkboxListTileCheckedItems.toList(),
                                countControllerValue),
                            formatType: FormatType.decimal,
                            decimalType: DecimalType.periodDecimal,
                            currency: 'Rp',
                          )}',
                          options: FFButtonOptions(
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
