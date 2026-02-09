import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';
import 'package:testing_front_end_dev/app/modules/casher/views/casher_view.dart';
import 'package:testing_front_end_dev/app/modules/dashboard/views/dashboard_view.dart';
import 'package:testing_front_end_dev/app/modules/home/controllers/home_controller.dart';
import 'package:testing_front_end_dev/app/modules/home/views/widget/sidebar.dart';
import 'package:testing_front_end_dev/app/modules/menu/views/menu_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: bgColor,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: bgsecondColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              width: 104,
              child: SideBar(),
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.changePage(index);
                },
                children: [CasherView(), DashboardView(), MenuView()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
