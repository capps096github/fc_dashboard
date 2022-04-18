import '../../fc_exporter.dart';
import 'github_repo_item.dart';

class ReposGridView extends StatelessWidget {
  const ReposGridView({Key? key, required this.repositories}) : super(key: key);

  final List<GithubRepository> repositories;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        mainAxisExtent: 200,
      ),
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
