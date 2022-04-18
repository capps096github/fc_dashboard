import '../fc_exporter.dart';
import 'appbar/user_appbar.dart';
import 'body/user_profile_body.dart';
import 'logout_button.dart';

// this is a widget showing the user profile details and logout button

class UserProfile extends ConsumerWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // final appUser = ref.read(calcutAppUserProvider);
    final appUser = currentAppUser;

    return Scaffold(
      backgroundColor: userProfileColor,
      appBar: userProfileAppbar(context: context, user: appUser),
      body: UserProfileBody(user: appUser),
      bottomNavigationBar: (appUser == null) ? null : const LogOutButton(),
    );
  }
}
