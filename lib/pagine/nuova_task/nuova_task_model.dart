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

class NuovaTaskModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> selectedTag = [];
  void addToSelectedTag(String item) => selectedTag.add(item);
  void removeFromSelectedTag(String item) => selectedTag.remove(item);
  void removeAtIndexFromSelectedTag(int index) => selectedTag.removeAt(index);
  void updateSelectedTagAtIndex(int index, Function(String) updateFn) =>
      selectedTag[index] = updateFn(selectedTag[index]);

  DateTime? selectedDate;

  String selectedScadenz = 'no';

  DateTime? customOrarioSel;

  Color? selColore;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  Color? colorPicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
