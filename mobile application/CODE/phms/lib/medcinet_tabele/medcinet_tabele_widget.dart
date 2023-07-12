import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'medcinet_tabele_model.dart';
export 'medcinet_tabele_model.dart';

class MedcinetTabeleWidget extends StatefulWidget {
  const MedcinetTabeleWidget({Key? key}) : super(key: key);

  @override
  _MedcinetTabeleWidgetState createState() => _MedcinetTabeleWidgetState();
}

class _MedcinetTabeleWidgetState extends State<MedcinetTabeleWidget>
    with TickerProviderStateMixin {
  late MedcinetTabeleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MedcinetTabeleModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Medcinet_tabele'});

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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('MEDCINET_TABELE_arrow_back_rounded_ICN_O');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'brfxjt15' /* Medicine */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: 523.4,
            height: 910.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/v870-mynt-19.jpg',
                ).image,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.85, -0.93),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('MEDCINET_TABELE_Icon_ahvpwyh7_ON_TAP');
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('Setting');
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                      size: 35.0,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.03),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController1 ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'p2jybqdu' /* medicine  1  */,
                      ),
                      FFLocalizations.of(context).getText(
                        'jtv7h1ri' /* medicine  2  */,
                      ),
                      FFLocalizations.of(context).getText(
                        'sjx4h8ui' /* medicine  3  */,
                      )
                    ],
                    onChanged: (val) async {
                      setState(() => _model.dropDownValue1 = val);
                      logFirebaseEvent(
                          'MEDCINET_TABELE_DropDown_7y2lu22n_ON_FOR');
                      logFirebaseEvent('DropDown_timer');
                      _model.timerController1.onExecute
                          .add(StopWatchExecute.start);
                    },
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'lw3bqb4b' /* Please select medicine   */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.table,
                    ),
                    fillColor: Colors.white,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.79, 0.34),
                  child: FlutterFlowTimer(
                    initialTime: _model.timerMilliseconds1,
                    getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        milliSecond: false),
                    timer: _model.timerController1,
                    updateStateInterval: Duration(milliseconds: 54645),
                    onChanged: (value, displayTime, shouldUpdate) {
                      _model.timerMilliseconds1 = value;
                      _model.timerValue1 = displayTime;
                      if (shouldUpdate) setState(() {});
                    },
                    onEnded: () async {
                      logFirebaseEvent(
                          'MEDCINET_TABELE_Timer_07yb1dht_ON_TIMER_');
                      logFirebaseEvent('Timer_date_time_picker');

                      final _datePicked1Time = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                      );
                      if (_datePicked1Time != null) {
                        setState(() {
                          _model.datePicked1 = DateTime(
                            getCurrentTimestamp.year,
                            getCurrentTimestamp.month,
                            getCurrentTimestamp.day,
                            _datePicked1Time.hour,
                            _datePicked1Time.minute,
                          );
                        });
                      }
                    },
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.94, 0.67),
                  child: Container(
                    width: 160.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Color(0xFF9E9E9E),
                        width: 1.0,
                      ),
                    ),
                    child: FlutterFlowCountController(
                      decrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.minus,
                        color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                        size: 20.0,
                      ),
                      incrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.plus,
                        color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                        size: 20.0,
                      ),
                      countBuilder: (count) => Text(
                        count.toString(),
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      count: _model.countControllerValue1 ??= 0,
                      updateCount: (count) =>
                          setState(() => _model.countControllerValue1 = count),
                      stepSize: 1,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.16, -0.71),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'v5ko8aq9' /* medicine Table */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 35.0,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation']!),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.94, -0.25),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ltczmo83' /* Tap for time of medicine  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.8, 0.78),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'rmrozyyr' /* Tap for timer  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.92, -0.43),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController2 ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'elgectsn' /* medicine  1  */,
                      ),
                      FFLocalizations.of(context).getText(
                        'i5gd1fm2' /* medicine  2  */,
                      ),
                      FFLocalizations.of(context).getText(
                        'zlwz3byb' /* medicine  3  */,
                      )
                    ],
                    onChanged: (val) async {
                      setState(() => _model.dropDownValue2 = val);
                      logFirebaseEvent(
                          'MEDCINET_TABELE_DropDown_0aeav78u_ON_FOR');
                      logFirebaseEvent('DropDown_timer');
                      _model.timerController3.onExecute
                          .add(StopWatchExecute.start);
                    },
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'pqtrure8' /* Please select medicine   */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.table,
                    ),
                    fillColor: Colors.white,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.94, 0.65),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '83uh8nh0' /* Tap for time of medicine  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.94, -0.25),
                  child: Container(
                    width: 160.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Color(0xFF9E9E9E),
                        width: 1.0,
                      ),
                    ),
                    child: FlutterFlowCountController(
                      decrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.minus,
                        color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                        size: 20.0,
                      ),
                      incrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.plus,
                        color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                        size: 20.0,
                      ),
                      countBuilder: (count) => Text(
                        count.toString(),
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      count: _model.countControllerValue2 ??= 0,
                      updateCount: (count) =>
                          setState(() => _model.countControllerValue2 = count),
                      stepSize: 1,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.79, -0.11),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'sb3zle4k' /* Tap for timer  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.5),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController3 ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        '2hkbn1wu' /* medicine  1  */,
                      ),
                      FFLocalizations.of(context).getText(
                        '50wisfxk' /* medicine  2  */,
                      ),
                      FFLocalizations.of(context).getText(
                        'g19f03bp' /* medicine  3  */,
                      )
                    ],
                    onChanged: (val) async {
                      setState(() => _model.dropDownValue3 = val);
                      logFirebaseEvent(
                          'MEDCINET_TABELE_DropDown_qax80pg9_ON_FOR');
                      logFirebaseEvent('DropDown_timer');
                      _model.timerController2.onExecute
                          .add(StopWatchExecute.start);
                    },
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'lbyaozup' /* Please select medicine   */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.table,
                    ),
                    fillColor: Colors.white,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 0.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isSearchable: false,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.94, 0.2),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'huv6hpwa' /* Tap for time of medicine  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.79, 0.78),
                  child: FlutterFlowTimer(
                    initialTime: _model.timerMilliseconds2,
                    getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        milliSecond: false),
                    timer: _model.timerController2,
                    updateStateInterval: Duration(milliseconds: 54645),
                    onChanged: (value, displayTime, shouldUpdate) {
                      _model.timerMilliseconds2 = value;
                      _model.timerValue2 = displayTime;
                      if (shouldUpdate) setState(() {});
                    },
                    onEnded: () async {
                      logFirebaseEvent(
                          'MEDCINET_TABELE_Timer_kyhsqwj7_ON_TIMER_');
                      logFirebaseEvent('Timer_date_time_picker');

                      final _datePicked2Time = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                      );
                      if (_datePicked2Time != null) {
                        setState(() {
                          _model.datePicked2 = DateTime(
                            getCurrentTimestamp.year,
                            getCurrentTimestamp.month,
                            getCurrentTimestamp.day,
                            _datePicked2Time.hour,
                            _datePicked2Time.minute,
                          );
                        });
                      }
                    },
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.81, 0.34),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ff33oyjp' /* Tap for timer  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.94, 0.21),
                  child: Container(
                    width: 160.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Color(0xFF9E9E9E),
                        width: 1.0,
                      ),
                    ),
                    child: FlutterFlowCountController(
                      decrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.minus,
                        color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                        size: 20.0,
                      ),
                      incrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.plus,
                        color: enabled ? Colors.blue : Color(0xFFEEEEEE),
                        size: 20.0,
                      ),
                      countBuilder: (count) => Text(
                        count.toString(),
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      count: _model.countControllerValue3 ??= 0,
                      updateCount: (count) =>
                          setState(() => _model.countControllerValue3 = count),
                      stepSize: 1,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.4, 0.36),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('MEDCINET_TABELE_PAGE_add_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_date_time_picker');

                      final _datePicked3Time = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                      );
                      if (_datePicked3Time != null) {
                        setState(() {
                          _model.datePicked3 = DateTime(
                            getCurrentTimestamp.year,
                            getCurrentTimestamp.month,
                            getCurrentTimestamp.day,
                            _datePicked3Time.hour,
                            _datePicked3Time.minute,
                          );
                        });
                      }
                      logFirebaseEvent('IconButton_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            content: Text('Medicine 2 time set'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.4, -0.12),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('MEDCINET_TABELE_PAGE_add_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_date_time_picker');

                      final _datePicked4Time = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                      );
                      if (_datePicked4Time != null) {
                        setState(() {
                          _model.datePicked4 = DateTime(
                            getCurrentTimestamp.year,
                            getCurrentTimestamp.month,
                            getCurrentTimestamp.day,
                            _datePicked4Time.hour,
                            _datePicked4Time.minute,
                          );
                        });
                      }
                      logFirebaseEvent('IconButton_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            content: Text('Medicine 1 time set'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.4, 0.82),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('MEDCINET_TABELE_PAGE_add_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_date_time_picker');

                      final _datePicked5Time = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                      );
                      if (_datePicked5Time != null) {
                        setState(() {
                          _model.datePicked5 = DateTime(
                            getCurrentTimestamp.year,
                            getCurrentTimestamp.month,
                            getCurrentTimestamp.day,
                            _datePicked5Time.hour,
                            _datePicked5Time.minute,
                          );
                        });
                      }
                      logFirebaseEvent('IconButton_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            content: Text('Medicine 3 time set'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.77, -0.12),
                  child: FlutterFlowTimer(
                    initialTime: _model.timerMilliseconds3,
                    getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        milliSecond: false),
                    timer: _model.timerController3,
                    updateStateInterval: Duration(milliseconds: 1000),
                    onChanged: (value, displayTime, shouldUpdate) {
                      _model.timerMilliseconds3 = value;
                      _model.timerValue3 = displayTime;
                      if (shouldUpdate) setState(() {});
                    },
                    onEnded: () async {
                      logFirebaseEvent(
                          'MEDCINET_TABELE_Timer_8kde3sdm_ON_TIMER_');
                      logFirebaseEvent('Timer_date_time_picker');

                      final _datePicked6Time = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                      );
                      if (_datePicked6Time != null) {
                        setState(() {
                          _model.datePicked6 = DateTime(
                            getCurrentTimestamp.year,
                            getCurrentTimestamp.month,
                            getCurrentTimestamp.day,
                            _datePicked6Time.hour,
                            _datePicked6Time.minute,
                          );
                        });
                      }
                    },
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primary,
                        ),
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
