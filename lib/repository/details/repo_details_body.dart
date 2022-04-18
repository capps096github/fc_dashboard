import '../../fc_exporter.dart';
import 'dashboard/dashboard.dart';
import 'repo_description.dart';

class RepoDetailsBody extends ConsumerWidget {
  const RepoDetailsBody({required this.githubRepoName, Key? key})
      : super(key: key);

  final String githubRepoName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return const RepoContents();

    // githubRepos
    final githubRepo =
        ref.watch(GithubRestApi.githubRepoFromNameProvider(githubRepoName));

    return AnimatedSwitcher(
      duration: halfSeconds,
      child: githubRepo.when(
        data: (GithubRepository repo) => RepoContents(githubRepository: repo),
        loading: () => const FCLoading(progressColor: fcBlue),
        error: (error, stackTrace) => ErrorWidget(error),
      ),
    );
  }
}

class RepoContents extends StatelessWidget {
  const RepoContents({
    Key? key,
    required this.githubRepository,
  }) : super(key: key);

  final GithubRepository githubRepository;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: RepoDescription(githubRepository: githubRepository),
        ),
        RepoDashboard(githubRepository: githubRepository),
      ],
    );
  }
}
