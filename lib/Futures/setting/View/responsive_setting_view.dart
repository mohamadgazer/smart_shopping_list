import 'package:flutter/material.dart';
import 'package:smart_shopping_list/constants/BaseResponsiveWidget.dart';
import 'settingMobileView.dart';
import 'settingTabletView.dart';
import 'settingDesktopView.dart';

class ResponsiveSettingView extends StatelessWidget {
  const ResponsiveSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseResponsiveWidget(
      mobileView: SettingMobileView(),
      tabletView: SettingTabletView(),
      desktopView: SettingDesktopView(),
    );
  }
}
