import '../../fc_exporter.dart';
import 'repo_details_body.dart';
import 'repo_title.dart';

class RepoDetails extends StatelessWidget {
  const RepoDetails({
    Key? key,
    required this.githubRepoId,
    required this.githubRepoName,
  }) : super(key: key);

// this is got from Url
  final String githubRepoName;

// this from the query extras
  final int githubRepoId;

  @override
  Widget build(BuildContext context) {
    // acess Repo from Index

    return Scaffold(
      appBar: AppBar(
        backgroundColor: fcBlue,
        automaticallyImplyLeading: false,
        leading: BackButton(onPressed: () {
          // clear the queryParams
          context.go(homePath);
        }),
        title: Hero(
          tag: 'repo_title_$githubRepoId',
          child: Image.asset(
            "icons/fc.png",
            height: 40,
            width: 40,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: RepoTitle(title: githubRepoName),
        ),
      ),
      body: RepoDetailsBody(githubRepoName: githubRepoName),
      
    );
  }
}
