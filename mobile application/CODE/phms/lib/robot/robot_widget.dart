import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'robot_model.dart';
export 'robot_model.dart';

class RobotWidget extends StatefulWidget {
  const RobotWidget({Key? key}) : super(key: key);

  @override
  _RobotWidgetState createState() => _RobotWidgetState();
}

class _RobotWidgetState extends State<RobotWidget> {
  late RobotModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RobotModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Robot'});
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
              logFirebaseEvent('ROBOT_PAGE_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'kipuba8y' /* Robot manager */,
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
                  alignment: AlignmentDirectional(-0.9, -0.35),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ROBOT_PAGE_LEFT_BTN_ON_TAP');
                      logFirebaseEvent('Button_haptic_feedback');
                      HapticFeedback.vibrate();
                    },
                    text: FFLocalizations.of(context).getText(
                      'ao7qwsj7' /* Left */,
                    ),
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.9, -0.35),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ROBOT_PAGE_RIGHT_BTN_ON_TAP');
                      logFirebaseEvent('Button_haptic_feedback');
                      HapticFeedback.mediumImpact();
                    },
                    text: FFLocalizations.of(context).getText(
                      '2zvha835' /* Right */,
                    ),
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.15),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ROBOT_PAGE_DOWN_BTN_ON_TAP');
                      logFirebaseEvent('Button_haptic_feedback');
                      HapticFeedback.vibrate();
                    },
                    text: FFLocalizations.of(context).getText(
                      't4oa2qfq' /* Down */,
                    ),
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.55),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('ROBOT_PAGE_FORWARD_BTN_ON_TAP');
                      logFirebaseEvent('Button_haptic_feedback');
                      HapticFeedback.lightImpact();
                    },
                    text: FFLocalizations.of(context).getText(
                      'd7tltxk9' /* Forward */,
                    ),
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.25),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '9sbub3ls' /* medicine table */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 22.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.7),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '1edzcuze' /* Manual movement control */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.95, 0.65),
                  child: Switch(
                    value: _model.switchValue1 ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchValue1 = newValue!);
                      if (newValue!) {
                        logFirebaseEvent(
                            'ROBOT_PAGE_Switch_x8lsygqf_ON_TOGGLE_ON');
                        logFirebaseEvent('Switch_haptic_feedback');
                        HapticFeedback.selectionClick();
                      }
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.54, -0.88),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '44w14a77' /* Turn in bluetooth  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.8, 0.0),
                  child: Switch(
                    value: _model.switchValue2 ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchValue2 = newValue!);
                      if (newValue!) {
                        logFirebaseEvent(
                            'ROBOT_PAGE_Switch_to5gx4my_ON_TOGGLE_ON');
                        logFirebaseEvent('Switch_play_sound');
                        _model.soundPlayer1 ??= AudioPlayer();
                        if (_model.soundPlayer1!.playing) {
                          await _model.soundPlayer1!.stop();
                        }
                        _model.soundPlayer1!.setVolume(1.0);
                        _model.soundPlayer1!
                            .setAsset(
                                'assets/audios/mixkit-car-engine-start-1566.wav')
                            .then((_) => _model.soundPlayer1!.play());

                        logFirebaseEvent('Switch_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              content: Text('auto mode car on'),
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
                      }
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.7, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'q3vcwk4y' /* Automatic movement control */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.9, 0.85),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController1 ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'ihy43otc' /* medicine  1  */,
                      ),
                      FFLocalizations.of(context).getText(
                        'mtnm8jy0' /* medicine  2  */,
                      ),
                      FFLocalizations.of(context).getText(
                        'dwijrpf0' /* medicine  3  */,
                      )
                    ],
                    onChanged: (val) async {
                      setState(() => _model.dropDownValue1 = val);
                      logFirebaseEvent(
                          'ROBOT_DropDown_btg873py_ON_FORM_WIDGET_S');
                      logFirebaseEvent('DropDown_haptic_feedback');
                      HapticFeedback.heavyImpact();
                    },
                    width: 290.0,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'udaootdr' /* Please select medicine   */,
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
                  alignment: AlignmentDirectional(0.6, -0.9),
                  child: Switch(
                    value: _model.switchValue3 ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchValue3 = newValue!);
                      if (newValue!) {
                        logFirebaseEvent(
                            'ROBOT_PAGE_Switch_5j9b7ggo_ON_TOGGLE_ON');
                        logFirebaseEvent('Switch_request_permissions');
                        await requestPermission(bluetoothPermission);
                        logFirebaseEvent('Switch_play_sound');
                        _model.soundPlayer3 ??= AudioPlayer();
                        if (_model.soundPlayer3!.playing) {
                          await _model.soundPlayer3!.stop();
                        }
                        _model.soundPlayer3!.setVolume(1.0);
                        _model.soundPlayer3!
                            .setAsset(
                                'assets/audios/Jbl_!_Bluetooth_Speaker_!_Startup_Sound_!_Notification.mp3')
                            .then((_) => _model.soundPlayer3!.play());
                      } else {
                        logFirebaseEvent(
                            'ROBOT_PAGE_Switch_5j9b7ggo_ON_TOGGLE_OFF');
                        logFirebaseEvent('Switch_play_sound');
                        _model.soundPlayer2 ??= AudioPlayer();
                        if (_model.soundPlayer2!.playing) {
                          await _model.soundPlayer2!.stop();
                        }
                        _model.soundPlayer2!.setVolume(1.0);
                        _model.soundPlayer2!
                            .setAsset(
                                'assets/audios/Jbl_!_Bluetooth_Speaker_!_Startup_Sound_!_Notification.mp3')
                            .then((_) => _model.soundPlayer2!.play());
                      }
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.9, 0.45),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController2 ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'n6lffyf6' /* medicine  1  */,
                      ),
                      FFLocalizations.of(context).getText(
                        'cad5fdbx' /* medicine  2  */,
                      ),
                      FFLocalizations.of(context).getText(
                        '5rc8g13c' /* medicine  3  */,
                      )
                    ],
                    onChanged: (val) async {
                      setState(() => _model.dropDownValue2 = val);
                      logFirebaseEvent(
                          'ROBOT_DropDown_z0t2edlb_ON_FORM_WIDGET_S');
                      logFirebaseEvent('DropDown_haptic_feedback');
                      HapticFeedback.heavyImpact();
                    },
                    width: 290.0,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'yzuaroz2' /* Please select medicine   */,
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
                    isSearchable: true,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.95, 0.85),
                  child: Switch(
                    value: _model.switchValue4 ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchValue4 = newValue!);
                      if (newValue!) {
                        logFirebaseEvent(
                            'ROBOT_PAGE_Switch_nuefzcjb_ON_TOGGLE_ON');
                        logFirebaseEvent('Switch_haptic_feedback');
                        HapticFeedback.selectionClick();
                      }
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.9, 0.65),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController3 ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'wgfztto2' /* medicine  1  */,
                      ),
                      FFLocalizations.of(context).getText(
                        'r8g24a7b' /* medicine  2  */,
                      ),
                      FFLocalizations.of(context).getText(
                        'hw7thcyg' /* medicine  3  */,
                      )
                    ],
                    onChanged: (val) async {
                      setState(() => _model.dropDownValue3 = val);
                      logFirebaseEvent(
                          'ROBOT_DropDown_ka956sdi_ON_FORM_WIDGET_S');
                      logFirebaseEvent('DropDown_haptic_feedback');
                      HapticFeedback.heavyImpact();
                    },
                    width: 290.0,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 15.0,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'nkd0v8vl' /* Please select medicine   */,
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.table,
                    ),
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  alignment: AlignmentDirectional(0.95, 0.45),
                  child: Switch(
                    value: _model.switchValue5 ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchValue5 = newValue!);
                      if (newValue!) {
                        logFirebaseEvent(
                            'ROBOT_PAGE_Switch_ueqtxfmi_ON_TOGGLE_ON');
                        logFirebaseEvent('Switch_haptic_feedback');
                        HapticFeedback.selectionClick();
                      }
                    },
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
