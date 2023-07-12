import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'meetinglist_model.dart';
export 'meetinglist_model.dart';

class MeetinglistWidget extends StatefulWidget {
  const MeetinglistWidget({Key? key}) : super(key: key);

  @override
  _MeetinglistWidgetState createState() => _MeetinglistWidgetState();
}

class _MeetinglistWidgetState extends State<MeetinglistWidget>
    with TickerProviderStateMixin {
  late MeetinglistModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
    'iconOnPageLoadAnimation1': AnimationInfo(
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
    'iconOnPageLoadAnimation2': AnimationInfo(
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
    _model = createModel(context, () => MeetinglistModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'meetinglist'});
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
              logFirebaseEvent('MEETINGLIST_arrow_back_rounded_ICN_ON_TA');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'gz3bkmxj' /* Meeting List  */,
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
                  alignment: AlignmentDirectional(0.0, -0.78),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('MEETINGLIST_Container_t2e8qi50_ON_TAP');
                      logFirebaseEvent('Container_play_sound');
                      _model.soundPlayer ??= AudioPlayer();
                      if (_model.soundPlayer!.playing) {
                        await _model.soundPlayer!.stop();
                      }
                      _model.soundPlayer!.setVolume(1.0);
                      _model.soundPlayer!
                          .setAsset('assets/audios/q09b6_3.mp3')
                          .then((_) => _model.soundPlayer!.play());
                    },
                    child: Container(
                      width: 161.1,
                      height: 161.1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/app_icon.jpg',
                          ).image,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.29),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ia1avdrc' /* If You Want A Meeting with Use... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 20.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'MEETINGLIST_PAGE_CREATE_LINK_BTN_ON_TAP');
                      logFirebaseEvent('Button_launch_u_r_l');
                      await launchURL('https://meet.google.com/');
                    },
                    text: FFLocalizations.of(context).getText(
                      'plijexnp' /* Create Link  */,
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
                  alignment: AlignmentDirectional(0.0, 0.29),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ystu22dt' /* Send the Link To Patient in A ... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF0808AE),
                          fontSize: 20.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.54),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('MEETINGLIST_PAGE_SEND_LINK_BTN_ON_TAP');
                      logFirebaseEvent('Button_send_email');
                      await launchUrl(Uri(
                          scheme: 'mailto',
                          path: 'consultingmedicaldoctor2018@gmail.com',
                          query: {
                            'subject': 'meeting link',
                            'body':
                                'Dear doctor I hope this mail find you well I am sending to you meeting link',
                          }
                              .entries
                              .map((MapEntry<String, String> e) =>
                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                              .join('&')));
                    },
                    text: FFLocalizations.of(context).getText(
                      'efg6q4rw' /* Send Link  */,
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
                  alignment: AlignmentDirectional(-0.01, 0.41),
                  child: FaIcon(
                    FontAwesomeIcons.link,
                    color: Color(0xFF0808AE),
                    size: 40.0,
                  ).animateOnPageLoad(
                      animationsMap['iconOnPageLoadAnimation1']!),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, -0.13),
                  child: FaIcon(
                    FontAwesomeIcons.link,
                    color: Color(0xFF0808AE),
                    size: 40.0,
                  ).animateOnPageLoad(
                      animationsMap['iconOnPageLoadAnimation2']!),
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
                                      'MEETINGLIST_PAGE_Icon_3l944hv1_ON_TAP');
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
                                      'MEETINGLIST_PAGE_heartbeat_ICN_ON_TAP');
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
                                      'MEETINGLIST_PAGE_Icon_k27zg4vs_ON_TAP');
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
                                      'MEETINGLIST_PAGE_Image_mvp5xro0_ON_TAP');
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
                                      'MEETINGLIST_PAGE_Image_g3suh3u6_ON_TAP');
                                  logFirebaseEvent('Image_navigate_to');

                                  context.pushNamed('ThingSpeak_docotor');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/unnamed.png',
                                    width: 40.0,
                                    height: 40.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
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
                                      'MEETINGLIST_PAGE_Icon_94baaheu_ON_TAP');
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
                      ],
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
