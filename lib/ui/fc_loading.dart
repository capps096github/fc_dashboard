import '../fc_exporter.dart';

class FCLoading extends StatelessWidget {
  const FCLoading({
    Key? key,
    this.imageHeight = 56,
    this.progressDiameter = 80,
    this.progressColor = fcColor,
  }) : super(key: key);

  final double? imageHeight, progressDiameter;
  
  // color of progress indicator
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Image.asset(
            "icons/fc.png",
            height: imageHeight,
            width: imageHeight,
          ),
        ),
        SizedBox(
          height: progressDiameter,
          width: progressDiameter,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(progressColor),
          ),
        ),
      ],
    );
  }
}
