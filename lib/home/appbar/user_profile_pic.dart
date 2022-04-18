import 'package:cached_network_image/cached_network_image.dart';

import '../../fc_exporter.dart';

class UserProfilePic extends ConsumerWidget {
  const UserProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //App Theme colorScheme
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = colorScheme.background;

    // final appUser = ref.read(calcutAppUserProvider);
    final appUser = currentAppUser;
    final userProfilePic = appUser?.photoURL ?? defaultProfilePic;

    // this will take in an id that will check for the user profile from our firebase database

    return InkWell(
      onTap: () {
        // Navigate to user details screen
        context.push(userProfilePath);
      },
      customBorder: const CircleBorder(),
      child: Ink(
        child: Stack(
          children: [
            Hero(
              tag: userProfileTag,
              child: Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(.3),
                  border: Border.all(
                    color: fcOnline.withOpacity(.8),
                    width: 1.5,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: fcBackground.withOpacity(.3),
                  backgroundImage: CachedNetworkImageProvider(userProfilePic),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 8,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: fcOnline,
                  border: Border.all(
                    color: fcOnline,
                    width: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
