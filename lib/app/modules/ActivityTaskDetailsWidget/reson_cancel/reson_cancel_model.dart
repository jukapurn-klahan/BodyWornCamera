import '../../../../flutter_flow/flutter_flow_model.dart';
import 'reson_cancel_widget.dart' show ResonCancelWidget;
import 'package:flutter/material.dart';

class ResonCancelModel extends FlutterFlowModel<ResonCancelWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
