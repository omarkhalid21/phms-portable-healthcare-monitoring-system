import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'doctor_measurements_model.dart';
export 'doctor_measurements_model.dart';

class DoctorMeasurementsWidget extends StatefulWidget {
  const DoctorMeasurementsWidget({Key? key}) : super(key: key);

  @override
  _DoctorMeasurementsWidgetState createState() =>
      _DoctorMeasurementsWidgetState();
}

class _DoctorMeasurementsWidgetState extends State<DoctorMeasurementsWidget>
    with TickerProviderStateMixin {
  late DoctorMeasurementsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'buttonOnPageLoadAnimation1': AnimationInfo(
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
    'videoPlayerOnPageLoadAnimation': AnimationInfo(
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
    'buttonOnPageLoadAnimation2': AnimationInfo(
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
    'buttonOnPageLoadAnimation3': AnimationInfo(
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
    _model = createModel(context, () => DoctorMeasurementsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DoctorMeasurements'});
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
              logFirebaseEvent('DOCTOR_MEASUREMENTS_arrow_back_rounded_I');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '7ehfb82u' /* Measurements  */,
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
                  alignment: AlignmentDirectional(0.0, 0.65),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'DOCTOR_MEASUREMENTS_REAUEST_DATA_FROM_PA');
                      logFirebaseEvent('Button_send_email');
                      await launchUrl(Uri(
                          scheme: 'mailto',
                          path: 'PHMS.HELP.RPM@gmail.com',
                          query: {
                            'subject': 'Request id of the pateint ',
                            'body':
                                'I want your id to monitor your mesurment real time ',
                          }
                              .entries
                              .map((MapEntry<String, String> e) =>
                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                              .join('&')));
                    },
                    text: FFLocalizations.of(context).getText(
                      'e3eyt8vo' /* Reauest data from patient  */,
                    ),
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 50.0,
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
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['buttonOnPageLoadAnimation1']!),
                ),
                Align(
                  alignment: AlignmentDirectional(0.85, -0.93),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'DOCTOR_MEASUREMENTS_Icon_enwpr7dq_ON_TAP');
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
                  alignment: AlignmentDirectional(0.0, -0.5),
                  child: FlutterFlowVideoPlayer(
                    path: 'assets/videos/20230405_031828.mp4',
                    videoType: VideoType.asset,
                    width: 350.0,
                    autoPlay: false,
                    looping: true,
                    showControls: true,
                    allowFullScreen: true,
                    allowPlaybackSpeedMenu: false,
                  ).animateOnPageLoad(
                      animationsMap['videoPlayerOnPageLoadAnimation']!),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.13),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'mni92e2w' /* To check Measurements for from... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.5),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'pqumvf7i' /* To request data history */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.72),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'bpvski1y' /* explain how to check and get d... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: 400.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.6, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DOCTOR_MEASUREMENTS_Icon_ewusy3eq_ON_TAP');
                                  logFirebaseEvent('Icon_navigate_to');

                                  context.pushNamed('meetinglist');
                                },
                                child: Icon(
                                  Icons.list_alt,
                                  color: Colors.black,
                                  size: 28.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.12, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: FaIcon(
                                  FontAwesomeIcons.heartbeat,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'DOCTOR_MEASUREMENTS_heartbeat_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.pushNamed('DoctorMeasurements');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.25, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DOCTOR_MEASUREMENTS_Icon_fbca9vw5_ON_TAP');
                                  logFirebaseEvent('Icon_navigate_to');

                                  context.pushNamed('DoctorMapping');
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.map,
                                  color: Colors.black,
                                  size: 28.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.5, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DOCTOR_MEASUREMENTS_Image_rwuhg0es_ON_TA');
                                  logFirebaseEvent('Image_navigate_to');

                                  context.pushNamed('firebase_doctor');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/png-transparent-firebase-cloud-messaging-computer-icons-google-cloud-messaging-android-angle-triangle-computer-programming.png',
                                    width: 38.0,
                                    height: 38.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.9, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DOCTOR_MEASUREMENTS_Image_eiegv62a_ON_TA');
                                  logFirebaseEvent('Image_navigate_to');

                                  context.pushNamed('ThingSpeak_docotor');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/unnamed.png',
                                    width: 38.0,
                                    height: 40.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.9, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'DOCTOR_MEASUREMENTS_Icon_3bf4nbud_ON_TAP');
                              logFirebaseEvent('Icon_navigate_to');

                              context.pushNamed('ContactPatient');
                            },
                            child: Icon(
                              Icons.contact_phone_outlined,
                              color: Colors.black,
                              size: 28.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.75, 0.28),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'DOCTOR_MEASUREMENTS_FIREBASE_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('firebase_doctor');
                    },
                    text: FFLocalizations.of(context).getText(
                      'i0g6wl1t' /* Firebase */,
                    ),
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 50.0,
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
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['buttonOnPageLoadAnimation2']!),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.75, 0.28),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'DOCTOR_MEASUREMENTS_THINGSPEAK_BTN_ON_TA');
                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed('ThingSpeak_docotor');
                    },
                    text: FFLocalizations.of(context).getText(
                      '6kztmu7s' /* Thingspeak */,
                    ),
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 50.0,
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
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['buttonOnPageLoadAnimation3']!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
