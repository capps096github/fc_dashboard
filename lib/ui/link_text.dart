import '../fc_exporter.dart';

class LinkText extends StatefulWidget {
  const LinkText({required this.link, this.textColor = fcLinkColor, Key? key})
      : super(key: key);
  final String link;

  final Color textColor;

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  TextDecoration textDecoration = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => setState(() {
        // underline
        textDecoration = TextDecoration.underline;
      }),
      onExit: (_) => setState(() {
        // none
        textDecoration = TextDecoration.none;
      }),
      child: InkWell(
        hoverColor: fcTransparent,
        splashColor: fcTransparent,
        child: Text(
          widget.link,
          style: TextStyle(
            color: widget.textColor,
            decoration: textDecoration,
          ),
        ),
        onTap: () async => await linkLauncher(widget.link),
      ),
    );
  }
}
