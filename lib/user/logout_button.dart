import '../fc_exporter.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: userProfileColor,
      child: AppButton(
        text: "LOGOUT",
        icon: Icons.logout,
        onTap: () async {
          await FirebaseAuth.instance.signOut();
        },
        textColor: userProfileColor,
        buttonColor: fcWhite,
      ),
    );
  }
}
