import 'package:smart_shopping_list/exports.dart';

import '../Widgets/setting_body.dart';

class SettingTabletView extends StatelessWidget {
  const SettingTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).settings)),
      body: Center(child: SizedBox(width: 600, child: SettingBody())),
    );
  }
}
