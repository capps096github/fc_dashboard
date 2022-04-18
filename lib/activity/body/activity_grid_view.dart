import '../../fc_exporter.dart';
import 'github_event_item.dart';

class ActivityGridView extends StatelessWidget {
  const ActivityGridView({Key? key, required this.events}) : super(key: key);

  final List<GithubEvent> events;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        mainAxisExtent: 350,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // get events at given index using elementAt
          final event = events.elementAt(index);

          return GithubEventItem(githubEvent: event);
        },
        childCount: events.length,
      ),
    );
  }
}
