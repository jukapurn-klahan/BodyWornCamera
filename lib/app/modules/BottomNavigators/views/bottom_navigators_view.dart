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
          padding: EdgeInsets.fromLTRB(14, 10, 14, bottomInset > 0 ? bottomInset : 12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF0F223A), Color(0xFF1C2A44)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildNavItem(context: context, index: 0, icon: Icons.home_rounded, label: 'หน้าหลัก'),
              _buildNavItem(context: context, index: 1, icon: Icons.history_rounded, label: 'ประวัติ'),
              _buildNavItem(context: context, index: 2, icon: Icons.local_activity_rounded, label: 'กิจกรรม'),
              _buildNavItem(context: context, index: 3, icon: Icons.settings_rounded, label: 'ตั้งค่า'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required BuildContext context, required int index, required IconData icon, required String label}) {
    final isSelected = controller.navBottomSelectedIndex.value == index;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () => controller.navigationBottomTapped(index),
        child: SizedBox(
          height: 76,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 260),
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.08),
                  border: Border.all(color: isSelected ? const Color(0xFFFFC107) : Colors.white.withValues(alpha: 0.08)),
                ),
                child: Icon(icon, size: 26, color: isSelected ? const Color(0xFF0F223A) : Colors.white70),
              ),

              const SizedBox(height: 6),

              SizedBox(
                height: 14,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
