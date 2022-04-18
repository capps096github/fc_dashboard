import '../../fc_exporter.dart';
import 'github_event_item.dart';

class ActivityListView extends StatelessWidget {
  const ActivityListView({Key? key, required this.events}) : super(key: key);

  final List<GithubEvent> events;

  @override
  Widget build(BuildContext context) {
    return SliverList(
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
