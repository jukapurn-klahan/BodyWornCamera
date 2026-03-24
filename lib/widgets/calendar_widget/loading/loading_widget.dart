import 'package:lottie/lottie.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {

  @override
  void initState() {
    super.initState();

  //  WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: const BoxDecoration(),
        child: Lottie.asset(
          'assets/jsons/Dowload.json',
          width: 200.0,
          height: 200.0,
          fit: BoxFit.contain,
          animate: true,
        ),
      ),
    );
  }
}
