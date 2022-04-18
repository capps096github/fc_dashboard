import '../fc_exporter.dart';
import 'activity_intro.dart';
import 'body/exporter.dart';

class Activity extends ConsumerWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // githubRepos
    final githubRepos = ref.watch(GithubRestApi.githubEventsProvider);

    // check if we are on desktop
    final isDesktop = FCResponsive.isDesktop(context);

    final isMobile = FCResponsive.isMobile(context);

    return AnimatedSwitcher(
      duration: halfSeconds,
      child: githubRepos.when(
        data: (List<GithubEvent> events) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomScrollView(
              slivers: [
                const ActivityIntro(),
                (isDesktop)
                    ? ActivityGridView(events: events)
                    : ActivityListView(events: events),

                //This will be at the bottom of the list covered by the bottom Nav Bar
                if (isMobile) const SliverVerticalSpacing(of: 80),
              ],
            ),
          );
        },
        loading: () => const FCLoading(),
        error: (error, stackTrace) => ErrorWidget(error),
      ),
    );
  }
}
