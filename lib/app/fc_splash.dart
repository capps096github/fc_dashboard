import '../fc_exporter.dart';

class FCSplash extends StatelessWidget {
  const FCSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fcColor,
      body: ExpandedScrollingColumn(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                "icons/fc.png",
                height: 80,
                width: 80,
              ),
            ),
          ),
          const VerticalSpacing(of: 4),
          // from THE C APPS TEAM
          const FromXephas(),
        ],
      ),
    );
  }
}
