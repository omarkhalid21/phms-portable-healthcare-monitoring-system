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

class MedcinetTabeleModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for Timer widget.
  int timerMilliseconds1 = 28800000;
  String timerValue1 =
      StopWatchTimer.getDisplayTime(28800000, milliSecond: false);
  StopWatchTimer timerController1 =
      StopWatchTimer(mode: StopWatchMode.countDown);

  DateTime? datePicked1;
  // State field(s) for CountController widget.
  int? countControllerValue1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for CountController widget.
  int? countControllerValue2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for Timer widget.
  int timerMilliseconds2 = 14500000;
  String timerValue2 =
      StopWatchTimer.getDisplayTime(14500000, milliSecond: false);
  StopWatchTimer timerController2 =
      StopWatchTimer(mode: StopWatchMode.countDown);

  DateTime? datePicked2;
  // State field(s) for CountController widget.
  int? countControllerValue3;
  DateTime? datePicked3;
  DateTime? datePicked4;
  DateTime? datePicked5;
  // State field(s) for Timer widget.
  int timerMilliseconds3 = 5400000;
  String timerValue3 =
      StopWatchTimer.getDisplayTime(5400000, milliSecond: false);
  StopWatchTimer timerController3 =
      StopWatchTimer(mode: StopWatchMode.countDown);

  DateTime? datePicked6;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    timerController1.dispose();
    timerController2.dispose();
    timerController3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
