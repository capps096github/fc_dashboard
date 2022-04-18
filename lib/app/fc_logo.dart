import '../fc_exporter.dart';

class FCLogo extends StatelessWidget {
  const FCLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fcBlue,
      body: Stack(
        children: [
          Center(
            child: Center(
              child: Image.asset("icons/fc.png"),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: FromXephas(),
          ),
        ],
      ),
    );
  }
}
