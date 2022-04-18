import '../../../fc_exporter.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key? key,
    this.bgColor = fcWhite,
    this.textColor = fcColor,
    required this.count,
    required this.countTitle,
    required this.icon,
  }) : super(key: key);

  final Color bgColor, textColor;

  // count
  final int count;

  // title
  final String countTitle;

  // icon
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 600),
      width: 200,
      height: 200,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: textColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: textColor.withOpacity(.5),
        ),
      ),

      // material for splash effect
      child: Material(
        color: fcTransparent,
        child: InkWell(
          splashColor: fcColor,
          hoverColor: fcColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(8),
          highlightColor: fcColor.withOpacity(.4),
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      size: 50,
                      color: fcWhite.withOpacity(.5),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      count.toString(),
                      style: GoogleFonts.spartan(
                        fontSize: 50,
                        color: fcWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ThickHorizontalDivider(dividerColor: fcWhite),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        countTitle,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                        style: GoogleFonts.spartan(
                          color: fcWhite,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
