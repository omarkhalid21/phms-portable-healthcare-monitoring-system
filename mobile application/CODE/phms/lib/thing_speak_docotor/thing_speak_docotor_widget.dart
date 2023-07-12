import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'thing_speak_docotor_model.dart';
export 'thing_speak_docotor_model.dart';

class ThingSpeakDocotorWidget extends StatefulWidget {
  const ThingSpeakDocotorWidget({Key? key}) : super(key: key);

  @override
  _ThingSpeakDocotorWidgetState createState() =>
      _ThingSpeakDocotorWidgetState();
}

class _ThingSpeakDocotorWidgetState extends State<ThingSpeakDocotorWidget> {
  late ThingSpeakDocotorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThingSpeakDocotorModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ThingSpeak_docotor'});
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
        drawer: Drawer(
          elevation: 16.0,
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Stack(
                    children: [
                      FlutterFlowRadioButton(
                        options: [
                          FFLocalizations.of(context).getText(
                            'z7r8t6cq' /* Chat with me */,
                          )
                        ].toList(),
                        onChanged: (val) => setState(() {}),
                        controller: _model.radioButtonValueController1 ??=
                            FormFieldController<String>(null),
                        optionHeight: 32.0,
                        textStyle: FlutterFlowTheme.of(context).labelMedium,
                        selectedTextStyle:
                            FlutterFlowTheme.of(context).bodyMedium,
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.vertical,
                        radioButtonColor: FlutterFlowTheme.of(context).primary,
                        inactiveRadioButtonColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.start,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                      FlutterFlowRadioButton(
                        options: [
                          FFLocalizations.of(context).getText(
                            'fa8rkhq0' /* Generate a Key */,
                          )
                        ].toList(),
                        onChanged: (val) => setState(() {}),
                        controller: _model.radioButtonValueController2 ??=
                            FormFieldController<String>(null),
                        optionHeight: 32.0,
                        textStyle: FlutterFlowTheme.of(context).labelMedium,
                        selectedTextStyle:
                            FlutterFlowTheme.of(context).bodyMedium,
                        buttonPosition: RadioButtonPosition.left,
                        direction: Axis.vertical,
                        radioButtonColor: FlutterFlowTheme.of(context).primary,
                        inactiveRadioButtonColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        toggleable: false,
                        horizontalAlignment: WrapAlignment.start,
                        verticalAlignment: WrapCrossAlignment.start,
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.02, -0.88),
                        child: FlutterFlowRadioButton(
                          options: [
                            FFLocalizations.of(context).getText(
                              'fy2xlxfx' /* Call support */,
                            )
                          ].toList(),
                          onChanged: (val) => setState(() {}),
                          controller: _model.radioButtonValueController3 ??=
                              FormFieldController<String>(null),
                          optionHeight: 32.0,
                          textStyle: FlutterFlowTheme.of(context).labelMedium,
                          selectedTextStyle:
                              FlutterFlowTheme.of(context).bodyMedium,
                          buttonPosition: RadioButtonPosition.left,
                          direction: Axis.vertical,
                          radioButtonColor:
                              FlutterFlowTheme.of(context).primary,
                          inactiveRadioButtonColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          toggleable: false,
                          horizontalAlignment: WrapAlignment.start,
                          verticalAlignment: WrapCrossAlignment.start,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.95, -0.59),
                        child: Container(
                          width: 299.0,
                          height: 53.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
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
              logFirebaseEvent('THING_SPEAK_DOCOTOR_arrow_back_rounded_I');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'h8yi9qd2' /* Thingspeak */,
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
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 521.0,
                        height: 690.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFE3F2F5),
                        ),
                        child: FlutterFlowWebView(
                          content: 'https://thingspeak.com/channels/2058642',
                          bypass: false,
                          width: 360.0,
                          height: 685.0,
                          verticalScroll: false,
                          horizontalScroll: false,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Container(
                          width: 400.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-0.9, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'THING_SPEAK_DOCOTOR_Icon_7hr68lfg_ON_TAP');
                                    logFirebaseEvent('Icon_navigate_to');

                                    context.pushNamed('ContactPatient');
                                  },
                                  child: Icon(
                                    Icons.contact_phone_outlined,
                                    color: Colors.black,
                                    size: 24.0,
                                  ),
                                ),
                              ),
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
                                            'THING_SPEAK_DOCOTOR_Icon_26dhe6x2_ON_TAP');
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
                                    alignment: AlignmentDirectional(0.04, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
                                      icon: FaIcon(
                                        FontAwesomeIcons.heartbeat,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'THING_SPEAK_DOCOTOR_heartbeat_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_navigate_to');

                                        context.pushNamed('DoctorMeasurements');
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.3, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'THING_SPEAK_DOCOTOR_Icon_tc8xde0p_ON_TAP');
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
                                    alignment: AlignmentDirectional(0.38, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'THING_SPEAK_DOCOTOR_Image_xc1w6uvo_ON_TA');
                                        logFirebaseEvent('Image_navigate_to');

                                        context.pushNamed('firebase_doctor');
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/hv3vp_R.png',
                                          width: 50.0,
                                          height: 50.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.9, 0.0),
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
