import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pagine/nuovo_tag/nuovo_tag_widget.dart';
import '/pagine/rimuovi_tag/rimuovi_tag_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nuova_task_model.dart';
export 'nuova_task_model.dart';

class NuovaTaskWidget extends StatefulWidget {
  const NuovaTaskWidget({Key? key}) : super(key: key);

  @override
  _NuovaTaskWidgetState createState() => _NuovaTaskWidgetState();
}

class _NuovaTaskWidgetState extends State<NuovaTaskWidget> {
  late NuovaTaskModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NuovaTaskModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.selectedTag = [];
        _model.selectedDate = getCurrentTimestamp;
        _model.customOrarioSel = getCurrentTimestamp;
        _model.selectedScadenz = 'no';
        _model.selColore = Color(0xFF87CEEB);
      });
    });

    _model.textController ??= TextEditingController();
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
          title: Text(
            FFLocalizations.of(context).getText(
              'qmbnwhim' /* Nuova Task */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Unbounded',
                  color: Colors.white,
                  fontSize: 23.5,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts: false,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).accent1,
                icon: Icon(
                  Icons.info_outline,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  autofocus: true,
                  textCapitalization: TextCapitalization.none,
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'fzfwurao' /* Nome Task */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Unbounded',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      'crvm2trw' /* Scegli il nome della tua Task */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                            ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  textAlign: TextAlign.start,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 13.5, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'r5x83z9n' /* Scegli uno o più tag da associ... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.5, 0.0, 0.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            final tagListt = FFAppState().tagList.toList();
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(tagListt.length,
                                  (tagListtIndex) {
                                final tagListtItem = tagListt[tagListtIndex];
                                return Opacity(
                                  opacity:
                                      _model.selectedTag.contains(tagListtItem)
                                          ? 1.0
                                          : 0.55,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 8.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (_model.selectedTag
                                            .contains(tagListtItem)) {
                                          setState(() {
                                            _model.removeFromSelectedTag(
                                                tagListtItem);
                                          });
                                        } else {
                                          setState(() {
                                            _model
                                                .addToSelectedTag(tagListtItem);
                                          });
                                        }
                                      },
                                      onLongPress: () async {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: RimuoviTagWidget(
                                                  namev: tagListtItem,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            () {
                                              if ((tagListtIndex == 1) ||
                                                  (tagListtIndex == 6) ||
                                                  (tagListtIndex == 11) ||
                                                  (tagListtIndex == 16) ||
                                                  (tagListtIndex == 21) ||
                                                  (tagListtIndex == 26)) {
                                                return Color(0xB870A1FF);
                                              } else if ((tagListtIndex == 2) ||
                                                  (tagListtIndex == 7) ||
                                                  (tagListtIndex == 12) ||
                                                  (tagListtIndex == 17) ||
                                                  (tagListtIndex == 22) ||
                                                  (tagListtIndex == 27)) {
                                                return Color(0xB8FF70A6);
                                              } else if ((tagListtIndex == 3) ||
                                                  (tagListtIndex == 8) ||
                                                  (tagListtIndex == 13) ||
                                                  (tagListtIndex == 18) ||
                                                  (tagListtIndex == 23) ||
                                                  (tagListtIndex == 28)) {
                                                return Color(0xB8A3FF70);
                                              } else if ((tagListtIndex == 4) ||
                                                  (tagListtIndex == 9) ||
                                                  (tagListtIndex == 14) ||
                                                  (tagListtIndex == 19) ||
                                                  (tagListtIndex == 24) ||
                                                  (tagListtIndex == 29)) {
                                                return Color(0xB7FFFC70);
                                              } else {
                                                return Color(0xB7FFAA70);
                                              }
                                            }(),
                                            Color(0xB7FFAA70),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              () {
                                                if ((tagListtIndex == 1) ||
                                                    (tagListtIndex == 6) ||
                                                    (tagListtIndex == 11) ||
                                                    (tagListtIndex == 16) ||
                                                    (tagListtIndex == 21) ||
                                                    (tagListtIndex == 26)) {
                                                  return Color(0xFF70A1FF);
                                                } else if ((tagListtIndex ==
                                                        2) ||
                                                    (tagListtIndex == 7) ||
                                                    (tagListtIndex == 12) ||
                                                    (tagListtIndex == 17) ||
                                                    (tagListtIndex == 22) ||
                                                    (tagListtIndex == 27)) {
                                                  return Color(0xFFFF70A6);
                                                } else if ((tagListtIndex ==
                                                        3) ||
                                                    (tagListtIndex == 8) ||
                                                    (tagListtIndex == 13) ||
                                                    (tagListtIndex == 18) ||
                                                    (tagListtIndex == 23) ||
                                                    (tagListtIndex == 28)) {
                                                  return Color(0xFFA3FF70);
                                                } else if ((tagListtIndex ==
                                                        4) ||
                                                    (tagListtIndex == 9) ||
                                                    (tagListtIndex == 14) ||
                                                    (tagListtIndex == 19) ||
                                                    (tagListtIndex == 24) ||
                                                    (tagListtIndex == 29)) {
                                                  return Color(0xFFFFFC70);
                                                } else {
                                                  return Color(0xFFFFAA70);
                                                }
                                              }(),
                                              Color(0xFFFFAA70),
                                            ),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              tagListtItem,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 8.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
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
                                      child: NuovoTagWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              height: 32.0,
                              decoration: BoxDecoration(
                                color: Color(0xB7105DFB),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Color(0xFF105DFB),
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'jbh4kf36' /* + Nuova Tag */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .addToStart(SizedBox(width: 8.0))
                          .addToEnd(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 4.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '969trnng' /* Scegli una data di inizio */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 6.0, 15.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final _datePicked1Date = await showDatePicker(
                        context: context,
                        initialDate: _model.selectedDate!,
                        firstDate: _model.selectedDate!,
                        lastDate: DateTime(2050),
                      );

                      TimeOfDay? _datePicked1Time;
                      if (_datePicked1Date != null) {
                        _datePicked1Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(_model.selectedDate!),
                        );
                      }

                      if (_datePicked1Date != null &&
                          _datePicked1Time != null) {
                        safeSetState(() {
                          _model.datePicked1 = DateTime(
                            _datePicked1Date.year,
                            _datePicked1Date.month,
                            _datePicked1Date.day,
                            _datePicked1Time!.hour,
                            _datePicked1Time.minute,
                          );
                        });
                      }
                      setState(() {
                        _model.selectedDate = _model.datePicked1 == null
                            ? FFAppState().selectedDate
                            : _model.datePicked1;
                      });
                    },
                    text: dateTimeFormat(
                      'dd/MM/yyyy - kk:mm',
                      _model.selectedDate,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    options: FFButtonOptions(
                      height: 35.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 11.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'nk1o62p1' /* Tempo previsto per completare ... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.5, 0.0, 0.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Opacity(
                              opacity:
                                  _model.selectedScadenz == 'no' ? 1.0 : 0.55,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.selectedScadenz = 'no';
                                    });
                                  },
                                  child: Container(
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xB870A1FF),
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Color(0xFF70A1FF),
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '34o3g17n' /* Non specificato */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity:
                                  _model.selectedScadenz == '30m' ? 1.0 : 0.55,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.selectedScadenz = '30m';
                                    });
                                  },
                                  child: Container(
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xB8FF70A6),
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Color(0xFFFF70A6),
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '79vkjsv9' /* 30 minuti */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity:
                                  _model.selectedScadenz == '1h' ? 1.0 : 0.55,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.selectedScadenz = '1h';
                                    });
                                  },
                                  child: Container(
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xB7A3FF70),
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Color(0xFFA3FF70),
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'iroajowm' /* 1 ora */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Opacity(
                              opacity:
                                  _model.selectedScadenz == '2h' ? 1.0 : 0.55,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.selectedScadenz = '2h';
                                    });
                                  },
                                  child: Container(
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xB8FFFC70),
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Color(0xFFFFFC70),
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'jhkn1mlu' /* 2 ore */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Opacity(
                          opacity:
                              _model.selectedScadenz == 'custom' ? 1.0 : 0.55,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 8.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final _datePicked2Time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      _model.customOrarioSel!),
                                );
                                if (_datePicked2Time != null) {
                                  safeSetState(() {
                                    _model.datePicked2 = DateTime(
                                      _model.customOrarioSel!.year,
                                      _model.customOrarioSel!.month,
                                      _model.customOrarioSel!.day,
                                      _datePicked2Time.hour,
                                      _datePicked2Time.minute,
                                    );
                                  });
                                }
                                setState(() {
                                  _model.selectedScadenz = 'custom';
                                  _model.customOrarioSel = _model.datePicked2;
                                });
                              },
                              child: Container(
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: Color(0xB88AC7FF),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Color(0xFF8AC7FF),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'h7onuye2' /* Durata personalizzata */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .addToStart(SizedBox(width: 8.0))
                          .addToEnd(SizedBox(width: 16.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 6.5, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '8wqxvkah' /* Scegli un colore per la Task */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 6.5, 0.0, 0.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFF87CEEB)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF87CEEB),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFF5E60CE)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF5E60CE),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFFE5383B)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE5383B),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFF232222)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF232222),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFFFF4D6D)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF4D6D),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFFF5F5F5)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF9D9191),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Visibility(
                                  visible: !FFAppState().prmm,
                                  child: Icon(
                                    Icons.workspace_premium_outlined,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFF00FFFF)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF00FFFF),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Visibility(
                                  visible: !FFAppState().prmm,
                                  child: Icon(
                                    Icons.workspace_premium_outlined,
                                    color: Color(0xFFD5763F),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFFFFD3D3)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFD3D3),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Visibility(
                                  visible: !FFAppState().prmm,
                                  child: Icon(
                                    Icons.workspace_premium_outlined,
                                    color: Color(0xFFD5763F),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFF00FF99)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF00FF99),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Visibility(
                                  visible: !FFAppState().prmm,
                                  child: Icon(
                                    Icons.workspace_premium_outlined,
                                    color: Color(0xFFD5763F),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFFFFDAB9)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFDAB9),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Visibility(
                                  visible: !FFAppState().prmm,
                                  child: Icon(
                                    Icons.workspace_premium_outlined,
                                    color: Color(0xFFD5763F),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFF4169E1)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF4169E1),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Visibility(
                                  visible: !FFAppState().prmm,
                                  child: Icon(
                                    Icons.workspace_premium_outlined,
                                    color: Color(0xFFD5763F),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFFE6E6FA)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFE6E6FA),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Visibility(
                                  visible: !FFAppState().prmm,
                                  child: Icon(
                                    Icons.workspace_premium_outlined,
                                    color: Color(0xFFD5763F),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selColore == Color(0xFF3399FF)
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).notSel,
                                FlutterFlowTheme.of(context).notSel,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Container(
                                width: 33.0,
                                height: 33.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFF3399FF),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Visibility(
                                  visible: !FFAppState().prmm,
                                  child: Icon(
                                    Icons.workspace_premium_outlined,
                                    color: Color(0xFFD5763F),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 6.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final _colorPickedColor = await showFFColorPicker(
                                context,
                                currentColor: _model.colorPicked ??=
                                    FlutterFlowTheme.of(context).primary,
                                showRecentColors: false,
                                allowOpacity: false,
                                textColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                secondaryTextColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                primaryButtonBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                primaryButtonTextColor: Colors.white,
                                primaryButtonBorderColor: Colors.transparent,
                                displayAsBottomSheet: isMobileWidth(context),
                              );

                              if (_colorPickedColor != null) {
                                safeSetState(() => _model.colorPicked =
                                    _colorPickedColor.withOpacity(1.0));
                              }

                              setState(() {
                                _model.selColore = _model.colorPicked;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).notSel,
                                borderRadius: BorderRadius.circular(100.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Container(
                                  width: 33.0,
                                  height: 33.0,
                                  decoration: BoxDecoration(
                                    color: _model.selColore,
                                    borderRadius: BorderRadius.circular(100.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Icon(
                                    Icons.color_lens,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 6.5, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '5gvdj8uz' /* Scegli un icona per la task */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 6.5, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final icons = functions.getIcons()?.toList() ?? [];
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(icons.length, (iconsIndex) {
                            final iconsItem = icons[iconsIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 6.0, 0.0),
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    _model.selColore == Color(0xFF87CEEB)
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).notSel,
                                    FlutterFlowTheme.of(context).notSel,
                                  ),
                                  borderRadius: BorderRadius.circular(100.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    iconsItem,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Material',
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.w100,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
