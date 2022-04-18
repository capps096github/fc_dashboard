import '../../fc_exporter.dart';
import '../appbar/user_profile_pic.dart';
import 'rail_provider.dart';

class UserProfileTile extends ConsumerWidget {
  const UserProfileTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //App Theme colorScheme
    final colorScheme = Theme.of(context).colorScheme;
    // final onPrimary = colorScheme.primary;
    final onPrimary = colorScheme.onPrimary;
    const backgroundColor = fcBlue;

    // isRailOpenProvider
    final isRailOpen = ref.watch(isRailOpenProvider.state).state;

    final appUser = currentAppUser;

    // get user details here
    final userName = appUser?.displayName ?? "Flutter Community";

    return AnimatedSwitcher(
      duration: quarterSeconds,
      child: isRailOpen
          ? ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              tileColor: backgroundColor,
              leading: const UserProfilePic(),
              title: Text(
                userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: onPrimary,
                ),
              ),
              contentPadding: const EdgeInsets.all(4),
              onTap: () {
                // Navigate to user details screen
                context.push(userProfilePath);
              },
              trailing: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.verified_rounded,
                  color: onPrimary,
                ),
              ),
            )
          : Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.all(4),
              child: const UserProfilePic(),
            ),
    );
  }
}
