import 'package:intl/intl.dart';

import '../../fc_exporter.dart';

class GithubRepoItem extends StatelessWidget {
  const GithubRepoItem(
      {Key? key, required this.githubRepository, this.heroTagId})
      : super(key: key);

// for some animations
  final String? heroTagId;

  final GithubRepository githubRepository;

  @override
  Widget build(BuildContext context) {
// check if we are on mobile
    final isMobile = FCResponsive.isMobile(context);

    return Container(
      margin: isMobile
          ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
          : const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      constraints: const BoxConstraints(maxHeight: 200),
      decoration: BoxDecoration(
        color: fcWhite,
        border: Border.all(color: fcColor.withOpacity(.5), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        // to details view
        onTap: () => context.go(
            '/repo/${githubRepository.name}?id=${heroTagId ?? githubRepository.id}'),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Heading
            RepoHeader(
                githubRepository: githubRepository, heroTagId: heroTagId),

            //*  Body
            RepoBody(githubRepository: githubRepository),

            // * Footer
            RepoFooter(githubRepository: githubRepository),
          ],
        ),
      ),
    );
  }
}

class RepoFooter extends StatelessWidget {
  const RepoFooter({
    Key? key,
    required this.githubRepository,
  }) : super(key: key);

  final GithubRepository githubRepository;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        // forks
        RepoInfo(
          text: "${githubRepository.forksCount} forks",
          icon: Ionicons.git_network_outline,
          iconColor: fcPurple,
          textColor: fcPurple,
        ),
        const HorizontalSpacing(of: 8),

        // stars
        RepoInfo(
          text: "${githubRepository.stargazersCount} stars",
          icon: Icons.star,
          iconColor: fcRed,
          textColor: fcRed,
        ),
        const HorizontalSpacing(of: 8),

        // watchers
        RepoInfo(
          text: "${githubRepository.watchersCount} watchers",
          icon: Icons.visibility,
          iconColor: fcBlue,
          textColor: fcBlue,
        ),
        const HorizontalSpacing(of: 8),

        // issues
        RepoInfo(
          text: "${githubRepository.openIssuesCount} issues",
          icon: Icons.error_outline,
          iconColor: fcOrange,
          textColor: fcOrange,
        ),
      ],
    );
  }
}

class RepoBody extends StatelessWidget {
  const RepoBody({
    Key? key,
    required this.githubRepository,
  }) : super(key: key);

  final GithubRepository githubRepository;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.only(left: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: const EdgeInsets.only(left: 8),
            decoration: const ShapeDecoration(
              // round the border corners
              shape: Border(
                left: BorderSide(
                  color: fcColor,
                  width: 6,
                ),
              ),
            ),
            child: ExpandedScrollingColumn(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // description
                if (githubRepository.description != null) ...[
                  HighlightedText(
                    text: githubRepository.description!,
                    boldText: 'Description',
                  ),
                  const VerticalSpacing(of: 8),

                  // get the maintainer name from the description starting at the first '@'
                  if (githubRepository.description!.contains('@'))
                    HighlightedText(
                      text: "@${githubRepository.description!.split('@')[1]}",
                      boldText: 'Maintainer',
                      textColor: fcPink,
                    ),
                ],

                const VerticalSpacing(of: 8),

                // date published
                HighlightedText(
                  text: DateFormat('MMM d, yyyy').format(
                    githubRepository.createdAt,
                  ),
                  boldText: 'Created',
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),

                const VerticalSpacing(of: 15),

                // language
                if (githubRepository.language != null)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: fcPink,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      githubRepository.language!,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.spartan(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: fcWhite,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RepoHeader extends StatelessWidget {
  const RepoHeader({
    Key? key,
    required this.githubRepository,
    required this.heroTagId,
  }) : super(key: key);

  final GithubRepository githubRepository;

// for some animations
  final String? heroTagId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Github Icon
        Hero(
          tag: 'repo_title_${heroTagId ?? githubRepository.id}',
          child: const Icon(Ionicons.logo_github, color: fcPink),
        ),

        const HorizontalSpacing(of: 8),

        // title
        Expanded(
          child: Text(
            githubRepository.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: GoogleFonts.spartan(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: fcPink,
            ),
          ),
        ),
        const HorizontalSpacing(of: 8),
        // type, public or private
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: fcPink.withOpacity(.2),
            border: Border.all(color: fcPink, width: 1),
          ),
          child: Text(
            githubRepository.visibility.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.spartan(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: fcPink,
            ),
          ),
        ),
      ],
    );
  }
}

class RepoInfo extends StatelessWidget {
  const RepoInfo({
    Key? key,
    required this.icon,
    required this.text,
    required this.textColor,
    required this.iconColor,
  }) : super(key: key);
  final IconData icon;

  final String text;

  final Color iconColor, textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: iconColor),
        const HorizontalSpacing(of: 4),
        Flexible(
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
