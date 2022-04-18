import '../../fc_exporter.dart';

class RepoDescription extends StatelessWidget {
  const RepoDescription({Key? key, required this.githubRepository})
      : super(key: key);

  final GithubRepository githubRepository;

  @override
  Widget build(BuildContext context) {
    //  check if we are on mobile
    final isMobile = FCResponsive.isMobile(context);

    if ((githubRepository.description != null)) {
      // get the description before the word Maintainer is encountered
      final description =
          githubRepository.description?.split('Maintainer').first;

      return Container(
        decoration: const BoxDecoration(
          color: fcBlue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                description ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: fcWhite,
                  fontWeight: FontWeight.w400,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
            ),
            const VerticalSpacing(of: 8),

            // get the maintainer name from the description starting at the first '@'
            if (githubRepository.description!.contains('@'))
              Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: fcWhite,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: HighlightedText(
                  text: "@${githubRepository.description!.split('@')[1]}",
                  boldText: 'Maintainer',
                  boldTextColor: fcBlue,
                  textColor: fcPink,
                ),
              ),

            AppButton(
              text: "VIEW ON GITHUB",
              onTap: () => linkLauncher(githubRepository.htmlUrl),
              icon: Ionicons.logo_github,
              textColor: fcWhite,
              buttonColor: fcBlack,
            ),

            const ThickHorizontalDivider(
              dividerColor: fcWhite,
              thickness: 5,
              dividerWidth: 50,
            ),
          ],
        ),
      );
    } else {
      return const EmptySpace();
    }
  }
}
