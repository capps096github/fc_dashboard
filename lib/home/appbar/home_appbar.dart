import '../../fc_exporter.dart';
import 'title_banner.dart';
import 'user_profile_pic.dart';

///This is the app bar of the home screen
AppBar homeAppBar({
  required WidgetRef ref,
  required BuildContext context,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: const UserProfilePic(),
    title: Hero(
      tag: 'repo_title',
      child: Image.asset(
        "icons/fc.png",
        height: 40,
        width: 40,
      ),
    ),
    bottom: const PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: TitleBanner(),
    ),
  );
}
