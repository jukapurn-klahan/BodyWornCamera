import 'package:body_camera/app/modules/HomePage/views/home_page_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../flutter_flow/flutter_flow_theme_new.dart';
import '../../HistoryCamera/views/history_camera_view.dart';
import '../../Setting/views/setting_view.dart';
import '../../activity/views/activity_view.dart';
import '../controllers/bottom_navigators_controller.dart';

class BottomNavigatorsView extends GetView<BottomNavigatorsController> {
  const BottomNavigatorsView({super.key});
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;

    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: Color(0xFF0073DD),
        boxShadow: [BoxShadow(blurRadius: 4.0, color: Color(0x1A000000), offset: Offset(0.0, 0.0))],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Scaffold(
        key: controller.scaffoldKey,
        bottomNavigationBar: SizedBox(
          height: 88 + bottom, // give a little extra room to avoid overflow from icon+label stack
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowThemeNew.of(context).customColor5,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 12, offset: const Offset(0, -2))],
            ),
            child: Obx(
              () => BottomNavigationBar(
                currentIndex: controller.navBottomSelectedIndex.value,
                onTap: controller.navigationBottomTapped,
                backgroundColor: Colors.transparent,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
                items: [
                  BottomNavigationBarItem(
                    icon: buildSelectedIconWrapper(index: 0, currentIndex: controller.navBottomSelectedIndex.value, icon: Icons.camera_enhance),
                    label: 'หน้าหลัก',
                  ),
                  BottomNavigationBarItem(
                    icon: buildSelectedIconWrapper(index: 1, currentIndex: controller.navBottomSelectedIndex.value, icon: Icons.history_sharp),
                    label: 'ประวัติ',
                  ),
                  BottomNavigationBarItem(
                    icon: buildSelectedIconWrapper(index: 2, currentIndex: controller.navBottomSelectedIndex.value, icon: Icons.local_activity),
                    label: 'กิจกรรม',
                  ),

                  BottomNavigationBarItem(
                    icon: buildSelectedIconWrapper(index: 3, currentIndex: controller.navBottomSelectedIndex.value, icon: Icons.settings_sharp),
                    label: 'ตั้งค่า',
                  ),
                ],
              ),
            ),
          ),
        ),

        // bottomNavigationBar: SafeArea(
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: Color(0xFF7A0019),
        //       borderRadius: const BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        //       boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 12, offset: const Offset(0, -2))],
        //     ),
        //     child: Obx(
        //       () => BottomNavigationBar(
        //         currentIndex: controller.navBottomSelectedIndex.value,
        //         onTap: controller.navigationBottomTapped,
        //         backgroundColor: Colors.transparent,
        //         elevation: 0,
        //         type: BottomNavigationBarType.fixed,
        //         showSelectedLabels: true,
        //         showUnselectedLabels: true,
        //         selectedItemColor: Colors.white,
        //         unselectedItemColor: Colors.white,
        //         selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        //         unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        //         items: [
        //           BottomNavigationBarItem(
        //             icon: buildSelectedIconWrapper(index: 0, currentIndex: controller.navBottomSelectedIndex.value, icon: Icons.camera_enhance),
        //             label: 'หน้าหลัก',
        //           ),
        //           BottomNavigationBarItem(
        //             icon: buildSelectedIconWrapper(index: 1, currentIndex: controller.navBottomSelectedIndex.value, icon: Icons.history_sharp),
        //             label: 'ประวัติ',
        //           ),

        //           BottomNavigationBarItem(
        //             icon: buildSelectedIconWrapper(index: 2, currentIndex: controller.navBottomSelectedIndex.value, icon: Icons.settings_sharp),
        //             label: 'ตั้งค่า',
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Obx(
                      () => PageView(
                        controller: controller.pageContontroller.value,
                        onPageChanged:
                            (index) => //ScanView()
                                controller.navBottomSelectedIndex.value = index,
                        children: [HomePageView(), HistoryCameraView(), ActivityView(), SettingView()],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSelectedIconWrapper({required int index, required int currentIndex, required IconData icon}) {
    final isSelected = index == currentIndex;

    return isSelected
        ? Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Icon(icon, color: Color(0xFF164874), size: 26),
          )
        : Icon(icon, color: Colors.white, size: 24);
  }
}
