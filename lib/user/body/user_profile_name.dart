import '../../fc_exporter.dart';

class UserProfileName extends StatelessWidget {
  const UserProfileName({
    Key? key,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);
  final String userName;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            userName,
            textAlign: TextAlign.center,
            style: GoogleFonts.spartan(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: userProfiletextColor,
            ),
          ),
          const ThickHorizontalDivider(dividerColor: userProfiletextColor),
          Text(
            userEmail,
            textAlign: TextAlign.center,
            style: GoogleFonts.assistant(
              fontSize: 18,
              color: userProfiletextColor,
            ),
          ),
        ],
      ),
    );
  }
}
