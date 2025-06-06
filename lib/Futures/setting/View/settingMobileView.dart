import 'package:flutter/material.dart';
import 'package:smart_shopping_list/generated/l10n.dart';

import '../Widgets/setting_body.dart';

class SettingMobileView extends StatelessWidget {
  const SettingMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: SettingBody(),
    );
  }
}
