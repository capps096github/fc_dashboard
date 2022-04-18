import 'dart:math';

import 'package:intl/intl.dart';

import '../../fc_exporter.dart';
import '../../repository/body/github_repo_item.dart';

class GithubEventItem extends StatelessWidget {
  const GithubEventItem({Key? key, required this.githubEvent})
      : super(key: key);

  final GithubEvent githubEvent;

  @override
  Widget build(BuildContext context) {
    // check if we are on mobile
    final isMobile = FCResponsive.isMobile(context);

    final randomTileColor = fcColors[Random().nextInt(fcColors.length)];

    return AnimatedContainer(
      duration: quarterSeconds,
      margin: isMobile
          ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
          : const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      constraints: const BoxConstraints(maxHeight: 350),
      decoration: BoxDecoration(
        color: fcWhite,
        border: Border.all(color: randomTileColor.withOpacity(.5), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          //  do something
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Heading
            EventHeader(githubEvent: githubEvent, eventColor: randomTileColor),

            //*  Body
            EventBody(
              githubEvent: githubEvent,
              eventColor: randomTileColor,
            ),
          ],
        ),
      ),
    );
  }
}

class EventHeader extends StatelessWidget {
  const EventHeader({
    Key? key,
    required this.githubEvent,
    required this.eventColor,
  }) : super(key: key);

  final GithubEvent githubEvent;
  final Color eventColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Github Icon
        Icon(Ionicons.logo_github, color: eventColor),

        const HorizontalSpacing(of: 8),

        // title
        Expanded(
          child: Text(
            "#${githubEvent.id} - ${githubEvent.actor.displayLogin} ${githubEvent.type}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: GoogleFonts.spartan(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: eventColor,
            ),
          ),
        ),
        const HorizontalSpacing(of: 8),
        // type, public or private
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: eventColor,
            border: Border.all(color: eventColor, width: 1),
          ),
          child: Text(
            "#${githubEvent.type}",
            textAlign: TextAlign.center,
            style: GoogleFonts.spartan(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: fcWhite,
            ),
          ),
        ),
      ],
    );
  }
}

class EventBody extends StatelessWidget {
  const EventBody({
    Key? key,
    required this.githubEvent,
    required this.eventColor,
  }) : super(key: key);

  final GithubEvent githubEvent;
  final Color eventColor;

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
            decoration: ShapeDecoration(
              // round the border corners
              shape: Border(
                left: BorderSide(
                  color: eventColor,
                  width: 6,
                ),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // date published
                HighlightedText(
                  text: DateFormat('MMM d, yyyy').format(
                    githubEvent.createdAt,
                  ),
                  boldText: "Happened on",
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),

                const VerticalSpacing(of: 8),

                const HighlightedText(text: ": ", boldText: "Repository"),

                // repo
                EventRepo(
                  githubEvent: githubEvent,
                  eventColor: eventColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventRepo extends ConsumerWidget {
  const EventRepo({
    required this.githubEvent,
    required this.eventColor,
    Key? key,
  }) : super(key: key);

  final GithubEvent githubEvent;
  final Color eventColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // githubRepos
    final githubRepo = ref
        .watch(GithubRestApi.githubRepoFromUrlProvider(githubEvent.repo.url));

    return AnimatedSwitcher(
      duration: halfSeconds,
      child: githubRepo.when(
        data: (GithubRepository repo) => GithubRepoItem(
          githubRepository: repo,
          heroTagId: githubEvent.id,
        ),
        loading: () => FCLoading(
          imageHeight: 20,
          progressDiameter: 44,
          progressColor: eventColor,
        ),
        error: (error, stackTrace) => ErrorWidget(error),
      ),
    );
  }
}
