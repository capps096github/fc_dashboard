import 'package:cached_network_image/cached_network_image.dart';

import '../../fc_exporter.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key, required this.userImageUrl}) : super(key: key);

  final String userImageUrl;

  @override
  Widget build(BuildContext context) {
    // container height
    const double containerHeight = 180;

    return Hero(
      tag: userProfileTag,
      child: Container(
        height: containerHeight,
        width: containerHeight,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: userProfiletextColor.withOpacity(.3),
          border: Border.all(
            color: userProfiletextColor,
            width: 2,
          ),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: CachedNetworkImageProvider(userImageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
