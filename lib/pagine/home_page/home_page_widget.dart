import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pagine/lista_vuota/lista_vuota_widget.dart';
import '/pagine/seleziona_data/seleziona_data_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (dateTimeFormat(
                'yMd',
                FFAppState().selectedDate,
                locale: FFLocalizations.of(context).languageCode,
              ) ==
              null ||
          dateTimeFormat(
                'yMd',
                FFAppState().selectedDate,
                locale: FFLocalizations.of(context).languageCode,
              ) ==
              '') {
        setState(() {
          FFAppState().selectedDate = getCurrentTimestamp;
        });
      }
      _model.listView112 = await actions.filterView(
        FFAppState().selectedDate!,
        FFAppState().tasksList.toList(),
      );
      setState(() {
        FFAppState().view = _model.listView11!.toList().cast<dynamic>();
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '24o3rnx5' /* Da fare */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Unbounded',
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              ),
            ],
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).accent1,
              icon: Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
            FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).accent1,
              icon: Icon(
                Icons.view_comfortable_rounded,
                color: Colors.white,
                size: 23.0,
              ),
              onPressed: () {
                print('IconButton pressed ...');
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: Builder(
                    builder: (context) {
                      final listTasks = FFAppState().view.toList();
                      if (listTasks.isEmpty) {
                        return Center(
                          child: ListaVuotaWidget(),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listTasks.length,
                        itemBuilder: (context, listTasksIndex) {
                          final listTasksItem = listTasks[listTasksIndex];
                          return Opacity(
                            opacity: valueOrDefault<double>(
                              getJsonField(
                                        listTasksItem,
                                        r'''$.done''',
                                      ) ==
                                      functions.returnTheJSON('true')
                                  ? 0.5
                                  : 1.0,
                              1.0,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  13.0, 7.5, 13.0, 7.5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: colorFromCssString(
                                        getJsonField(
                                          listTasksItem,
                                          r'''$.color''',
                                        ).toString(),
                                        defaultColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        if (getJsonField(
                                              listTasksItem,
                                              r'''$.boldIcon''',
                                            ) ==
                                            functions.returnTheJSON('true')) {
                                          return Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  listTasksItem,
                                                  r'''$.icon''',
                                                ).toString(),
                                                'done',
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Material',
                                                        color: Colors.black,
                                                        fontSize: 23.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          );
                                        } else {
                                          return Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  listTasksItem,
                                                  r'''$.icon''',
                                                ).toString(),
                                                'done',
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Material',
                                                    color: colorFromCssString(
                                                      getJsonField(
                                                        listTasksItem,
                                                        r'''$.iconColor''',
                                                      ).toString(),
                                                      defaultColor:
                                                          Colors.black,
                                                    ),
                                                    fontSize: 23.0,
                                                    fontWeight: FontWeight.w100,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              if (getJsonField(
                                                    listTasksItem,
                                                    r'''$.done''',
                                                  ) ==
                                                  functions
                                                      .returnTheJSON('false')) {
                                                return Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      listTasksItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                    'Task',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 16.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                );
                                              } else {
                                                return Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      listTasksItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                    'Task',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 16.5,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                );
                                              }
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 1.0, 0.0, 0.0),
                                            child: Text(
                                              '${getJsonField(
                                                listTasksItem,
                                                r'''$.timestart''',
                                              ).toString()} - ${getJsonField(
                                                listTasksItem,
                                                r'''$.timeend''',
                                              ).toString()}',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 13.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 1.0, 0.0),
                                      child: Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            getJsonField(
                                                      listTasksItem,
                                                      r'''$.done''',
                                                    ) ==
                                                    functions
                                                        .returnTheJSON('true')
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : Color(0x00A1A0A3),
                                            Color(0x00A1A0A3),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              getJsonField(
                                                        listTasksItem,
                                                        r'''$.done''',
                                                      ) ==
                                                      functions
                                                          .returnTheJSON('true')
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            width: 2.0,
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Visibility(
                                          visible: getJsonField(
                                                listTasksItem,
                                                r'''$.done''',
                                              ) ==
                                              functions.returnTheJSON('true'),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Icon(
                                              Icons.done,
                                              color: Colors.white,
                                              size: 15.3,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                3.0, 0.0, 2.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Color(0x00105DFB),
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 37.0,
                              fillColor: Color(0x00105DFB),
                              icon: Icon(
                                Icons.chevron_left,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 23.0,
                              ),
                              onPressed: () async {
                                setState(() {
                                  FFAppState().selectedDate = functions
                                      .remove1day(FFAppState().selectedDate!);
                                });
                                _model.listView113 = await actions.filterView(
                                  FFAppState().selectedDate!,
                                  FFAppState().tasksList.toList(),
                                );
                                setState(() {
                                  FFAppState().view = _model.listView11!
                                      .toList()
                                      .cast<dynamic>();
                                });

                                setState(() {});
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 2.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dateTimeFormat(
                                      'EEEE dd',
                                      FFAppState().selectedDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 14.5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      'MMMM yyyy',
                                      FFAppState().selectedDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Color(0x00105DFB),
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 37.0,
                            fillColor: Color(0x00105DFB),
                            icon: Icon(
                              Icons.chevron_right,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 23.0,
                            ),
                            onPressed: () async {
                              setState(() {
                                FFAppState().selectedDate = functions
                                    .add1day(FFAppState().selectedDate!);
                              });
                              _model.listView11 = await actions.filterView(
                                FFAppState().selectedDate!,
                                FFAppState().tasksList.toList(),
                              );
                              setState(() {
                                FFAppState().view =
                                    _model.listView11!.toList().cast<dynamic>();
                              });

                              setState(() {});
                            },
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 37.0,
                            icon: Icon(
                              Icons.calendar_month,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context)
                                        .requestFocus(_model.unfocusNode),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SelezionaDataWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 13.0, 10.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('NuovaTask');
                      },
                      text: FFLocalizations.of(context).getText(
                        '3e0hlo3o' /* Nuovo */,
                      ),
                      icon: Icon(
                        Icons.add,
                        size: 22.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 18.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
