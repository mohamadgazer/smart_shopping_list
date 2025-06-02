
import 'package:smart_shopping_list/exports.dart';
import '../Widgets/home_body.dart';

class HomeView extends StatelessWidget {
    const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home View'),
      ),
      body: HomeBody(),
    );
  }
}
  