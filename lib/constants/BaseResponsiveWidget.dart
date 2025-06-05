import 'package:smart_shopping_list/exports.dart';

class BaseResponsiveWidget extends StatelessWidget {
  final Widget mobileView;
  final Widget tabletView;
  final Widget desktopView;

  const BaseResponsiveWidget({
    super.key,
    required this.mobileView,
    required this.tabletView,
    required this.desktopView,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return mobileView;
    if (width < 1200) return tabletView;
    return desktopView;
  }
}
