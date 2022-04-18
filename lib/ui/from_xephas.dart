import '../fc_exporter.dart';

class FromXephas extends StatelessWidget {
  const FromXephas({
    Key? key,
    this.textColor = fcWhite,
    this.builderColor = fcWhite,
    this.heartColor = fcError,
  }) : super(key: key);

  final Color textColor, builderColor, heartColor;

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.assistant(
      color: textColor,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  'Built with ',
                  maxLines: 1,
                  style: textStyle,
                ),
              ),
              Icon(
                Icons.favorite,
                color: heartColor,
                size: 14,
              ),
              Flexible(
                child: Text(
                  ' by ',
                  style: textStyle,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: ThickHorizontalDivider(
                    thickness: 1.5,
                    dividerColor: builderColor,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: openXephasTwitter,
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Brian Cephas',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spartan(
                              fontSize: 14,
                              color: builderColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const HorizontalSpacing(of: 4),
                          Icon(
                            Ionicons.logo_twitter,
                            color: builderColor,
                            size: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: ThickHorizontalDivider(
                    thickness: 1.5,
                    dividerColor: builderColor,
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: opendartGSOC2022,
            child: Text(
              'For Dart GSoC 2022',
              style: textStyle.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
