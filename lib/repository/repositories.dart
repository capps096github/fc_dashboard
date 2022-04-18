import '../fc_exporter.dart';
import 'body/exporter.dart';
import 'repo_intro.dart';

class Repositories extends ConsumerWidget {
  const Repositories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // githubRepos
    final githubRepos = ref.watch(GithubRestApi.githubReposProvider);

    // check if we are on desktop
    final isDesktop = FCResponsive.isDesktop(context);

    final isMobile = FCResponsive.isMobile(context);

    return AnimatedSwitcher(
      duration: halfSeconds,
      child: githubRepos.when(
        data: (List<GithubRepository> repositories) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomScrollView(
              slivers: [
                const RepoIntro(),
                (isDesktop)
                    ? ReposGridView(repositories: repositories)
                    : ReposListView(repositories: repositories),

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
