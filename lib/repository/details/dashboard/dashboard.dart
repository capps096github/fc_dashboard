import '../../../fc_exporter.dart';
import 'dashboard_card.dart';

class RepoDashboard extends StatelessWidget {
  const RepoDashboard({
    Key? key,
    required this.githubRepository,
  }) : super(key: key);

  final GithubRepository githubRepository;

  @override
  Widget build(BuildContext context) {
    //  check if we are on Mobile
    final isMobile = FCResponsive.isMobile(context);

    // check if we are on Tablet
    final isTablet = FCResponsive.isTablet(context);

    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverFillRemaining(
        child: Center(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: isMobile
                ? 2
                : isTablet
                    ? 3
                    : 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: [
              // forks
              DashboardCard(
                count: githubRepository.forksCount,
                countTitle: "forks",
                icon: Ionicons.git_network_outline,
                textColor: fcPurple,
              ),

              // stars
              DashboardCard(
                count: githubRepository.stargazersCount,
                countTitle: "stars",
                icon: Icons.star,
                textColor: fcRed,
              ),

              // watchers
              DashboardCard(
                count: githubRepository.watchersCount,
                countTitle: "watchers",
                icon: Icons.visibility,
                textColor: fcBlue,
              ),

              // issues
              DashboardCard(
                count: githubRepository.openIssuesCount,
                countTitle: "issues",
                icon: Icons.error_outline,
                textColor: fcOrange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
