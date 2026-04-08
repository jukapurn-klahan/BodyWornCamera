import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart' as map2;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latlng2;

import '../../../../utils/app_info_utils.dart';

class ActivityTaskDetailsWidgetController extends GetxController {
  //TODO: Implement ActivityTaskDetailsWidgetController

  // State field(s) for TextField widget.
  final scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;
  late ExpandableController expandableExpandableController2;
  RxBool checkboxValue = false.obs;
  final count = 0.obs;
  latlng2.LatLng latLng = const latlng2.LatLng(13.674236, 100.509118);
  map2.MapController mapController = map2.MapController();
  final markersMap = <map2.Marker>[].obs;
  final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  final RxString packageName = AppInfoUtils.cachedPackageName.obs;

  String get tileUserAgentPackageName => packageName.value;

  @override
  void onInit() {
    super.onInit();

    expandableExpandableController1 = ExpandableController(initialExpanded: true);
    expandableExpandableController2 = ExpandableController(initialExpanded: true);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await _loadTileUserAgentPackageName();
    await _getLocation();
  }

  Future<void> _loadTileUserAgentPackageName() async {
    packageName.value = AppInfoUtils.cachedPackageName;

    if (packageName.value == 'unknown') {
      packageName.value = await AppInfoUtils.getPackageName();
    }

    log('PackageName $packageName');
  }

  Future<void> _getLocation() async {
    markersMap.clear();

    markersMap.add(
      map2.Marker(
        height: 40,
        width: 40,
        builder: (context) => Align(alignment: const AlignmentDirectional(0.0, 0.0), child: Image.asset('assets/images/pin_red.png')),
        point: latLng,
      ),
    );
    mapController.move(latLng, 15);
    log('latitude2 $latLng');
  }

  void increment() => count.value++;
}
