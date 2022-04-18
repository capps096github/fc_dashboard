import '../../fc_exporter.dart';
import 'github_repo_item.dart';

class ReposListView extends StatelessWidget {
  const ReposListView({Key? key, required this.repositories}) : super(key: key);

  final List<GithubRepository> repositories;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // get repo at given index using elementAt
          final repo = repositories.elementAt(index);

          return GithubRepoItem(githubRepository: repo);
        },
        childCount: repositories.length,
      ),
    );
  }
}
