import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditServiceWidget extends StatefulWidget {
  const EditServiceWidget({
    Key? key,
    this.service,
  }) : super(key: key);

  final ServicesRecord? service;

  @override
  _EditServiceWidgetState createState() => _EditServiceWidgetState();
}

class _EditServiceWidgetState extends State<EditServiceWidget> {
  TextEditingController? descriptionController;

  TextEditingController? nameController;

  TextEditingController? feeController;

  bool? switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    descriptionController =
        TextEditingController(text: widget.service!.description);
    nameController = TextEditingController(text: widget.service!.name);
    feeController =
        TextEditingController(text: widget.service!.fee?.toString());
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Edit Service',
          style: FlutterFlowTheme.of(context).title3.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.delete_forever_outlined,
              color: FlutterFlowTheme.of(context).secondaryColor,
              size: 30,
            ),
            onPressed: () async {
              await widget.service!.reference.delete();
              context.pop();
            },
          ),
        ],
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                        child: TextFormField(
                          controller: nameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: FlutterFlowTheme.of(context).bodyText2,
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                        child: TextFormField(
                          controller: descriptionController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: FlutterFlowTheme.of(context).bodyText2,
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                        child: TextFormField(
                          controller: feeController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Fee',
                            labelStyle: FlutterFlowTheme.of(context).bodyText2,
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                        child: SwitchListTile(
                          value: switchListTileValue ??=
                              widget.service!.isActive!,
                          onChanged: (newValue) =>
                              setState(() => switchListTileValue = newValue),
                          title: Text(
                            'Publish service?',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          tileColor: FlutterFlowTheme.of(context).tertiaryColor,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 40, 24, 0),
                        child: StreamBuilder<List<ActivitiesRecord>>(
                          stream: queryActivitiesRecord(
                            parent: widget.service!.reference,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<ActivitiesRecord>
                                containerActivitiesRecordList = snapshot.data!;
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 52,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${containerActivitiesRecordList.length.toString()} activities',
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
                                        Icons.volunteer_activism,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          'ActivityList',
                                          queryParams: {
                                            'isSelection': serializeParam(
                                                false, ParamType.bool),
                                            'service': serializeParam(
                                                widget.service,
                                                ParamType.Document),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'service': widget.service,
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                        child: StreamBuilder<List<AddOnsRecord>>(
                          stream: queryAddOnsRecord(
                            parent: widget.service!.reference,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<AddOnsRecord> containerAddOnsRecordList =
                                snapshot.data!;
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 52,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${containerAddOnsRecordList.length.toString()} add ons',
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
                                        Icons.add_shopping_cart,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          'AddOnList',
                                          queryParams: {
                                            'isSelection': serializeParam(
                                                false, ParamType.bool),
                                            'service': serializeParam(
                                                widget.service,
                                                ParamType.Document),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'service': widget.service,
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 24),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final servicesUpdateData = createServicesRecordData(
                              isActive: switchListTileValue,
                              name: nameController!.text,
                              fee: double.parse(feeController!.text),
                              description: descriptionController!.text,
                            );
                            await widget.service!.reference
                                .update(servicesUpdateData);
                            context.pop();
                          },
                          text: 'Save',
                          options: FFButtonOptions(
                            width: 270,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
