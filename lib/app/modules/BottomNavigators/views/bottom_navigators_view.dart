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
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      key: controller.scaffoldKey,

      backgroundColor: const Color(0xFFF4F7FB),

      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => PageView(
                controller: controller.pageContontroller.value,

                onPageChanged: (index) {
                  controller.navBottomSelectedIndex.value = index;
                },

                children: const [HomePageView(), HistoryCameraView(), ActivityView(), SettingView()],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Obx(
        () => Container(
          padding: EdgeInsets.fromLTRB(16, 12, 16, bottomInset > 0 ? bottomInset : 12),

          decoration: BoxDecoration(
            color: FlutterFlowThemeNew.of(context).customColor5,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),

            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 24, offset: const Offset(0, -6))],
          ),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              _buildNavItem(index: 0, icon: Icons.home_rounded, label: 'หน้าหลัก'),

              _buildNavItem(index: 1, icon: Icons.history_rounded, label: 'ประวัติ'),

              _buildNavItem(index: 2, icon: Icons.local_activity_rounded, label: 'กิจกรรม'),

              _buildNavItem(index: 3, icon: Icons.settings_rounded, label: 'ตั้งค่า'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required int index, required IconData icon, required String label}) {
    final isSelected = controller.navBottomSelectedIndex.value == index;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(24),

        onTap: () => controller.navigationBottomTapped(index),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),

                curve: Curves.easeOut,

                width: isSelected ? 56 : 46,

                height: isSelected ? 56 : 46,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: isSelected ? Colors.white : Colors.white.withOpacity(0.10),

                  border: isSelected
                      ? Border.all(color: const Color(0xFFFFC107), width: 2)
                      : Border.all(color: Colors.white.withOpacity(0.08), width: 1),

                  boxShadow: isSelected ? [BoxShadow(color: Colors.black.withOpacity(0.18), blurRadius: 16, offset: const Offset(0, 6))] : [],
                ),

                child: Icon(icon, size: isSelected ? 27 : 22, color: isSelected ? const Color(0xFF0F223A) : Colors.white70),
              ),

              const SizedBox(height: 7),

              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),

                style: TextStyle(
                  fontSize: isSelected ? 11.5 : 11,

                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,

                  color: isSelected ? Colors.white : Colors.white70,

                  letterSpacing: 0.1,
                ),

                child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
