import '../fc_exporter.dart';

// this bolds one section of text and leaves the other as is
class HighlightedText extends StatelessWidget {
  const HighlightedText({
    Key? key,
    required this.text,
    required this.boldText,
    this.textColor = fcColor,
    this.boldTextColor = fcColor,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  final String text, boldText;
  final Color textColor, boldTextColor;

  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            boldText + ":",
            textAlign: TextAlign.start,
            style: GoogleFonts.spartan(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.start,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.spartan(
                fontSize: 12,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
