import '../fc_exporter.dart';
import 'navbar/fc_nav_bar.dart';

///This is the Navbar of the Home Screen and it calls upon the [FluidNavBar]
class HomeNavBar extends StatelessWidget {
  const HomeNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FCNavBar();
  }
}
