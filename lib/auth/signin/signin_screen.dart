import '../../fc_exporter.dart';
import 'signin_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandedScrollingColumn(
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

        // auth button
        const GithubAuthButton(),
        const VerticalSpacing(of: 4),
        // from THE C APPS TEAM
        const FromXephas(),
      ],
    );
  }
}
