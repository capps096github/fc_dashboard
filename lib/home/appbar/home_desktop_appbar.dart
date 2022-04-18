import '../../fc_exporter.dart';
import 'title_banner.dart';

///This is the app bar of the home screen
AppBar homeDesktopAppBar({
  required WidgetRef ref,
  required BuildContext context,
}) {
  //
  return AppBar(
    automaticallyImplyLeading: false,
    title: Image.asset(
      "icons/fc.png",
      height: 40,
      width: 40,
    ),
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(
        kToolbarHeight,
      ),
      child: TitleBanner(),
    ),
  );
}
