import '../fc_exporter.dart';
import '../ui/link_text.dart';

class RepoIntro extends ConsumerWidget {
  const RepoIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // number of repos
    final numberOfRepos = ref.watch(GithubRestApi.githubReposCountProvider.state).state;

    //  check if we are on Desktop
    final isDesktop = FCResponsive.isDesktop(context);

    final homeTitle = ref.read(homeTitleProvider(isDesktop));

    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VerticalSpacing(of: 8),
          Text(
            homeTitle,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.spartan(
              fontSize: isDesktop ? 22.5 : 20,
              color: fcColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalSpacing(of: 8),
          Text(
            "Here is a list of the top $numberOfRepos Flutter Community GitHub repositories.",
            style: GoogleFonts.spartan(
              color: fcColor,
            ),
          ),
          const SectionTitle(
            sectionText: "Repository",
            textColor: fcWhite,
            backgroundColor: fcPink,
          ),
          const LinkText(
              link: "https://github.com/fluttercommunity", textColor: fcPink),
          const ThickHorizontalDivider(dividerColor: fcPink),
        ],
      ),
    );
  }
}

// Greeting
final homeTitleProvider = Provider.family<String, bool>((ref, isDesktop) {
  // date
  final now = DateTime.now();
  final hour = now.hour;

  // app user
  final appUser = currentAppUser;

  // get user details here
  final userName =
      appUser?.displayName?.split(' ').first ?? "Flutter Community";

  final greeting = hour < 12
      ? "Good Morning,\n$userName"
      : hour < 18
          ? "Good Afternoon,\n$userName"
          : "Good Evening,\n$userName";

  // remove \n for desktopGreeting
  final desktopGreeting = hour < 12
      ? "Good Morning, $userName"
      : hour < 18
          ? "Good Afternoon, $userName"
          : "Good Evening, $userName";

  return isDesktop ? desktopGreeting : greeting;
});
