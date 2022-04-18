import '../fc_exporter.dart';
import '../ui/link_text.dart';

class ActivityIntro extends ConsumerWidget {
  const ActivityIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  check if we are on Desktop
    final isDesktop = FCResponsive.isDesktop(context);

    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VerticalSpacing(of: 8),
          Text(
            "Hello",
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
            "Here's what's happening in the Flutter Community Repositories today.",
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
