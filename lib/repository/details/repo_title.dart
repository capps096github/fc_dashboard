import '../../fc_exporter.dart';

class RepoTitle extends StatelessWidget {
  const RepoTitle({Key? key, required this.title}) : super(key: key);
// title
  final String title;

//
  @override
  Widget build(BuildContext context) {
    //  check if we are on Desktop
    final isDesktop = FCResponsive.isDesktop(context);

    // Access the colorscheme
    final colorScheme = Theme.of(context).colorScheme;
   
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedSwitcher(
        duration: quarterSeconds,
        child: Text(
          title,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.spartan(
            fontSize: isDesktop ? 25 : 22.5,
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
