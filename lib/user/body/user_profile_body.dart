import '../../fc_exporter.dart';
import 'user_image.dart';
import 'user_profile_name.dart';

class UserProfileBody extends StatelessWidget {
  const UserProfileBody({Key? key, required this.user}) : super(key: key);
  final User? user;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: userProfileColor,
          expandedHeight: sliverAppBarHeight,
          pinned: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Flutter Community',
            style: GoogleFonts.spartan(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: fcWhite,
            ),
          ),
          centerTitle: true,
        ),
        UserProfileDetails(user: user),
      ],
    );
  }
}

class UserProfileDetails extends ConsumerWidget {
  const UserProfileDetails({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context, ref) {
    // get user details here
    final userName = user?.displayName ?? "Flutter Community Dashboard";
    final userEmail = user?.email ?? "user@fc.app";
    final userImage = user?.photoURL ?? defaultProfilePic;

    return SliverFillRemaining(
      child: ExpandedScrollingColumn(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserImage(userImageUrl: userImage),
          const VerticalSpacing(of: 20),
          UserProfileName(
            userName: userName,
            userEmail: userEmail,
          ),
        ],
      ),
    );
  }
}
